include reg51.inc
; Autor    : Daniel Vera gilliard
; Beschreibung: Ein lauflicht mit einem 1s Timer als Pause
;---------------------------------------------------------------

; Programmbeginn
        JMP INIT ; Interrupts Überspringen

; Interruptroutinen

; Interrrupt 0
ORG 03h ; ISR für Interrupt0 wird festgelegt
Dec R1 
;clr TR0 ;Timer Stoppen
;pruefe:
;DJNZ 0x01, weiter ;R1 vermindern. Falss 0(Lauflicht erhöhen) sonst weiter
;call lauflicht ;lauflicht eins weiter
;weiter:
;call timer0_int ;Startwerte neu Setzen
;SETB TR0 ;Timer wieder starten 
RETI

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Interruptbehandlungsroutine Timer 0
timer0_int:
        mov TL0,#0xB0 ;Startwert festlegen
        mov TH0,#0x3C
        ret

; Initialisierung
;---------------------------------------------------------------
INIT:

;Variablen
        Mov R1, #30d ;R1 für den timer auf null setzen
        Mov A, #1d ;Lauflicht auf 1 setzen

; Timer 0 aktivieren
;  Intervall: x.xx ms
        mov TL0,#0xB0 ;Startwert festlegen
        mov TH0,#0x3C

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