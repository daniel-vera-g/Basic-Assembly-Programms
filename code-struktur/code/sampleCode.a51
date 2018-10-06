; Autor    : Daniel Vera gilliard
; Datum    : [DATUM]
; Assembler: ASEM-51
; Projekt  : [PROJEKTNAME]
; Beschreibung: [PROJEKT BESCHREIBUNG]
;---------------------------------------------------------------
include reg51.inc

;---------------------------------------------------------------
; Konstanten-, Speicher- und Portbelegung

;---------------------------------------------------------------
; Programmbeginn
ORG 0h
        JMP INIT ; Interrupts Überspringen

; Interruptroutinen
;---------------------------------------------------------------

; Interrrupt 1
ORG 03H ; ISR für Interrupt0 wird festgelegt

[...] ; Weitere Bearbeitung erfolgt im UP

RETI

; Interrupt 2
ORG 013H ; ISR für EX1

[...] ; Weitere Bearbeitung im UP

RETI

; Funktionen
;---------------------------------------------------------------
[...]

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

; Interruptbehandlungsroutine Timer 1
timer1_int:
        mov TL0,#0F0h ;Timer Startwert neu setzen
        mov TH0,#0D8h 
;       [...]
        reti
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

; Interruptbehandlungsroutine Timer 0
timer0_int:
        mov TL1,#0F0h ;Timer Startwert neu setzen
        mov TH1,#0D8h 
;       [...]
        reti
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;Pause1: x.xx ms
;  Anzahl Maschinenzyklen: xx
pause1:
        [...]
pause1_labelA:
        [...]
ret
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;Pause2: x.xx ms
;  Anzahl Maschinenzyklen: xx
pause2:
        [...]
pause2_labelA:
        [...]
ret
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

; Initialisierung
;---------------------------------------------------------------
INIT:

; Timer 0 aktivieren
;  Intervall: x.xx ms
        mov TL0,#0F0h ;Startwert festlegen
        mov TH0,#0D8h 


; Timer 1 aktivieren
;  Intervall: x.xx ms
        mov TL1,#0F0h ;Startwert festlegen
        mov TH1,#0D8h 

; die SFR's initialisieren
        mov TMOD,#00000001b ;Timer einschalten
        mov TCON,#00010000b ;Timer konfigurieren & starten

;Interrupts setzen
SETB IT0 ; ExternerInterrupt0 reagiert auf Flanken
SETB EX0 ; Schaltet EX0 frei

SETB IT1 ; EX1 reagiert jetzt auf Flanken
SETB EX1 ; Schaltet EX1 frei

SETB EA  ; Allgemeine Interrupt freigabe
jmp main

; Hauptprogramm
;---------------------------------------------------------------
main:
;       [...]

; Programmende
;---------------------------------------------------------------
ende:
        jmp ende
END