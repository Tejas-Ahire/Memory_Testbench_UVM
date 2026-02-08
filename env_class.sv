class mem_env extends uvm_env;
	mem_agent magent;
	mem_agent sagent;
	mem_sbd sbd;
	`uvm_component_utils(mem_env)
	`NEW_COMP

	function void build();
		magent=mem_agent::type_id::create("magent",this);
		sagent=mem_agent::type_id::create("sagent",this);
		sbd=mem_sbd::type_id::create("sbd",this);
	endfunction

endclass
