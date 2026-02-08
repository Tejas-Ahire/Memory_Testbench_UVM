class mem_base_test extends uvm_test;
	mem_env env;
	uvm_factory factory;
	`uvm_component_utils(mem_base_test)
	`NEW_COMP

	function void build();
		factory=uvm_factory::get();
		uvm_config_db#(int)::set(uvm_root::get(),"*","sample_count",25);
		uvm_config_db#(int)::set(uvm_root::get(),"env.magent*","mst_slv_f",`MASTER);
		uvm_config_db#(int)::set(uvm_root::get(),"env.sagent*","mst_slv_f",`SLAVE);
		env=mem_env::type_id::create("env",this);
	endfunction	

	function void end_of_elaboration();
		`uvm_info("SAMPLE","Printinf the TB Toplology",UVM_FULL)//this is message verbosity |whereas VERBOSITY in .do is reference verbosity
		`uvm_warning("SMAPLE2","Printing Topology!!!!");
		uvm_top.print_topology();//Rule says that message verbo <= reference verbosity means here to print this msg reference verbo should be FULL or Higher
	//	env.magent.bfm.set_report_verbosity_level(UVM_FULL);
	//	env.magent.gen.set_report_verbosity_level(UVM_FULL);
	//	env.magent.mon.set_report_verbosity_level(UVM_FULL);
	//	env.magent.cov.set_report_verbosity_level(UVM_FULL);
	endfunction

endclass
class mem_nwr_nrd extends mem_base_test;
	`uvm_component_utils(mem_nwr_nrd)
	`NEW_COMP
	function void build();
		super.build();
		//uvm_config_db#(int)::set(this,"env.magent.bfm","sample_count",15);
		uvm_config_db#(int)::set(uvm_root::get(),"*env.magent*","mst_slv_f",`MASTER);
		uvm_config_db#(int)::set(uvm_root::get(),"*env.sagent*","mst_slv_f",`SLAVE);
	endfunction	
//for this test_case starting phase is null and not required
	task run_phase(uvm_phase phase);
		mem_nwr_nrd_seq wr_rd_seq;
		wr_rd_seq=new("wr_rd_seq");
		phase.raise_objection(this);
		phase.phase_done.set_drain_time(this,100);
		//wr_rd_seq.count=3;// we can do this in here bu tcan not in build function
		wr_rd_seq.start(env.magent.gen);
		phase.drop_objection(this);
	endtask
endclass

class mem_nwr_nrd_build extends mem_base_test;
	`uvm_component_utils(mem_nwr_nrd_build)
	`NEW_COMP

	function void build();
		super.build();
		uvm_config_db#(uvm_object_wrapper)::set(this,"env.magent.gen.run_phase","default_sequence",mem_nwr_nrd_seq::get_type());
	endfunction
endclass

class mem_nwr_nrd_err_tx extends mem_nwr_nrd;
	`uvm_component_utils(mem_nwr_nrd_err_tx)
	`NEW_COMP
	
	function void build();
		super.build();
		uvm_config_db#(int)::set(this,"env.magent.bfm","sample_count",15);//instead if this we can use uvm_root::get()
		factory.set_type_override_by_name("mem_tx","mem_err_tx");//we can use this code also it applies to overall tb...
		//factory.set_type_override_by_type(mem_tx::get_type(),mem_err_tx::get_type());
		//factory.set_inst_override_by_name("mem_tx","mem_err_tx","uvm_test_top.*");
		//factory.set_type_override_by_name("mem_bfm","mem_err_bfm");
		//set_type_override("","") by defaut it is using name and is a part of inbuild methods no need of declaration
	endfunction
endclass

