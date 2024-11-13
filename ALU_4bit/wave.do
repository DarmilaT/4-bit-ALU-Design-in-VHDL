onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /alu_4bittb/A
add wave -noupdate /alu_4bittb/B
add wave -noupdate /alu_4bittb/M
add wave -noupdate /alu_4bittb/opcode
add wave -noupdate /alu_4bittb/Y
add wave -noupdate /alu_4bittb/carry
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1232 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
configure wave -timelineunits ps
update
WaveRestoreZoom {960 ps} {1746 ps}
