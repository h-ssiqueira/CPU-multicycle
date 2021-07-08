view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 1200ns sim:/ula/clock 
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/ula/clock 
wave create -driver freeze -pattern constant -value 00 -range 1 0 -starttime 0ns -endtime 1000ns sim:/ula/ALUop 
WaveExpandAll -1
wave edit change_value -start 200ns -end 400ns -value 01 Edit:/ula/ALUop 
wave edit change_value -start 400ns -end 600ns -value 10 Edit:/ula/ALUop 
wave edit change_value -start 600ns -end 1000ns -value 11 Edit:/ula/ALUop 
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 1000ns sim:/ula/ALUSrcA 
wave create -driver freeze -pattern constant -value 00 -range 1 0 -starttime 0ns -endtime 1000ns sim:/ula/ALUSrcB 
WaveExpandAll -1
wave edit change_value -start 100ns -end 200ns -value 10 Edit:/ula/ALUSrcB 
wave edit change_value -start 300ns -end 400ns -value 10 Edit:/ula/ALUSrcB 
wave edit change_value -start 500ns -end 600ns -value 10 Edit:/ula/ALUSrcB 
wave edit change_value -start 700ns -end 800ns -value 10 Edit:/ula/ALUSrcB 
wave create -driver freeze -pattern constant -value 00110011 -range 7 0 -starttime 0ns -endtime 1000ns sim:/ula/A 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 01010101 -range 7 0 -starttime 0ns -endtime 1000ns sim:/ula/B 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 00001111 -range 7 0 -starttime 0ns -endtime 1000ns sim:/ula/Imed 
WaveExpandAll -1
WaveCollapseAll -1
wave clipboard restore
