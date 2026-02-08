class mem_monitor extends uvm_monitor;
	mem_tx tx;
	uvm_analysis_port#(mem_tx) ap_port;
	`uvm_component_utils(mem_monitor)
	`NEW_COMP
	virtual mem_interface vif;

	function void build();
		vif=top.pif;
		ap_port=new("ap_port",this);
	endfunction

	task run();
		forever begin
          	@(vif.mon_cb);
            if(vif.mon_cb.valid==1 && vif.mon_cb.ready==1)begin
				tx=new("tx");
				tx.wr_rd=vif.mon_cb.wr_rd;
				tx.addr=vif.mon_cb.addr;
              	if(tx.wr_rd==1) tx.wdata=vif.mon_cb.wdata;
				else tx.wdata=0;
				if(tx.wr_rd==0)begin
					@(vif.mon_cb);
					if(mem_common::test_name=="misMatching") tx.rdata=20;
					else tx.rdata=vif.mon_cb.rdata;
				end
				else tx.rdata=0;
				ap_port.write(tx);
			end
		end
	endtask
endclass

