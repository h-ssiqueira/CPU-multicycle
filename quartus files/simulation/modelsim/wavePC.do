view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/pcatt/CLOCK1 
wave create -driver freeze -pattern constant -value 00000000 -range 7 0 -starttime 0ns -endtime 1000ns sim:/pcatt/ADDRESS 
wave create -driver expectedOutput -pattern constant -value 00000100 -range 7 0 -starttime 0ns -endtime 1000ns sim:/pcatt/ADDRESSATT 
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 1000ns sim:/pcatt/PCWrite1 
wave create -driver freeze -pattern constant -value 00000100 -range 7 0 -starttime 0ns -endtime 1000ns sim:/pcatt/ADDRESS 
WaveExpandAll -1
wave edit change_value -start 100ns -end 300ns -value 01000000 Edit:/pcatt/ADDRESS 
wave edit change_value -start 100ns -end 200ns -value 0 Edit:/pcatt/PCWrite1 
wave edit change_value -start 300ns -end 400ns -value 0 Edit:/pcatt/PCWrite1 
WaveCollapseAll -1
wave clipboard restore
