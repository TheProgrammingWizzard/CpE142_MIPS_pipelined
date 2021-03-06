`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2020 10:59:57 AM
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(op2, op1, opcode, out, carryout, zero, clk, rst);
input [15:0] op1, op2;
input [3:0] opcode;
input clk, rst;
output [15:0] out;
output carryout, zero;
reg[16:0] tempout;
reg zerotemp;// rotateregtemp;
reg [15:0] rotatereg;
reg [15:0] rotatecount;
integer i, opmax;
assign out = tempout[15:0];
assign carryout = tempout[16];
assign zero = zerotemp;
always @(opcode or op1 or op2 or rst)
begin
    if(!rst)
    begin
    case(opcode)
        4'b1111: tempout <= op1 + op2;
        4'b1110: tempout <= op1 - op2;
        4'b1101: begin 
             tempout <= op1 & op2;
             zerotemp = ((op1 ^ op2) == 0);
            end
        4'b1100: tempout <= op1 | op2;
        4'b0001: tempout <= op1 * op2;
        4'b0010: tempout <= op1 / op2;
        4'b1010: tempout <= op1 << op2;
        4'b1011: tempout <= op1 >> op2;        
        4'b1000:
        begin
            rotatereg = op1;
           
            opmax = op2;
            for(i = 0; (i < 16) && (i < opmax); i = i + 1)
             begin                              
                rotatereg = {rotatereg[14:0], rotatereg[15]};                            
             end
             tempout = rotatereg;
        end                    
        4'b1001:
         begin
           rotatereg = op1;
           opmax = op2;
            for(i = 0; (i < 16) && (i < opmax); i = i + 1)
            begin
               rotatereg = {rotatereg[0], rotatereg[15:1]};                    
              
            end
            tempout = rotatereg;
         end
        4'b0000:zerotemp = (op1 < op2);
        4'b0110:zerotemp = (op1 > op2);
        4'b0100:zerotemp = 1;
        default: tempout <= {16'bz};
    endcase;
    end
    else 
    begin
        tempout <= {16'b0};
        rotatereg <= {16'b0};
        zerotemp = 0; 
    end
end


endmodule
