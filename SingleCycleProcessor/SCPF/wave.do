onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /PipelinedProcessorwithoutHazard/clk
add wave -noupdate -radix hexadecimal /PipelinedProcessorwithoutHazard/reset
add wave -noupdate -radix hexadecimal /PipelinedProcessorwithoutHazard/Instr
add wave -noupdate -radix hexadecimal /PipelinedProcessorwithoutHazard/ImmExt
add wave -noupdate -radix hexadecimal /PipelinedProcessorwithoutHazard/ALUResultE
add wave -noupdate -radix hexadecimal /PipelinedProcessorwithoutHazard/ReadDataM
add wave -noupdate -radix hexadecimal /PipelinedProcessorwithoutHazard/WriteDataW
add wave -noupdate -radix hexadecimal /PipelinedProcessorwithoutHazard/SS1
add wave -noupdate -radix hexadecimal /PipelinedProcessorwithoutHazard/InstrD
add wave -noupdate -radix hexadecimal /PipelinedProcessorwithoutHazard/RD1
add wave -noupdate -radix hexadecimal /PipelinedProcessorwithoutHazard/RD2
add wave -noupdate /PipelinedProcessorwithoutHazard/RegWriteW
add wave -noupdate /PipelinedProcessorwithoutHazard/WriteAddW
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 269
configure wave -valuecolwidth 65
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {397 ps} {3676 ps}
