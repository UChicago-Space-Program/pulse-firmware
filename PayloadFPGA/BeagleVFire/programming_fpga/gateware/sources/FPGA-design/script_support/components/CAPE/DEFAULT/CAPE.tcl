# Creating SmartDesign "CAPE"
set sd_name {CAPE}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_SLAVE_SLAVE_PENABLE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_SLAVE_SLAVE_PSEL} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_SLAVE_SLAVE_PWRITE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PRESETN} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_SLAVE_SLAVE_PREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_SLAVE_SLAVE_PSLVERR} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN42} -port_direction {OUT}

sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_14} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_16} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN12} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN15} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN23} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN25} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN27} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN30} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN41} -port_direction {INOUT} -port_is_pad {1}

# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_SLAVE_SLAVE_PADDR} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_SLAVE_SLAVE_PWDATA} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {GPIO_OE} -port_direction {IN} -port_range {[27:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {GPIO_OUT} -port_direction {IN} -port_range {[27:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {APB_SLAVE_SLAVE_PRDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {GPIO_IN} -port_direction {OUT} -port_range {[27:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {INT} -port_direction {OUT} -port_range {[39:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {P8} -port_direction {INOUT} -port_range {[46:3]} -port_is_pad {1}

# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {APB_SLAVE} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {slave} -port_bif_mapping {\
"PADDR:APB_SLAVE_SLAVE_PADDR" \
"PSELx:APB_SLAVE_SLAVE_PSEL" \
"PENABLE:APB_SLAVE_SLAVE_PENABLE" \
"PWRITE:APB_SLAVE_SLAVE_PWRITE" \
"PRDATA:APB_SLAVE_SLAVE_PRDATA" \
"PWDATA:APB_SLAVE_SLAVE_PWDATA" \
"PREADY:APB_SLAVE_SLAVE_PREADY" \
"PSLVERR:APB_SLAVE_SLAVE_PSLVERR" } 

sd_create_pin_slices -sd_name ${sd_name} -pin_name {INT} -pin_slices {[15:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {INT} -pin_slices {[36:16]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {INT} -pin_slices {[39:37]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {INT[39:37]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[10:10]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[11:11]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[12:12]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[13:13]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[14:14]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[15:15]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[16:16]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[17:17]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[18:18]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[19:19]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[20:20]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[21:21]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[22:22]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[23:23]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[24:24]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[25:25]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[26:26]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[27:27]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[28:28]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[29:29]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[30:30]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[31:31]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[32:32]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[33:33]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[34:34]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[35:35]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[36:36]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[37:37]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[38:38]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[39:39]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[3:3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[40:40]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[41:41]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[42:42]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[43:43]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[44:44]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[45:45]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[46:46]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[4:4]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[5:5]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[6:6]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[7:7]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[8:8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8} -pin_slices {[9:9]}
# Add APB_BUS_CONVERTER_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {APB_BUS_CONVERTER} -instance_name {APB_BUS_CONVERTER_0}



# Add CAPE_DEFAULT_GPIOS instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CAPE_DEFAULT_GPIOS} -instance_name {CAPE_DEFAULT_GPIOS}



# Add CoreAPB3_CAPE_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreAPB3_CAPE} -instance_name {CoreAPB3_CAPE_0}



# Add GPIO_13_BIBUF instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {GPIO_13_BIBUF}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {GPIO_13_BIBUF:E} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {GPIO_13_BIBUF:Y}



# Add GPIO_19_BIBUF instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {GPIO_19_BIBUF}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {GPIO_19_BIBUF:E} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {GPIO_19_BIBUF:Y}



# Add P8_GPIO_UPPER_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {P8_GPIO_UPPER} -instance_name {P8_GPIO_UPPER_0}



# Add P9_14_BIBUF instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {P9_14_BIBUF}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P9_14_BIBUF:E} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {P9_14_BIBUF:Y}



# Add P9_16_BIBUF instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {P9_16_BIBUF}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P9_16_BIBUF:E} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {P9_16_BIBUF:Y}



# Add P9_GPIO_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {P9_GPIO} -instance_name {P9_GPIO_0}



# Add pulse_signal_generator_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {pulse_signal_generator} -instance_name {pulse_signal_generator_0}



# Add PWM_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CAPE_PWM} -instance_name {PWM_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PWM_0:PWM_1}



# Add PWM_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CAPE_PWM} -instance_name {PWM_1}



# Add PWM_2 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CAPE_PWM} -instance_name {PWM_2}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_0_PAD" "P8[3:3]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_11_PAD" "P8[14:14]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_12_PAD" "P8[15:15]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_13_PAD" "P8[16:16]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_14_PAD" "P8[17:17]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_15_PAD" "P8[18:18]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_17_PAD" "P8[20:20]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_18_PAD" "P8[21:21]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_19_PAD" "P8[22:22]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_1_PAD" "P8[4:4]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_20_PAD" "P8[23:23]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_21_PAD" "P8[24:24]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_22_PAD" "P8[25:25]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_23_PAD" "P8[26:26]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_24_PAD" "P8[27:27]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_25_PAD" "P8[28:28]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_26_PAD" "P8[29:29]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_27_PAD" "P8[30:30]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_2_PAD" "P8[5:5]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_3_PAD" "P8[6:6]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_4_PAD" "P8[7:7]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_5_PAD" "P8[8:8]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_6_PAD" "P8[9:9]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_7_PAD" "P8[10:10]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_8_PAD" "P8[11:11]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_9_PAD" "P8[12:12]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_13_BIBUF:D" "PWM_2:PWM_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_13_BIBUF:PAD" "P8[13:13]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_19_BIBUF:D" "PWM_2:PWM_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_19_BIBUF:PAD" "P8[19:19]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8[31:31]" "P8_GPIO_UPPER_0:GPIO_0_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8[32:32]" "P8_GPIO_UPPER_0:GPIO_1_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8[33:33]" "P8_GPIO_UPPER_0:GPIO_2_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8[34:34]" "P8_GPIO_UPPER_0:GPIO_3_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8[35:35]" "P8_GPIO_UPPER_0:GPIO_4_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8[36:36]" "P8_GPIO_UPPER_0:GPIO_5_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8[37:37]" "P8_GPIO_UPPER_0:GPIO_6_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8[38:38]" "P8_GPIO_UPPER_0:GPIO_7_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8[39:39]" "P8_GPIO_UPPER_0:GPIO_8_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8[40:40]" "P8_GPIO_UPPER_0:GPIO_9_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8[41:41]" "P8_GPIO_UPPER_0:GPIO_10_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8[42:42]" "P8_GPIO_UPPER_0:GPIO_11_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8[43:43]" "P8_GPIO_UPPER_0:GPIO_12_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8[44:44]" "P8_GPIO_UPPER_0:GPIO_13_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8[45:45]" "P8_GPIO_UPPER_0:GPIO_14_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8[46:46]" "P8_GPIO_UPPER_0:GPIO_15_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8_GPIO_UPPER_0:PCLK" "P9_GPIO_0:PCLK" "PCLK" "PWM_0:PCLK" "PWM_1:PCLK" "PWM_2:PCLK" "pulse_signal_generator_0:clk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8_GPIO_UPPER_0:PRESETN" "P9_GPIO_0:PRESETN" "PRESETN" "PWM_0:PRESETN" "PWM_1:PRESETN" "PWM_2:PRESETN" "pulse_signal_generator_0:resetn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_14" "P9_14_BIBUF:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_14_BIBUF:D" "pulse_signal_generator_0:send_signal_n" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_16" "P9_16_BIBUF:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_16_BIBUF:D" "pulse_signal_generator_0:output_clock" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_GPIO_0:GPIO_10_PAD" "P9_PIN23" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_GPIO_0:GPIO_12_PAD" "P9_PIN25" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_GPIO_0:GPIO_14_PAD" "P9_PIN27" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_GPIO_0:GPIO_17_PAD" "P9_PIN30" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_GPIO_0:GPIO_19_PAD" "P9_PIN41" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_GPIO_0:GPIO_1_PAD" "P9_PIN12" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_GPIO_0:GPIO_4_PAD" "P9_PIN15" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_PIN42" "pulse_signal_generator_0:send_signal" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_IN" "GPIO_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_OE" "pulse_signal_generator_0:modified_gpio_enable" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_OUT" "pulse_signal_generator_0:modified_gpio" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_OE" "pulse_signal_generator_0:gpio_enable" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_OUT" "pulse_signal_generator_0:gpio_out" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"INT[15:0]" "P8_GPIO_UPPER_0:INT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"INT[36:16]" "P9_GPIO_0:INT" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_BUS_CONVERTER_0:APB_MASTER" "CoreAPB3_CAPE_0:APB3mmaster" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_BUS_CONVERTER_0:APB_SLAVE" "APB_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_CAPE_0:APBmslave0" "PWM_0:APBslave" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_CAPE_0:APBmslave1" "P8_GPIO_UPPER_0:APB_bif" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_CAPE_0:APBmslave2" "P9_GPIO_0:APB_bif" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_CAPE_0:APBmslave4" "PWM_1:APBslave" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_CAPE_0:APBmslave5" "PWM_2:APBslave" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "CAPE"
generate_component -component_name ${sd_name}
