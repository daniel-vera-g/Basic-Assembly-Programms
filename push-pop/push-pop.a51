; Einfaches Lauflicht Muster realisiert durch Push & Pop Befehle

; Lauflichtmuster auf Register
init:
MOV 0x00, #10000001b
MOV 0x01, #01000010b
MOV 0x02, #00100100b
MOV 0x03, #00011000b

; Lauflichtmuster auf Stack
schieben:
push 0x03
push 0x02
push 0x01
push 0x00

; Lauflicht aus Stack holen & anzeigen
holen:
pop 0x80 ;Lauflicht anzeigen
call pause
JNB 0x83, holen
JMP init

;Pause mit jeweils 225 zyklen -> Berechnung checken
pause:
Mov R4 ,#5d ;R0 mit 225 laden um -->erster durchgang
schleife:
Mov R5,#5d ;R1 mit 225 laden um -->zweiter durchgang(doppelt)
weiter:
DJNZ R5, weiter ;RICHTIG ?
DJNZ R4, schleife
ret


;pause:
;MOV R1, 0x3
;J2:
;MOV R0, 0x35
;J1:
;DJNZ R0, J1
;DJNZ R1, J2
;ret

