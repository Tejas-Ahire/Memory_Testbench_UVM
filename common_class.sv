`define NEW_COMP\
function new(string name, uvm_component parent);\
		super.new(name, parent);\
endfunction

`define NEW_OBJ\
function new(string name="");\
		super.new(name);\
endfunction


`define MASTER 1
`define SLAVE 0

`define WIDTH 8
`define DEPTH 32
`define ADDR_WIDTH $clog2(`DEPTH)

class mem_common;
  	static string test_name;
	static int count=5;
	static mailbox gen2bfm=new();
	static mailbox mon2cov=new();
	static mailbox mon2sbd=new();
	static int matching,misMatching;
	static int genCount,bfmCount;
endclass



