class f_sequence extends uvm_sequence#(f_sequence_item);
  `uvm_object_utils(f_sequence)
  
  function new(string name = "f_sequence");
    super.new(name);
  endfunction

  virtual task body();
    `uvm_info(get_type_name(), $sformatf("******** Generate 1024 Write REQs ********"), UVM_LOW)
    repeat(20) begin
      req = f_sequence_item::type_id::create("req");
      start_item(req);
      assert(req.randomize() with {i_wren == 1;});
      finish_item(req);
    end
    `uvm_info(get_type_name(), $sformatf("******** Generate 1024 Read REQs ********"), UVM_LOW)
    repeat(10) begin
      req = f_sequence_item::type_id::create("req");
      start_item(req);
      assert(req.randomize() with {i_rden == 1;});
      finish_item(req);
    end
    `uvm_info(get_type_name(), $sformatf("******** Generate 1024 Random REQs ********"), UVM_LOW)
    repeat(20) begin
      req = f_sequence_item::type_id::create("req");
      start_item(req);
      assert(req.randomize());
      finish_item(req);
    end
    `uvm_info(get_type_name(), $sformatf("******** Generate 10 read and write same time ********"), UVM_LOW)
    repeat(10) begin
      req = f_sequence_item::type_id::create("req");
      start_item(req);
      assert(req.randomize() with {{i_rden,i_wren} == 2'b11;});
      finish_item(req);
    end
    `uvm_info(get_type_name(), $sformatf("******** Generate 10 no read and write at same time ********"), UVM_LOW)
    repeat(10) begin
      req = f_sequence_item::type_id::create("req");
      start_item(req);
      assert(req.randomize() with {{i_rden,i_wren} == 2'b00;});
      finish_item(req);
    end
  endtask
endclass
