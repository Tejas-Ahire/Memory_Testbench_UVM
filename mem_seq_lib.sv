//This is sequence
class mem_base_seq extends uvm_sequence#(mem_tx);
	uvm_phase phase;
	`uvm_object_utils(mem_base_seq)
	`NEW_OBJ
	task pre_body();	
		phase=get_starting_phase();
		if(phase!=null)begin
			phase.raise_objection(this);
			phase.phase_done.set_drain_time(this,100);
		end
	endtask

	task post_body();	
		if(phase!=null)begin
			phase.drop_objection(this);
		end
	endtask

endclass

class mem_nwr_nrd_seq extends mem_base_seq;
	mem_tx txQ[$];
	mem_tx tx;
	`uvm_object_utils(mem_nwr_nrd_seq)
	`NEW_OBJ

	task body();
		repeat(mem_common::count) begin
			`uvm_do_with(req,{wr_rd==1;})
			tx=new req;
			txQ.push_back(tx);
		end
		repeat(mem_common::count) begin
			tx=txQ.pop_front();
			`uvm_do_with(req,{wr_rd==0;req.addr==tx.addr;})
		end
	endtask
endclass



