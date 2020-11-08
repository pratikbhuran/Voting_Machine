/////////////////////////////////////////////////////////////////////////////////////////
// Filename: voting_machine.v
// Date created: 08-11-2020
// Simulation: iverilog v11, GTKWave 
// Description: Design of a 3 candidate eletronic voting machine.
//              
/////////////////////////////////////////////////////////////////////////////////////////
module voting_machine (
    input clk,
    input rst,
    input i_candidate_1,
    input i_andidate_2,
    input i_candidate_3,
    input i_vote_over,
    output reg [5:0] o_count1,
    output reg [5:0] o_count2,
    output reg [5:0] o_count3

);

reg [5:0] party1, party2, party3;
reg r_state, r_next_state;
parameter idle = 0,
          vote =1,
          //candidate_2 =3,
          //candidate_3 =4,
          stop = 2,
          finish =3
;

always @(posedge clk or posedge rst) 
begin
    if (rst = 1'b1) 
        begin
            r_state = idle; 
        end
    else
        r_state = r_next_state;
end
    
always @(r_state or i_candidate_1, or i_candidate_2, or i_candidate_3) 
begin
    case (r_state)

        idle: if (rst = 1'b1) 
        begin
            party1 = 6'b0;
            party2 = 6'b0;
            party3 = 6'b0;
        end 
        else
            r_next_state = vote;
        
        vote: if(i_candidate_1)
        begin
            party1 = party1 +1;
            party2 = party2;
            party3 = party3;
        
            r_next_state = stop;
        end
        
        else if (i_candidate_2) 
        begin
            party1 = party1;
            party2 = party2 +1;
            party3 = party3;
            
            r_next_state = stop;
        end

        else if (i_candidate_3) 
        begin
            party1 = party1;
            party2 = party2;
            party3 = party3 + 1;

            r_next_state = stop;
        end

        stop: if(i_vote_over)
        begin
            r_next_state = finish;
        end
        else
            r_next_state = idle;
        
        finish: 
            o_count1 = party1;
            o_count2 = party2;
            o_count3 = party3;

            r_next_state = finish;

        default: idle;
    endcase
end
endmodule