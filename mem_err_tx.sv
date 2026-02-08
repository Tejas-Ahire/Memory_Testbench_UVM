class mem_err_tx extends mem_tx;
	rand bit [1:0] err_type;
	`uvm_object_utils_begin(mem_err_tx)
		`uvm_field_int(err_type,UVM_ALL_ON)
	`uvm_object_utils_end
	`NEW_OBJ
endclass
