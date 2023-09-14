interface f_interface(input clk, reset);
    bit i_wren, i_rden;
    bit o_full,o_empty,o_alm_full,o_alm_empty;
    bit [127:0] i_wrdata;
    bit [127:0] o_rddata;

clocking d_cb @(posedge clk);
  output  i_wren, i_rden,i_wrdata;    
endclocking

clocking m_cb @(posedge clk);
    input o_full,o_empty,o_alm_full,o_alm_empty,o_rddata;
  input i_wren, i_rden,i_wrdata;
endclocking

modport d_mp (input clk,reset,clocking d_cb);
    modport m_mp (input clk,reset,clocking m_cb);
        
 endinterface
