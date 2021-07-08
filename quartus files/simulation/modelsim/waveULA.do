view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/ulaext/clock1 
wave create -driver freeze -pattern constant -value 10 -range 1 0 -starttime 0ns -endtime 1000ns sim:/ulaext/ALUop1 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 1000ns sim:/ulaext/ALUSrcA1 
wave create -driver freeze -pattern constant -value 00 -range 1 0 -starttime 0ns -endtime 1000ns sim:/ulaext/ALUSrcB1 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 00001111 -range 7 0 -starttime 0ns -endtime 1000ns sim:/ulaext/A1 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 01010101 -range 7 0 -starttime 0ns -endtime 1000ns sim:/ulaext/B1 
WaveExpandAll -1
wave edit change_value -start 100ns -end 200ns -value 11 Edit:/ulaext/ALUop1 
wave edit change_value -start 0ns -end 1000ns -value 10 Edit:/ulaext/ALUop1 
wave create -driver freeze -pattern constant -value 00001100 -range 7 0 -starttime 0ns -endtime 1000ns sim:/ulaext/PC1 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 00000011 -range 7 0 -starttime 0ns -endtime 1000ns sim:/ulaext/Imed1 
WaveExpandAll -1
wave edit change_value -start 100ns -end 200ns -value 10 Edit:/ulaext/ALUSrcB1 
wave edit change_value -start 200ns -end 300ns -value 01 Edit:/ulaext/ALUSrcB1 
wave edit change_value -start 200ns -end 300ns -value 0 Edit:/ulaext/ALUSrcA1 
wave edit change_value -start 300ns -end 500ns -value 11 Edit:/ulaext/ALUop1 
wave edit change_value -start 400ns -end 500ns -value 10 Edit:/ulaext/ALUSrcB1 
wave edit change_value -start 500ns -end 700ns -value 00 Edit:/ulaext/ALUop1 
wave edit change_value -start 700ns -end 900ns -value 01 Edit:/ulaext/ALUop1 
wave edit change_value -start 600ns -end 700ns -value 10 Edit:/ulaext/ALUSrcB1 
wave edit change_value -start 800ns -end 900ns -value 10 Edit:/ulaext/ALUSrcB1 
WaveCollapseAll -1
wave clipboard restore
