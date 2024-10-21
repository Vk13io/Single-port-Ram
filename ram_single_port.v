`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:50:17 09/17/2024 
// Design Name: 
// Module Name:    ram_single_port 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ram_single_port(clk,rst,we_in,re_in,addr_in, data);
input clk,rst,we_in,re_in;
input [3:0] addr_in;
reg [7:0] mem_i[15:0];
reg [7:0] temp_data;
reg [7:0] data_reg;
inout [7:0] data;
integer i;
 
 
 
always @(posedge clk)

begin

if (rst)
begin
for(i=0;i<16;i=i+1)
	mem_i[i]<=0;
end

	else if(we_in && !re_in)
	begin
		data_reg<=data;
		mem_i[addr_in] <= data_reg;
	end
		
end

always @(posedge clk)

begin
if (rst)
temp_data<=0;
	else if(!we_in && re_in)
		 temp_data <= mem_i[addr_in];

end
assign data = (!we_in && re_in) ? temp_data : 8'hz;

endmodule
