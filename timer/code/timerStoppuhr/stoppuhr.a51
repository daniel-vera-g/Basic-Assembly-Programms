; 19.6.18
; Daniel Vera Gilliard
; Stoppuhr die mit hilfe eines Timers funktioniert
; Die Stoppurh soll jeweils fuer 60ms laufen

; Libraries
include reg51.inc

; Variablen
Mov A, #0x01 ;Akkumulator den Wert 1 Geben

;Programmbeginn
org 0h
JMP init ;ins HP springen

;Timer ISR erstellen
org 0x03 ;ISR fuer den Timer 0
call isrConfig ;isr neu configurieren
RETI

; ISR config 
isrConfig:
RR A ;Port 0 um eine Stelle nach rechts rotieren
Mov TL0,#0xA0 ; Timer neu konfigurieren
MOV TH0,#0x15 
SETB TR0 ;Timer neu setzen
RET 


;init config
init:

;Timer 0 config
MOV TL0,#0xA0
MOV TH0,#0x15

;SFR
MOV TMOD, #00000001b ;TMOD auf 16bit ohne reload 
MOV TCON, #00010000b; TCON 

;Interrupts setzen
setb ET0 ;Timer 0 (�berlauf Freigabe)
SETB EA ;Allgemeine Interrupt freigabe

main:
Mov P0, A;Akkumulator auf P0
jmp main ;eindlossschaleife
