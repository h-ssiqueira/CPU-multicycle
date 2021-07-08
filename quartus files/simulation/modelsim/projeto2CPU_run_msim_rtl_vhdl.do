transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/Arquitetura/Quartus/Projeto2/IR.vhd}
vcom -93 -work work {D:/Arquitetura/Quartus/Projeto2/REGSint.vhd}
vcom -93 -work work {D:/Arquitetura/Quartus/Projeto2/SignExtend.vhd}
vcom -93 -work work {D:/Arquitetura/Quartus/Projeto2/ULA.vhd}
vcom -93 -work work {D:/Arquitetura/Quartus/Projeto2/StateMachine.vhd}
vcom -93 -work work {D:/Arquitetura/Quartus/Projeto2/CPU.vhd}
vcom -93 -work work {D:/Arquitetura/Quartus/Projeto2/memoria64x4int.vhd}

