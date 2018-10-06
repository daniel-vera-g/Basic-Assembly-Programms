# Berechnung des Timers

> Es wird eine Pause von 1s gebraucht.

1. Ein Takt = 50 Mikrosekunde -> 50000 Mikrosekunden gebraucht(von 50ms umgerechnet)
2. Ein 16bit Timer hat 2^16=65536 takte -> 50000/1= 50000
3. Startwert: 2^16-50000=15536 & Muss 0 mal gezählt werden
4. 15536d = 0x3CB0