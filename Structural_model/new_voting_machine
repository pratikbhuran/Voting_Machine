/////////////////////////////////////////////////////////////////////////////////////////
// Filename: new_vo_machine.v
// Date created: 10-04-2022
// Simulation: iverilog v11, GTKWave 
// Description: Design of a 3 candidate voting machine using Counters.
// Nomencleture: i = Input, o = Output, r = register
//             
/////////////////////////////////////////////////////////////////////////////////////////
//`include "counter.v"
module new_vm (
    input clk,							
    input rst,							// input High to reset counting  (active high)
    input i_candidate_1,				// input to vote for candidate 1
    input i_candidate_2,				// input to vote for candidate 2
    input i_candidate_3,				// input to vote for candidate 3
    input i_over,				// input high to get total votes after voting is over

    output wire [31:0] o_count1,		// output for total number of votes of candidate 1
    output wire [31:0] o_count2,		// output for total number of votes of candidate 2
    output wire [31:0] o_count3			// output for total number of votes of candidate 3
);

counter ct1(.clk(clk), .clear(rst), .i_enable(i_over), .i_in(i_candidate_1), .o_out(o_count1));
counter ct2(.clk(clk), .clear(rst), .i_enable(i_over), .i_in(i_candidate_2), .o_out(o_count2));
counter ct3(.clk(clk), .clear(rst), .i_enable(i_over), .i_in(i_candidate_3), .o_out(o_count3));
    
endmodule
