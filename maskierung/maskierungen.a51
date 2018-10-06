 include reg51.inc
;Durch die Schalter S0 und S1 sollen die Zahlen 0 bis 3 als Dualzahl eingestellt & an Siebensegmentanzeige sichtbar
;Schalter S2 soll keine Auswirkung auf das Ergebnis haben.
;Die Aufgabe soll mit Masken, ohne Bitadressierung, gelöst werden.
;Nur bis Zahlen 0-3
;ACHTUNG: Die Schalter müssen immer eine eins sein, da sie low active sind !

START:	
MOV A, P0 ;Lade den Wert von PO auf den akkumulator um mit ihm rechnen zu können
SWAP A ;rotiere erste und letzte stelle um eingabe nach vorne zu bringen
RR A ;Rotiere wert auf p0 nach rechts um verschiebbung durch P0.4 entgegenzuwirken
ORL A, #01100000B ;verodere es um eingabe zu erlangen --> Schalter auf eins setzen
ANL A, #01100011B ;verunde es um die richtige Zahl auszugeben --> SChalter auf eins setzen
MOV P0, A ;zeige zahl an P0 an
JMP START ;endlosschleife von anfang
END