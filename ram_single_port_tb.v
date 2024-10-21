`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:01:20 09/17/2024
// Design Name:   ram_single_port
// Module Name:   /home/vikas/ram_single_port/ram_single_port_tb.v
// Project Name:  ram_single_port
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ram_single_port
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ram_single_port_tb;

	// Inputs
	reg clk;
	reg rst;
	reg we_in;
	reg re_in;
	reg [3:0] addr_in;
	reg [7:0]temp_data;
	// Bidirs
	wire [7:0] data;
	integer l;
	
	
		
	// Instantiate the Unit Under Test (UUT)
	ram_single_port uut (
		.clk(clk),.rst(rst), 
		.we_in(we_in),.re_in(re_in), 
		.addr_in(addr_in),.data(data)
	);
	
	
	
	assign data = (we_in && !re_in)?temp_data:8'hz;
	always
	begin
	#5 clk =   1'b0;
	#5 clk = ~clk;
	
	end
	

	
	
	task initialize;
	begin
	we_in=1'b0;
	re_in=1'b1;
	rst=1'b0;
	temp_data=8'h0;
	
	end
	endtask
	
	task stimulus(input [3:0]j,input [7:0]i);
	begin
	@(negedge clk)
	addr_in=j;
	temp_data=i;
	end
	endtask
	
	
	task write_in;
	begin
	@(negedge clk)
	we_in=1'b1;
	re_in=1'b0;
	
	end
	endtask
	
	
	task read_in;
	begin
	@(negedge clk)
	we_in=1'b0;
	re_in=1'b1;
	
	end
	endtask


	task delay;
	begin
		#10;
	end
	endtask
	
	
	initial begin
		initialize;
		delay;
		write_in;
		for(l=0;l<16;l=l+1)
			begin
			stimulus(l,l);
			delay;
			end
		delay;
		read_in;
		#50;
		$finish;
	end
      initial
  $monitor("re=%b,we=%b,data=%b,tempdata=%b",re_in,we_in,data,temp_data);
endmodule

