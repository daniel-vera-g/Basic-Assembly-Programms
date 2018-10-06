include reg51.inc
;*****INDIREKTE ADRESSIERUNG"*****
;Von unten nach oben aufbauendes Lauflicht mithilfe von Indirekte Addressierung(TABELLE)
;Indirekte adressierung wird als pointer verwendet

Mov R0, #0x00 ;R0 Pointer für die Tabelle 
Mov DPTR, #tabelle ;DATA pointer auf Tabelle

start:
Mov A, R0 ;R0 in den Akku für weitere Berechnungen

; INDIREKTE ADRESSIERUNG
MOVC A,@A+DPTR ;Wert an stelle vom Akku aus der Tabelle in den Akku -> INDIREKTE ADRESSIERUNG

Mov P0, A ;Wert von A auf P0 --> Muster Anzeigen
INC R0 ;R0 incrementieren(Pointer auf Tabelle)
CJNE R0, #0x08, start ;1 Durchlauf komplett?
Mov R0,#0x00 ;RESET 
Jmp start

tabelle: DB 10000000b, 11000000b, 11100000b, 11110000b, 11111000b, 11111100b, 11111110b , 11111111b 
