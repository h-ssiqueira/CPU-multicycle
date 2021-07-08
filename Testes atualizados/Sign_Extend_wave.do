view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 101011 -range 5 0 -starttime 0ns -endtime 1000ns sim:/signextend/Immediate 
wave create -driver freeze -pattern constant -value 101011 -range 5 0 -starttime 0ns -endtime 1000ns sim:/signextend/Immediate 
WaveExpandAll -1
wave edit change_value -start 100ns -end 200ns -value 111111 Edit:/signextend/Immediate 
wave edit change_value -start 200ns -end 300ns -value 000000 Edit:/signextend/Immediate 
wave edit change_value -start 300ns -end 1000ns -value 100000 Edit:/signextend/Immediate 
WaveCollapseAll -1
wave clipboard restore
