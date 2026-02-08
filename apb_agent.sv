class apb_agent extends uvm_agent;
	bit mst_slv_f;
	apb_drv drv;
	apb_mon mon;
	apb_sqr sqr;
	apb_cov cov;
	apb_rsp rsp;
	`uvm_component_utils_begin(apb_agent)
		`uvm_field_int(mst_slv_f,UVM_ALL_ON)
	`uvm_component_utils_end
	`NEW_COMP

	function void build();
		super.build();//thus we can use flag set by configdb without get method
		if(mst_slv_f==`MASTER)begin
			drv=apb_drv::type_id::create("drv",this);
			mon=apb_mon::type_id::create("mon",this);
			cov=apb_cov::type_id::create("cov",this);
			sqr=apb_sqr::type_id::create("sqr",this);
		end
		else if(mst_slv_f==`SLAVE)begin
			mon=apb_mon::type_id::create("mon",this);
			rsp=apb_rsp::type_id::create("rsp",this);
		end
	endfunction
endclass
