class apb_test extends uvm_test;
	function void build();
		uvm_config_db#(int)::set(this,"env.agent","mst_slv_f",`MASTER);
	endfunction
endclass
