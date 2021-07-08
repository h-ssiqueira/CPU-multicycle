view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/regs/clock 
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 1000ns sim:/regs/RESET0 
wave edit change_value -start 0ns -end 100ns -value 0 Edit:/regs/RESET0 
wave create -driver freeze -pattern constant -value 00 -range 1 0 -starttime 0ns -endtime 1000ns sim:/regs/MovtoReg 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 000 -range 2 0 -starttime 0ns -endtime 1000ns sim:/regs/Rs 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 001 -range 2 0 -starttime 0ns -endtime 1000ns sim:/regs/Rt 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 010 -range 2 0 -starttime 0ns -endtime 1000ns sim:/regs/Rd 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 00000101 -range 7 0 -starttime 0ns -endtime 1000ns sim:/regs/ExtImmediate 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 00000011 -range 7 0 -starttime 0ns -endtime 1000ns sim:/regs/ALUout 
WaveExpandAll -1
wave edit change_value -start 300ns -end 400ns -value 01 Edit:/regs/MovtoReg 
wave edit change_value -start 500ns -end 600ns -value 10 Edit:/regs/MovtoReg 
wave edit change_value -start 200ns -end 300ns -value 010 Edit:/regs/Rs 
wave edit change_value -start 400ns -end 500ns -value 010 Edit:/regs/Rs 
wave edit change_value -start 500ns -end 600ns -value 010 Edit:/regs/Rs 
wave edit change_value -start 400ns -end 500ns -value 100 Edit:/regs/Rt 
wave edit change_value -start 300ns -end 400ns -value 100 Edit:/regs/Rd 
wave edit change_value -start 500ns -end 1000ns -value 110 Edit:/regs/Rd 
wave create -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 1000ns sim:/regs/RegWrite 
wave edit change_value -start 100ns -end 200ns -value 1 Edit:/regs/RegWrite 
wave edit change_value -start 300ns -end 400ns -value 1 Edit:/regs/RegWrite 
wave edit change_value -start 500ns -end 600ns -value 1 Edit:/regs/RegWrite 
WaveCollapseAll -1
wave clipboard restore
