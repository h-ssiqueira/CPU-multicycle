view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 5800ns sim:/cpu/clock0 
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 5800ns sim:/cpu/reset 
wave edit change_value -start 0ns -end 100ns -value 0 Edit:/cpu/reset 
WaveCollapseAll -1
wave clipboard restore
