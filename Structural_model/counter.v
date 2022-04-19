module counter (
    input clk,
    input clear,
    input i_in,
    input i_enable,
    output reg [31:0] o_out
);
    reg [31:0] count = 32'b0;

    always @(posedge clk or negedge clear) begin
        if (clear == 1'b0) begin
            if (i_enable == 1'b0) begin   //enabled
                if (i_in == 1'b1) begin
                    count = count + 1;
                end 
                else begin
                    count = count;
                end
            end
            else begin //disable
                count = 32'bX;
            end
        end
        else begin
            count = 0;
        end
        
        o_out = count;
    end
endmodule
