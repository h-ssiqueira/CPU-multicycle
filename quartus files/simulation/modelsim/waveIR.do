view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/irext/clock1 
wave create -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 1000ns sim:/irext/IRWrite1 
wave create -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 1000ns sim:/irext/RegDst1 
wave create -driver freeze -pattern constant -value 1000111110110000 -range 15 0 -starttime 0ns -endtime 1000ns sim:/irext/Mem 
WaveExpandAll -1
wave edit change_value -start 150ns -end 250ns -value 0001000000000111 Edit:/irext/Mem 
wave edit change_value -start 50ns -end 250ns -value 1 Edit:/irext/IRWrite1 
wave edit change_value -start 50ns -end 150ns -value 1 Edit:/irext/RegDst1 
wave edit change_value -start 150ns -end 250ns -value 1001001100000110 Edit:/irext/Mem 
wave edit change_value -start 150ns -end 1000ns -value 1001001100000110 Edit:/irext/Mem 
WaveCollapseAll -1
wave clipboard restore
