; Autor    : Daniel Vera gilliard
; Beschreibung: Ein lauflicht mit einem 30s Timer als Pause
;---------------------------------------------------------------
include reg51.inc

;---------------------------------------------------------------
; Programmbeginn
        JMP INIT ; Interrupts Überspringen

; Interruptroutinen
;---------------------------------------------------------------

; Interrrupt 1
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
        ;mov TL0,#13Fh ;Startwert festlegen
        mov TL0,#0xff ;Startwert festlegen
        ;mov TH0,#0h 
        mov TH0,#0xf6
        ret

; Initialisierung
;---------------------------------------------------------------
INIT:

;Variablen
Mov R1, #30d ;R1 für den timer auf null setzen
Mov R2, #1d ;Lauflicht auf 1 setzen
; Timer 0 aktivieren
;  Intervall: x.xx ms
        ;mov TL0,#13Fh ;Startwert festlegen
        mov TL0,#0xff ;Startwert festlegen
        ;mov TH0,#0h 
        mov TH0,#0xf6

; die SFR's initialisieren
        mov TMOD,#00000001b ;Timer einschalten
        mov TCON,#00010000b ;Timer konfigurieren & starten

;Interrupts setzen
SETB ET0
SETB EA  ; Allgemeine Interrupt freigabe
SETB TR0 ;Timer starten
jmp main

; Hauptprogramm
;---------------------------------------------------------------
main:
Mov P0, R2 ;Wert von R2 auf das Lauflicht anzeigen
jmp main

;Programm um Lauflicht zu erhöhen
lauflicht:
CJNE R2, #8d, lichtInc ;schauen ob Lauflicht durch
Mov R2, #0d ;Lauflicht auf eins setzen
lichtInc:
Inc R2 ;Lauflicht incrementieren
ret