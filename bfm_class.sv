class mem_bfm extends uvm_driver#(mem_tx);
	mem_tx tx;
	int count;
	`uvm_component_utils_begin(mem_bfm)
		`uvm_field_int(count,UVM_ALL_ON)
	`uvm_component_utils_end
	`NEW_COMP
	
    virtual mem_interface vif;

	function void build();	
		//vif=top.pif;
		if(!uvm_resource_db#(virtual mem_interface)::read_by_type("GLOBAL",vif,this))begin
			`uvm_error("VIF","Error while getting vif")
		end
		if(!uvm_config_db#(int)::get(this,"","sample_count",count))begin
			`uvm_error("COUNT","Error while getting count")
		end
	endfunction
	task run();
		forever begin
			`uvm_info("DRIVER",$sformatf("count:%0d",count),UVM_LOW)
			seq_item_port.get_next_item(tx);
			tx.print();
			drive_tx(tx);
			mem_common::bfmCount++;
			seq_item_port.item_done();
		end
	endtask

	task drive_tx(mem_tx tx);
		@(vif.bfm_cb);
		vif.bfm_cb.wr_rd<=tx.wr_rd;
		vif.bfm_cb.addr<=tx.addr;
        if(vif.bfm_cb.wr_rd==1)vif.bfm_cb.wdata<=tx.wdata;
		else vif.bfm_cb.wdata<=0;
		vif.bfm_cb.valid<=1;
		wait(vif.bfm_cb.ready==1);
		if(tx.wr_rd==0) begin
          	@(vif.bfm_cb);
			tx.rdata=vif.bfm_cb.rdata;
		end
		else tx.rdata=0;

		@(vif.bfm_cb);
		vif.bfm_cb.wr_rd<=0;
		vif.bfm_cb.addr<=0;
		vif.bfm_cb.wdata<=0;
		vif.bfm_cb.valid<=0;
	endtask
endclass


