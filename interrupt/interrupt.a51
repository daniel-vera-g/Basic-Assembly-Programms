include reg51.inc
;Interrupt
;Lauflicht das auf IE reagiert
;ISR 0 --> Blinkendes Licht & Endlossschleife
;ISR 1 --> Lauflicht geht aus

JMP INIT ;Interrupts Überspringen

org 03H ;ISR für EX0
call blinken;
RETI 

org 013H ;ISR für EX1
call aus ; -> ENDLOSSCHLEIFE(KEIN RETI)

INIT:
SETB IT0 ; EXO   --> Flanken
SETB EX0 ; EX0 freischalten
SETB IT1 ; EX1 --> Flanken
SETB EX1 ; EX1 freischalten
SETB EA ; Interrupt aktivieren
MOV A, #1d ;Lauflicht auf 0 setzen

HP: 
MOV P0, A
RL A
CJNE A, #10000000b, HP
MOV A, #1d
JMP HP

blinken:
MOV P0, #00000000b
MOV P0, A
JMP blinken

aus:
MOV P0, #00000000b
JMP aus