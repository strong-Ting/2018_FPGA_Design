`timescale 1ns / 1ps
module final(
    input clk,
    input reset,
    input [1:0] sw,
    input [7:0] rand, 
    input [7:0] data_in,
    output [5:0] dataout,
    output reg led4_g,led4_r,led4_b,
    output reg led5_g,led5_r,led5_b,
    output [3:0] led
    );
wire [1:0] out;


always@(posedge clk)
if(reset)
begin
    led4_r <= 1'b0; led4_g <= 1'b0; led4_b<= 1'b0; led5_r <= 1'b0;  led5_g <= 1'b0; led5_b <= 1'b0;
end
else  
begin
    case(sw)
        2'b00:
            if(out==2'd1) begin led4_r <= 1'b1; led4_g <= 1'b0; led4_b<= 1'b0; led5_r <= 1'b0;  led5_g <= 1'b0; led5_b <= 1'b0; end
            else if (out==2'd3) begin led4_r <= 1'b0; led4_g <= 1'b0; led4_b<= 1'b0; led5_r <= 1'b1;  led5_g <= 1'b0; led5_b <= 1'b0;end
            else if (out==2'd0) begin led4_r <= 1'b0; led4_g <= 1'b0; led4_b<= 1'b0; led5_r <= 1'b0;  led5_g <= 1'b0; led5_b <= 1'b0;end
            else 
            begin
                led4_r <= 1'b1; led4_g <= 1'b1; led4_b<= 1'b0; led5_r <= 1'b1;  led5_g <= 1'b1; led5_b <= 1'b0;
            end
        2'b11:
            if(out==2'd1) begin led4_r <= 1'b1; led4_g <= 1'b0; led4_b<= 1'b0; led5_r <= 1'b0;  led5_g <= 1'b0; led5_b <= 1'b0; end
            else if (out==2'd3) begin led4_r <= 1'b0; led4_g <= 1'b0; led4_b <= 1'b0; led5_r <= 1'b1;  led5_g <= 1'b0; led5_b <= 1'b0;end
            else if (out==2'd0) begin led4_r <= 1'b0; led4_g <= 1'b0; led4_b<= 1'b0; led5_r <= 1'b0;  led5_g <= 1'b0; led5_b <= 1'b0;end
            else 
            begin
                led4_r <= 1'b0; led4_g <= 1'b1; led4_b<= 1'b0; led5_r <= 1'b1;  led5_g <= 1'b0; led5_b <= 1'b0;
            end
        default: 
            begin led4_r <= 1'b0; led4_g <= 1'b0; led4_b <= 1'b0; led5_r <= 1'b0;  led5_g <= 1'b0; led5_b <= 1'b0;end
    endcase      
end

assign out = reset ? 2'd0 : ((data_in>rand) ? 2'd1 : ((data_in < rand) ? 2'd3 : 2'd2));
assign dataout = {reset,sw,out}; //1 + 2  + 3 
    
endmodule