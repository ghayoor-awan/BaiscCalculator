`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:49:54 10/31/2023 
// Design Name: 
// Module Name:    basicmath 
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
module basicmath(ans, op1, op2, sub, add, mult, div
    );
	 input [1:0]op1;
	 input [1:0]op2;
	 input sub, div, mult, add;
	 output reg [3:0]ans;
	 
	 
	 wire [3:0]zarab;
	 wire [2:0]out;
	 wire [3:0]division;
	 wire [3:0]finalMult;
	 wire [3:0]finalDiv;
	 

	 multiplier  m1(zarab, op1, op2);
	 adder a1(op1, op2, sub, out);
	 divider     d1(division, op1, op2);
	 
	 
	 wire [3:0]decoder;
	 assign decoder= {add,mult,sub,div};
    assign finalMult = zarab;
    assign finalDiv = division;	 
     
	 always @(*)
	 begin

		if(decoder == 4'b1000)
			begin
				 ans = out;
			end
		else if(decoder == 4'b0100)
			begin
				ans = finalMult;
			end
	    else if(decoder == 4'b0010)
			begin
				 ans = out;
			end
		else if(decoder == 4'b0001)
			begin
				ans = finalDiv;
			end
		else 
                ans = 4'b0000;
	 end


endmodule


module multiplier(out, a, b);

	input [1:0]a;
	input [1:0]b;
	output [3:0]out;
	
	wire [3:0]w;
	
	assign w[0] = a[0] & b[1];
	assign w[1] = a[1] & b[0];
	assign w[2] = w[0] & w[1];
	
	assign w[3] = a[1] & b[1];
	assign out[3] = w[2] & w[3];   //Output 3rd bit
	
	assign out[2] = w[2] ^ w[3];  //Output 2nd bit
	
	assign out[1] = w[0] ^ w[1];   //Output 1st bit
	
	assign out[0] = a[0] & b[0];		// //Output 0th bit
	
	
	
endmodule

module adder (
input [1:0]a,b,
input s,
output reg [2:0]out);

always @(*) begin
    if(s==0)
        out=a+b;
    else
        out=a-b;
    end
endmodule


module divider (ans, Q, M);
		input [1:0] Q; //dividend
		input [1:0] M; //divisor
		output [3:0]ans; 
		reg [1:0] a1, b1=0; //these variables are going to update during looping
		reg [1:0] p1; 		//initialize A as mention in booths algo
		integer i;			//going to keep track the number of times loop will be running
		
		always@ (Q or M)
		begin
				//initialize the variables.
				a1 = Q;
				b1 = M;
				p1 = 0; 	//initialize A=0
				for (i=0; i<2; i=i+1) 
				begin //start the for loop, it will run n times where n-no of bits \
					p1 = {p1[0] , a1[1]}; 			//shift left A
					a1[1] = a1[0];				//shift left Q
					p1 = p1 - b1;							//A-A-M
					if (p1[1] == 1) 		
						begin		//checking A<0 i.e MSB-1 (-ve weigh in 2's comp)
							a1[0]= 0;
							p1	= p1 + b1;     //A-A+M
						end
					else 			
						a1[0] = 1;			//Q0 = 1
				end
		end
			 assign ans[1:0] = a1; //Quotient
			 assign ans[3:2] = p1; //Remainder
endmodule



//Calculator by Direct Method

/*

module basicmath_new(ans, op1, op2, sub, add, mult, div
    );
	 input [1:0]op1;
	 input [1:0]op2;
	 input sub, div, mult, add;
	 output reg [3:0]ans;
	 
	 wire [3:0]dec;
	 
	 assign dec={add, mult, sub, div};
	 
	 always @(*) begin
	 
	 case(dec)
	   4'b1000: ans = op1+op2;
	   4'b0100: ans = op1*op2;
	   4'b0010: ans = op1-op2;
	   4'b0001: ans = op1/op2;
	   
	   default
	      ans=4'b0000;
	  endcase
	  end
	 
	 
endmodule


 */