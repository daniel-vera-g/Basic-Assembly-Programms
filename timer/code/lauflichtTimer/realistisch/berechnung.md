# Berechnung des Timers

> Es wird eine Pause von 30s gebraucht.

1. Ein Takt = 1 Mikrosekunde -> 30000000 Mikrosekunden gebraucht(von 30s umgerechnet)
2. Ein 16bit Timer hat 2^16=65536takte -> 30000000/460 = 65217
3. Startwert: 65536-65217=319 & Muss 460 mal gezählt werden
4. 319d = 0x13F