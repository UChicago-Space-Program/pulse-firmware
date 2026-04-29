#!/bin/bash

# Turn off laser
gpioset gpiochip2 10=0

read -p "Enter your message: " message

addr_dec=0

# Convert message to binary bytes using 'od' - much more reliable for scripts
# This creates a list of 8-bit binary strings (01001000 etc.)
echo -n "$message" | od -An -t u1 | tr ' ' '\n' | grep -v '^$' | while read -r dec_byte; do
    
    # 1. Convert the decimal ASCII value to exactly 8 bits of binary
    byte_padded=$(echo "obase=2; $dec_byte" | bc | xargs printf "%08d")

    # 2. Convert the address to exactly 5 bits of binary
    ram_addr=$(echo "obase=2; $addr_dec" | bc | xargs printf "%05d")

    # 3. Map Address bits (23-27)
    addr_cmd="23=${ram_addr:4:1} 24=${ram_addr:3:1} 25=${ram_addr:2:1} 26=${ram_addr:1:1} 27=${ram_addr:0:1}"

    # 4. Map Data bits (15-22)
    data_cmd="15=${byte_padded:7:1} 16=${byte_padded:6:1} 17=${byte_padded:5:1} 18=${byte_padded:4:1} 19=${byte_padded:3:1} 20=${byte_padded:2:1} 21=${byte_padded:1:1} 22=${byte_padded:0:1}"

    # 5. Execute the write
    gpioset gpiochip2 $addr_cmd $data_cmd
    gpioset gpiochip2 14=1
    
    echo "Address $addr_dec ($ram_addr) -> Writing Byte: $byte_padded (Char: $(printf "\\$(printf '%03o' "$dec_byte")"))"
    
    gpioset gpiochip2 14=0

    ((addr_dec++))

    if [ $addr_dec -gt 31 ]; then
        echo "Warning: RAM address limit reached."
        break
    fi
done
