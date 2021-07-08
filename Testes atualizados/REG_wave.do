view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/regsint/clock1 
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 1000ns sim:/regsint/RESET1 
wave edit change_value -start 0ns -end 100ns -value 0 Edit:/regsint/RESET1 
wave create -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 1000ns sim:/regsint/RegDst 
wave edit change_value -start 400ns -end 1000ns -value 1 Edit:/regsint/RegDst 
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 1000ns sim:/regsint/RegWrite1 
wave edit change_value -start 700ns -end 1000ns -value 0 Edit:/regsint/RegWrite1 
wave create -driver freeze -pattern constant -value 00 -range 1 0 -starttime 0ns -endtime 1000ns sim:/regsint/MovtoReg1 
WaveExpandAll -1
wave edit change_value -start 100ns -end 200ns -value 01 Edit:/regsint/MovtoReg1 
wave edit change_value -start 200ns -end 300ns -value 10 Edit:/regsint/MovtoReg1 
wave edit change_value -start 400ns -end 500ns -value 01 Edit:/regsint/MovtoReg1 
wave edit change_value -start 500ns -end 600ns -value 10 Edit:/regsint/MovtoReg1 
wave create -driver freeze -pattern constant -value 01011100 -range 7 0 -starttime 0ns -endtime 1000ns sim:/regsint/ALUout1 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 11110000 -range 7 0 -starttime 0ns -endtime 1000ns sim:/regsint/ExtImmediate1 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 000 -range 2 0 -starttime 0ns -endtime 1000ns sim:/regsint/Rs1 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 111 -range 2 0 -starttime 0ns -endtime 1000ns sim:/regsint/Rt1 
WaveExpandAll -1
wave edit change_value -start 100ns -end 200ns -value 111 Edit:/regsint/Rs1 
wave edit change_value -start 100ns -end 200ns -value 110 Edit:/regsint/Rt1 
wave edit change_value -start 100ns -end 300ns -value 111 Edit:/regsint/Rs1 
wave edit change_value -start 200ns -end 300ns -value 101 Edit:/regsint/Rt1 
wave edit change_value -start 300ns -end 400ns -value 100 Edit:/regsint/Rt1 
wave edit change_value -start 400ns -end 500ns -value 00011100 Edit:/regsint/ExtImmediate1 
wave edit change_value -start 500ns -end 600ns -value 11010101 Edit:/regsint/ExtImmediate1 
wave edit change_value -start 600ns -end 700ns -value 10001110 Edit:/regsint/ExtImmediate1 
wave edit change_value -start 700ns -end 800ns -value 101 Edit:/regsint/Rs1 
wave edit change_value -start 800ns -end 1000ns -value 011 Edit:/regsint/Rs1 
wave edit change_value -start 700ns -end 800ns -value 010 Edit:/regsint/Rt1 
wave edit change_value -start 800ns -end 1000ns -value 001 Edit:/regsint/Rt1 
wave edit change_value -start 700ns -end 800ns -value 001 Edit:/regsint/Rt1 
WaveCollapseAll -1
wave clipboard restore
