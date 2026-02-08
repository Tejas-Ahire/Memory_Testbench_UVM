class mem_responder extends uvm_component;
	virtual mem_interface vif;

	reg[`WIDTH-1:0] mem [`DEPTH-1:0];
	integer i;
	`uvm_component_utils(mem_responder)
	`NEW_COMP


	function void build();
		if(!uvm_resource_db#(virtual mem_interface)::read_by_type("GLOBAL",vif,this))begin
			`uvm_error("VIF","Error while getting vif")
		end
	endfunction


	task run();
		forever begin
			@(posedge vif.clk);
				if(vif.rst==1)begin
					vif.ready=0;
					vif.rdata=0;
					for(i=0;i<`DEPTH;i=i+1)mem[i]=0;
				end	
				else begin
					if(vif.valid==1)begin 
						vif.ready=1;
						if(vif.wr_rd==1) mem[vif.addr]=vif.wdata;
						else vif.rdata=mem[vif.addr];
					end
		 		    else vif.ready=0;
			    end
		end
	endtask	
endclass


