# Berechnung des Timers

> Es wird eine Pause von 1s gebraucht.

1. Ein Takt = 1 Mikrosekunde -> 1000000 Mikrosekunden gebraucht(von 1s umgerechnet)
2. Ein 16bit Timer hat 2^16=65536takte -> 1000000/16 = 62500
3. Startwert: 65536-62500=3036 & Muss 16 mal gezählt werden
4. 3036d = BDC