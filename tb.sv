`include "uvm_pkg.sv"
import uvm_pkg::*;
//`include "uvm_macros.svh"

`include "common_class.sv"
`include "interface_class.sv"
//`include "memory.sv"
`include "transaction.sv"
`include "mem_err_tx.sv"
`include "gen_class.sv"
`include "bfm_class.sv"
`include "mem_responder.sv"
`include "mem_err_bfm.sv"
`include "coverage_class.sv"
`include "monitor_class.sv"
`include "agent_class.sv"
`include "scoreBoard_class.sv"
`include "env_class.sv"
`include "mem_seq_lib.sv"
`include "test_lib.sv"

module top;
  	reg clk,rst;
	mem_interface pif(clk,rst);
//	memory dut(.clk(pif.clk),
//			   .rst(pif.rst),
//			   .wr_rd(pif.wr_rd),
//               .addr(pif.addr),
//			   .wdata(pif.wdata),
//			   .rdata(pif.rdata),
//			   .valid(pif.valid),
//			   .ready(pif.ready));

	always #5 clk=~clk;
  
  	initial begin	
	   // uvm_config_db#(virtual mem_interface)::set(uvm_root::get(),"*","vif",pif);			
		uvm_resource_db#(virtual mem_interface)::set("GLOBAL","vif",pif,null);			
		//if(!uvm_resource_db#(virtual mem_interface)::write_by_name("GLOBAL","vif",pif,null))begin//works when already set in database
		//	`uvm_error("WRITE","Error while writing by name in pif")
		//end
	end
  	initial begin
		run_test("mem_nwr_nrd");
	end


	initial begin
		clk=0;
		rst=1;
		repeat(2)@(posedge clk);
		rst=0;
	//	$value$plusargs("test_name=%s",mem_common::test_name);
	//	$value$plusargs("N=%d",mem_common::N);
		
	end

	initial begin
		$dumpfile("tb.vcd");
		$dumpvars;
	end
endmodule



