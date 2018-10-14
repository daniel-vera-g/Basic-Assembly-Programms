include reg51.inc
; Autor    : Daniel Vera gilliard
; Beschreibung: Ein lauflicht, welches durch ein Timer erhöht wird
; Es wird eine Interrupt routine genutzt
;---------------------------------------------------------------

; Programmbeginn
        JMP INIT ; Interrupts Überspringen

; Interruptroutinen

; Interrrupt 0
ORG 0Bh ; ISR für Interrupt0 wird festgelegt
jmp timer0_int ;call timer handling

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Interruptbehandlungsroutine Timer 0
timer0_int:
        call lauflicht
        mov TL0,#0xDC ;Startwert festlegen
        mov TH0,#0xFF
        reti

;Programm um Lauflicht zu erhöhen
lauflicht:
        RL A ;Akku nach links rotieren
        CJNE A, #10000000b, ende
        MOV A, #1d
        ende:
        ret

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

;Interrupts setzen
        SETB ET0 ;Timer 0 setzen
        SETB EA  ; Allgemeine Interrupt freigabe
        jmp main

; Hauptprogramm
;---------------------------------------------------------------
main:
Mov P0, A ;Wert von Akku auf das Lauflicht anzeigen
jmp main
