view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/memoria64x4int/clock 
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 1000ns sim:/memoria64x4int/PCWrite1 
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 1000ns sim:/memoria64x4int/reset1 
wave edit change_value -start 0ns -end 100ns -value 0 Edit:/memoria64x4int/reset1 
wave edit change_value -start 0ns -end 100ns -value 0 Edit:/memoria64x4int/PCWrite1 
wave edit change_value -start 0ns -end 1000ns -value 1 Edit:/memoria64x4int/PCWrite1 
wave edit change_value -start 100ns -end 200ns -value 0 Edit:/memoria64x4int/PCWrite1 
wave edit change_value -start 200ns -end 300ns -value 0 Edit:/memoria64x4int/PCWrite1 
wave edit change_value -start 400ns -end 700ns -value 0 Edit:/memoria64x4int/PCWrite1 
WaveCollapseAll -1
wave clipboard restore
