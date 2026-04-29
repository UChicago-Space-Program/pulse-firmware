#!/bin/bash

echo "Select which frequency you would like to change the FPGA to:"
echo "1) 12.50 MHz"
echo "2) 1.563 MHz"
echo "3) 12.2  kHz"
echo "4) 1.49   Hz"

read -p "Enter choice [1-4]: " choice

case $choice in
    1)
    	gpioset gpiochip2 10=0
    	
        gpioset gpiochip2 12=1
        gpioset gpiochip2 13=1
        
        gpioset gpiochip2 10=1
        ;;
    2)
        gpioset gpiochip2 10=0
    	
        gpioset gpiochip2 12=1
        gpioset gpiochip2 13=0
        
        gpioset gpiochip2 10=1
        ;;
    3)
        gpioset gpiochip2 10=0
    	
        gpioset gpiochip2 12=0
        gpioset gpiochip2 13=1
        
        gpioset gpiochip2 10=1
        ;;
    4)
        gpioset gpiochip2 10=0
    	
        gpioset gpiochip2 12=0
        gpioset gpiochip2 13=0
        
        gpioset gpiochip2 10=1
        ;;
    *)
        echo "Invalid selection."
        ;;
esac

