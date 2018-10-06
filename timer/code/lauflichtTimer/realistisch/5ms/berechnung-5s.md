# Berechnung des Timers

> Es wird eine Pause von 0,5ms gebraucht.

1. Ein Takt = 1 Mikrosekunde -> 1000 Mikrosekunden gebraucht(von 1ms umgerechnet -> 1000)
2. Ein 16bit Timer hat 2^16=65500 takte -> 1000/1= 1000
3. Startwert: 2^16-1000=  64700 & Muss 0 mal gezählt werden
4. 64536d = 0xFC18