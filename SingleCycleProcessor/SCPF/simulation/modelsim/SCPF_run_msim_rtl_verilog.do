transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/PC/Desktop/fyd/SingleCycleProcessor/Instruction\ Memory {C:/Users/PC/Desktop/fyd/SingleCycleProcessor/Instruction Memory/INST.v}
vlog -vlog01compat -work work +incdir+C:/Users/PC/Desktop/fyd/SingleCycleProcessor/DataMemory {C:/Users/PC/Desktop/fyd/SingleCycleProcessor/DataMemory/RAM.v}
vlog -vlog01compat -work work +incdir+C:/Users/PC/Desktop/fyd/SingleCycleProcessor/SCP {C:/Users/PC/Desktop/fyd/SingleCycleProcessor/SCP/SCP.v}
vlog -vlog01compat -work work +incdir+C:/Users/PC/Desktop/fyd/SingleCycleProcessor/Register {C:/Users/PC/Desktop/fyd/SingleCycleProcessor/Register/Register.v}
vlog -vlog01compat -work work +incdir+C:/Users/PC/Desktop/fyd/SingleCycleProcessor/Mux3by1 {C:/Users/PC/Desktop/fyd/SingleCycleProcessor/Mux3by1/Mux3by1.v}
vlog -vlog01compat -work work +incdir+C:/Users/PC/Desktop/fyd/SingleCycleProcessor/Mux2by1 {C:/Users/PC/Desktop/fyd/SingleCycleProcessor/Mux2by1/Mux2by1.v}
vlog -vlog01compat -work work +incdir+C:/Users/PC/Desktop/fyd/SingleCycleProcessor/MainDecoder {C:/Users/PC/Desktop/fyd/SingleCycleProcessor/MainDecoder/MainDecoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/PC/Desktop/fyd/SingleCycleProcessor/Instruction\ Memory {C:/Users/PC/Desktop/fyd/SingleCycleProcessor/Instruction Memory/InstructionMemory.v}
vlog -vlog01compat -work work +incdir+C:/Users/PC/Desktop/fyd/SingleCycleProcessor/FF32 {C:/Users/PC/Desktop/fyd/SingleCycleProcessor/FF32/FF32.v}
vlog -vlog01compat -work work +incdir+C:/Users/PC/Desktop/fyd/SingleCycleProcessor/Extend {C:/Users/PC/Desktop/fyd/SingleCycleProcessor/Extend/Extend.v}
vlog -vlog01compat -work work +incdir+C:/Users/PC/Desktop/fyd/SingleCycleProcessor/DataPath {C:/Users/PC/Desktop/fyd/SingleCycleProcessor/DataPath/DataPath.v}
vlog -vlog01compat -work work +incdir+C:/Users/PC/Desktop/fyd/SingleCycleProcessor/DataMemory {C:/Users/PC/Desktop/fyd/SingleCycleProcessor/DataMemory/DataMemory.v}
vlog -vlog01compat -work work +incdir+C:/Users/PC/Desktop/fyd/SingleCycleProcessor/Controller {C:/Users/PC/Desktop/fyd/SingleCycleProcessor/Controller/Controller.v}
vlog -vlog01compat -work work +incdir+C:/Users/PC/Desktop/fyd/SingleCycleProcessor/AluDecoder {C:/Users/PC/Desktop/fyd/SingleCycleProcessor/AluDecoder/AluDecoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/PC/Desktop/fyd/SingleCycleProcessor/ALU {C:/Users/PC/Desktop/fyd/SingleCycleProcessor/ALU/ALU.v}
vlog -vlog01compat -work work +incdir+C:/Users/PC/Desktop/fyd/SingleCycleProcessor/Adder {C:/Users/PC/Desktop/fyd/SingleCycleProcessor/Adder/Adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/PC/Desktop/fyd/SingleCycleProcessor/SCPF {C:/Users/PC/Desktop/fyd/SingleCycleProcessor/SCPF/SCPF.v}

