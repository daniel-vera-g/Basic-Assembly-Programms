include reg51.inc
;Tabelle & indirekte addressierung
;3 Lichter lauflicht mit Tabelle & indirekte adressierung

;Tabelle init
MOV DPTR, #tab ;Datenzeiger auf Tabelle zeigen
Mov R0, #0d

start:
MOV A, R0;Datenzeiger für Tabelle
MOVC A,@A+DPTR ;Wert an stelle vom Akku aus der Tabelle in den Akku
Mov P0, A
INC R0;A nach rechts rotieren lassen
CJNE R0, #3d, start
Mov R0, #0d ;setze zurück
jmp start

tab: DB 00000001b, 00000010b, 00000100b
