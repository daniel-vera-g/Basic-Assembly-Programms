include reg51.inc
;Lauflicht mit Pause, die 10ms andauert

;Berechnung:
;10ms = 10000mµs = 10000MZ

Mov A, #1d ;Set up

HP:      	
Mov P0, A ;Anzeigen auf dem Port A 
RL A ;A Links rotieren um naechste Zahl anzeigen
call pause ;Pausenaufruf
jmp HP ;endlossscheleife

;Pause mit jeweils 225 zyklen -> Berechnung checken
pause:
Mov R0 ,#5d ;R0 mit 225 laden um -->erster durchgang
schleife:
Mov R1,#5d ;R1 mit 225 laden um -->zweiter durchgang(doppelt)
weiter:
DJNZ R1, weiter ;RICHTIG ?
DJNZ R0, schleife
Ret
