`timescale 1ns/100ps
module pulse_signal_generator(
input    clk, // 50 MHz clock
input    resetn,
input [27:0] gpio_out,
input [27:0] gpio_enable,
output [27:0] modified_gpio,
output [27:0] modified_gpio_enable,
output  send_signal, // Pin P9_42, and use P9_1 for ground
output  send_signal_n,  // Pin P9_14
output  output_clock    // Pin P9_16
);

assign modified_gpio = {gpio_out[27:7], toggle_sending_signal, write_signal, gpio_out[4:0]};
assign modified_gpio_enable = {gpio_enable[27:7], 2'b11, gpio_enable[4:0]};

// ------------------------------------------------------------------------
// Internal Clock Code

reg [25:0] internal_clock_counter;
reg [1:0] clock_frequency_choice = gpio_out[13:12];

// Main Clock Counter
always @(posedge clk or negedge resetn) begin
	if(!resetn) internal_clock_counter <= 26'h0;
	else        internal_clock_counter <= internal_clock_counter + 1;
end

/*
internal_clock_counter[1] is a 12.5  MHz clock
internal_clock_counter[4] is a 1.563 MHz clock
internal_clock_counter[11] is a 12.2 kHz clock
internal_clock_counter[24] is a 1.49  Hz clock
*/
reg internal_clock = clock_frequency_choice[0] ?
			(clock_frequency_choice[1] ? internal_clock_counter[1] : internal_clock_counter[4]) :
			(clock_frequency_choice[1] ? internal_clock_counter[11] : internal_clock_counter[24]);
			
// ------------------------------------------------------------------------
// Internal RAM Code

reg toggle_sending_signal = (resetn == 1'b1 && gpio_out[10] == 1'b1) ? 1'b1 : 1'b0;
reg write_signal = (resetn == 1'b1 && gpio_out[14] == 1'b1) ? 1'b1 : 1'b0;

reg [7:0] internal_message_ram [0:31];
// RAM Write Logic
always @(posedge clk) begin
	if (!toggle_sending_signal && write_signal) begin
		internal_message_ram[gpio_out[27:23]] <= gpio_out[22:15];
	end
end

// ------------------------------------------------------------------------


reg current_message_bit = 1'b0;
assign send_signal = toggle_sending_signal ? current_message_bit : 1'b0;
assign send_signal_n = toggle_sending_signal ? ~current_message_bit : 1'b0;
assign output_clock = toggle_sending_signal ? internal_clock : 1'b0;

reg [4:0] message_address_counter = 5'b00000;
reg [2:0] message_bit_counter = 3'b000;
// Message Transmission Logic
always @(posedge internal_clock or negedge resetn) begin
	if (!resetn) begin
		message_address_counter <= 5'b0;
		message_bit_counter     <= 3'b0;
		current_message_bit     <= 1'b0;
	end
	else begin
		if (toggle_sending_signal) begin
			current_message_bit <= internal_message_ram[message_address_counter][message_bit_counter];
		
			if (message_bit_counter == 3'b111) begin
				if (message_address_counter == 5'b11111) begin
					// Hang on last bit
				end
				else begin
					message_bit_counter <= 3'b000;
					message_address_counter <= message_address_counter + 1;
				end
			end
			else begin
				message_bit_counter <= message_bit_counter + 1;
			end
		end
		else begin
			message_address_counter <= 5'b0;
			message_bit_counter     <= 3'b0;
			current_message_bit     <= 1'b0;
		end
	end
end

endmodule
