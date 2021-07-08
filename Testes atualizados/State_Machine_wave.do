view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 3800ns sim:/statemachine/clock 
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 3800ns sim:/statemachine/reset 
wave create -driver freeze -pattern constant -value 0000 -range 3 0 -starttime 0ns -endtime 3800ns sim:/statemachine/opcode 
WaveExpandAll -1
wave edit change_value -start 0ns -end 100ns -value 0 Edit:/statemachine/reset 
wave edit change_value -start 400ns -end 700ns -value 0001 Edit:/statemachine/opcode 
wave edit change_value -start 700ns -end 1000ns -value 0010 Edit:/statemachine/opcode 
wave edit change_value -start 1000ns -end 1100ns -value 0010 Edit:/statemachine/opcode 
wave edit change_value -start 1100ns -end 1500ns -value 0011 Edit:/statemachine/opcode 
wave edit change_value -start 1500ns -end 1900ns -value 0100 Edit:/statemachine/opcode 
wave edit change_value -start 1900ns -end 2300ns -value 0101 Edit:/statemachine/opcode 
wave edit change_value -start 2300ns -end 2700ns -value 0111 Edit:/statemachine/opcode 
wave edit change_value -start 2700ns -end 3100ns -value 1000 Edit:/statemachine/opcode 
wave edit change_value -start 3100ns -end 3500ns -value 1001 Edit:/statemachine/opcode 
wave edit change_value -start 2300ns -end 2700ns -value 0110 Edit:/statemachine/opcode 
wave edit change_value -start 2700ns -end 3100ns -value 0111 Edit:/statemachine/opcode 
wave edit change_value -start 3100ns -end 3500ns -value 1000 Edit:/statemachine/opcode 
wave edit change_value -start 3500ns -end 3800ns -value 1001 Edit:/statemachine/opcode 
WaveCollapseAll -1
wave clipboard restore
