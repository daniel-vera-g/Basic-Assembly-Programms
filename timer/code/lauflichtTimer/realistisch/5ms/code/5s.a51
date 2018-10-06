include reg51.inc
; Autor    : Daniel Vera gilliard
; Beschreibung: Ein lauflicht mit einem 1s Timer als Pause
;---------------------------------------------------------------

; Programmbeginn
        JMP INIT ; Interrupts Überspringen

; Interruptroutinen

; Interrrupt 0
ORG 03h ; ISR für Interrupt0 wird festgelegt
call timer0_int ;call timer handling
RETI

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Interruptbehandlungsroutine Timer 0
timer0_int:
        mov TL0,#0xDC ;Startwert festlegen
        mov TH0,#0xFF
        CLR TF0 ;Timerflag clearen
        SETB TR0 ; Timer 0 bit setzen
        MOV P0, #11111111b
        ret

; Initialisierung
;---------------------------------------------------------------
INIT:

;Variablen
        Mov R1, #30d ;R1 für den timer auf null setzen
        Mov A, #1d ;Lauflicht auf 1 setzen

; Timer 0 aktivieren
;  Intervall: x.xx ms
        mov TL0,#0xDC ;Startwert festlegen
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

;Programm um Lauflicht zu erhöhen
lauflicht:
RL A ;Akku nach links rotieren
CJNE A, #10000000b, main
MOV P0, #10000000b
MOV A, #1d
jmp main