#!/bin/bash

menu_show(){
  menu=0
  while [ "$menu" -eq 0 ] ; do
    #makes menu
    read input
  	case $input in
      help)  printf "\n'showtelem' for a list of current options\n'example' to see an example option\n'defaults' to see a list of default options\notherwise just type a command to add\n\n";;
      clear)
      printf "type 'help' for a list of commands or 'ctrl+c' to exit at any time\n"
      clear ;;
  		showtelem) printf '%s\n' "${Telem[@]}" ;;
      example) printf "\nAn example command should look as follows\n-A udp:192.168.1.2:14550\n";;
  		defaults)
        printf '--' "\n\n---Telem Type---\n1) -A  Console Switch (usually Wi-Fi link)\n2) -C  Telemetry Switch\n3) -B Specify Extra GPS\n4) -E Specify Extra GPS\n"
        printf '--' "---Command---\n 'udp:youriphere:14550' Default for ip (over wifi, etc)'/dev/ttyAMA0' Default UART\n'/dev/ttyUSB0' Default For Telem from Pi USB\n"
        printf '--' "---More Options---\n visit Emlid Docs https://docs.emlid.com/navio2/common/ardupilot/installation-and-running/\n or Ardupilot Docs http://ardupilot.org/copter/docs/parameters.html?highlight=serial#serial-parameters\nfor more info\n\n"
      ;;
  		*) printf "you have entered the following command is this correct [y/n]\n'$input'\n"
        read confirm
      	case $confirm in
      		[yY][eE][sS]|[yY])
            Telem+="$input"
      		[nN][oO]|[nN])
      			clear
            echo "Try typing the command again" ;;
      		*)
      			clear
      			printf "invalid input, please try again\n\n"
      			sleep 1 ;;
        esac
  	esac
  done
}

Telem[1]="option1"
Telem[2]="option2"
printf "Welcome to navtools\ntype 'help' for a list of commands or 'ctrl+c' to exit at any time\n"
menu_show
