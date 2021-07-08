view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/statemachine/clock 
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 4000ns sim:/statemachine/clock 
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 4000ns sim:/statemachine/reset 
wave create -driver freeze -pattern constant -value 0000 -range 3 0 -starttime 0ns -endtime 4000ns sim:/statemachine/opcode 
WaveExpandAll -1
wave edit change_value -start 0ns -end 100ns -value 0 Edit:/statemachine/reset 
wave edit change_value -start 500ns -end 800ns -value 0001 Edit:/statemachine/opcode 
wave edit change_value -start 800ns -end 1200ns -value 0010 Edit:/statemachine/opcode 
wave edit change_value -start 1200ns -end 1600ns -value 0011 Edit:/statemachine/opcode 
wave edit change_value -start 1600ns -end 2000ns -value 0100 Edit:/statemachine/opcode 
wave edit change_value -start 2000ns -end 2400ns -value 0101 Edit:/statemachine/opcode 
wave edit change_value -start 2400ns -end 2800ns -value 0110 Edit:/statemachine/opcode 
wave edit change_value -start 2800ns -end 3200ns -value 0111 Edit:/statemachine/opcode 
wave edit change_value -start 3200ns -end 3600ns -value 1000 Edit:/statemachine/opcode 
wave edit change_value -start 3600ns -end 4000ns -value 1001 Edit:/statemachine/opcode 
WaveCollapseAll -1
wave clipboard restore
