view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/ir/clock 
wave create -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 1000ns sim:/ir/IRWrite 
wave edit change_value -start 0ns -end 100ns -value 1 Edit:/ir/IRWrite 
wave create -driver freeze -pattern constant -value 0101110101000001 -range 15 0 -starttime 0ns -endtime 1000ns sim:/ir/Memdata 
WaveExpandAll -1
wave edit change_value -start 400ns -end 800ns -value 0110100101111000 Edit:/ir/Memdata 
wave edit change_value -start 800ns -end 1000ns -value 0000000011011000 Edit:/ir/Memdata 
wave edit change_value -start 400ns -end 500ns -value 1 Edit:/ir/IRWrite 
wave edit change_value -start 800ns -end 900ns -value 1 Edit:/ir/IRWrite 
wave edit change_value -start 100ns -end 500ns -value 0110100101111000 Edit:/ir/Memdata 
wave edit change_value -start 500ns -end 900ns -value 0000000011011000 Edit:/ir/Memdata 
WaveCollapseAll -1
wave clipboard restore
