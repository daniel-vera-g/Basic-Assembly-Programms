include reg51.inc
; Autor    : Daniel Vera gilliard
; Beschreibung: Ein lauflicht, welches durch ein Timer erhöht wird
; Es werden Timer flags genutzt
;---------------------------------------------------------------

; Programmbeginn
        JMP INIT ; Interrupts Überspringen

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Interruptbehandlungsroutine Timer 0
timer0_int:
        RL A ;Akku nach links rotieren
        CJNE A, #10000000b, ende
        MOV A, #1d
        ende:
        CLR TF0
        mov TL0,#0xDC ;Startwert festlegen
        mov TH0,#0xFF
        jmp main

; Initialisierung
;---------------------------------------------------------------
INIT:

;Variablen
        Mov A, #1d ;Lauflicht auf 1 setzen

; Timer 0 aktivieren
;  Intervall: x.xx ms
        mov TL0,#0xDC 
        mov TH0,#0xFF

; die SFR's initialisieren
        mov TMOD,#00000001b ;Timer einschalten
        mov TCON,#00010000b ;Timer konfigurieren & starten
        
jmp main

; Hauptprogramm
;---------------------------------------------------------------
main:
Mov P0, A ;Wert von Akku auf das Lauflicht anzeigen

; Interrupt flag abfragen
interruptAbfrage:
        JB TF0, timer0_int ;Wenn Timerflag gesetzt führen

jmp main ;Endloschleife
