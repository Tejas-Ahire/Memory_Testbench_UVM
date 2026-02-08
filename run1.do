vlib work

vlog tb.sv +incdir+D:/VLSI_GURU/UVM/UVM_BASE_CLASSES/uvm-1.2/uvm-1.2/src

vsim -novopt -suppress 12110 top -l output.log \
-sv_lib C:/questasim64_10.7c/uvm-1.2/win64/uvm_dpi \
+UVM_TIMEOUT=1000 +UVM_OBJECTION_TRACE +UVM_VERBOSITY=UVM_FULL 

add wave -r sim:/top/pif/*

run -all

