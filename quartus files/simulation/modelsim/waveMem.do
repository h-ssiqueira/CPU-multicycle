view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/memoria64x4/clock 
wave create -driver freeze -pattern constant -value 00000000 -range 7 0 -starttime 0ns -endtime 1000ns sim:/memoria64x4/address 
WaveExpandAll -1
wave edit change_value -start 100ns -end 200ns -value 00000100 Edit:/memoria64x4/address 
WaveCollapseAll -1
wave clipboard restore
