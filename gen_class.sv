typedef uvm_sequencer#(mem_tx) mem_gen;

//class mem_gen;
//	mem_tx tx;
//	mem_tx temp;
//	mem_tx tque[$];
//
//	task run();
//		$display("GEN is in Progress....");
//		case(mem_common::test_name)
//			"1WR":begin
//				mem_common::genCount=1;
//				tx=new();
//                assert(tx.randomize() with{tx.wr_rd==1;});
//				mem_common::gen2bfm.put(tx);
//				tx.print("1_Writing...");
//			end
//			"5WR":begin
//				repeat(5)begin
//				mem_common::genCount=5;
//					tx=new();
//                    assert(tx.randomize() with{tx.wr_rd==1;});
//					mem_common::gen2bfm.put(tx);
//					//tx.print("5_Writing...");
//				end
//			end
//			"1WR_1RD":begin
//				//Writing
//				mem_common::genCount=2;
//				tx=new();
//                assert(tx.randomize() with{tx.wr_rd==1;});
//              	temp=new tx;
//				mem_common::gen2bfm.put(temp);
//				//tx.print("1WR.. is in Progress...");
//				//Reading
//				//tx.new();
//                assert(tx.randomize() with{tx.wr_rd==0;tx.addr==temp.addr;tx.wdata==0;});
//				mem_common::gen2bfm.put(tx);
//				//tx.print("1RD... is in Progress...");
//			end
//			"5WR_5RD":begin
//				//Writing
//				mem_common::genCount=10;
//				tx=new();
//				repeat(5)begin
//        	        assert(tx.randomize() with{tx.wr_rd==1;});
//					temp=new tx;
//					tque.push_back(temp);
//					//tx.print("5WR.. is in Progress...");
//                    mem_common::gen2bfm.put(temp);
//				end
//				//Reading
//				repeat(5)begin
//					tx=new();
//					temp=tque.pop_front();
//        	        assert(tx.randomize() with{tx.wr_rd==0;tx.addr==temp.addr;tx.wdata==0;});
//					//tx.print("5RD... is in Progress...");
//                    mem_common::gen2bfm.put(tx);
//				end
//			end
//
//			"misMatching":begin
//				//Writing
//				mem_common::genCount=4;
//				tx=new();
//				repeat(1)begin
//        	        assert(tx.randomize() with{tx.wr_rd==1;});
//					temp=new tx;
//					tque.push_back(temp);
//					//tx.print("5WR.. is in Progress...");
//                    mem_common::gen2bfm.put(temp);
//				end
//				repeat(1)begin
//        	        assert(tx.randomize() with{tx.wr_rd==1;tx.wdata==20;});
//					temp=new tx;
//					tque.push_back(temp);
//					//tx.print("5WR.. is in Progress...");
//                    mem_common::gen2bfm.put(temp);
//				end
//
//				//Reading
//				repeat(2)begin
//					tx=new();
//					temp=tque.pop_front();
//        	        assert(tx.randomize() with{tx.wr_rd==0;tx.addr==temp.addr;tx.wdata==0;});
//					//tx.print("5RD... is in Progress...");
//                    mem_common::gen2bfm.put(tx);
//				end
//			end
//
//
//			"NWR_NRD":begin
//				//Writing
//				mem_common::genCount=mem_common::N*2;
//				tx=new();
//				repeat(mem_common::N)begin
//        	        assert(tx.randomize() with{tx.wr_rd==1;});
//            	  	temp=new tx;
//					tque.push_back(temp);
//					mem_common::gen2bfm.put(temp);
//					//tx.print("5WR.. is in Progress...");
//				end
//				//Reading
//				repeat(mem_common::N)begin
//					tx=new();
//					temp=tque.pop_front();
//        	        assert(tx.randomize() with{tx.wr_rd==0;tx.addr==temp.addr;tx.wdata==0;});
//					mem_common::gen2bfm.put(tx);
//					//tx.print("5RD... is in Progress...");
//				end
//			end
//		//	default: $display("Invalid Case...");
//
//		endcase
//	endtask
//endclass
//
//
