class mem_agent extends uvm_agent;
	bit mst_slv_f;	
	mem_gen gen;
	mem_bfm bfm;
	mem_monitor mon;
	mem_coverage cov;
	mem_responder responder;
	`uvm_component_utils_begin(mem_agent)
		`uvm_field_int(mst_slv_f,UVM_ALL_ON)
	`uvm_component_utils_end
	`NEW_COMP

	function void build();
		super.build();
		//uvm_config_db#(int)::get(this,"","mst_slv_f",mst_slv_f);
		if(mst_slv_f==`MASTER)begin
			gen=mem_gen::type_id::create("gen",this);
			bfm=mem_bfm::type_id::create("bfm",this);
			mon=mem_monitor::type_id::create("mon",this);
			cov=mem_coverage::type_id::create("cov",this);
		end
		else begin
			mon=mem_monitor::type_id::create("mon",this);
			responder=mem_responder::type_id::create("responder",this);
		end
	endfunction
	
	function void connect();
		if(mst_slv_f==`MASTER)begin
			bfm.seq_item_port.connect(gen.seq_item_export);
			mon.ap_port.connect(cov.analysis_export);
		end
	endfunction

endclass

