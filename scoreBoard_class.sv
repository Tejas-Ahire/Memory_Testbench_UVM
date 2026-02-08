class mem_sbd extends uvm_scoreboard;
	mem_tx tx;
	uvm_analysis_imp#(mem_tx, mem_sbd) ap_imp;
	`uvm_component_utils(mem_sbd)
	`NEW_COMP
	int asso[int];

	function void build();
		ap_imp = new("ap_imp", this);
	endfunction


	function void write(mem_tx tx);
		if(tx.wr_rd == 1)
			asso[tx.addr] = tx.wdata;
		else begin
			if(asso[tx.addr] == tx.rdata)
				mem_common::matching++;
			else
				mem_common::misMatching++;
		end
	endfunction
endclass

