#!/bin/sh

a=`xrandr`
#echo $a;
IFS=$'\n'
command="xrandr --output LVDS1 --auto"
disp_found=0
res_found=0
last_disp="LVDS1"
temp_disp=""
default_side="--left-of"
for line in $a
do
	#echo $line
	IFS=$' '
	for word in $line
	do
		if [[ "$word" =~ ^[0-9]*x[0-9]*[i]*$ ]]; then
			echo indside
			if [ $disp_found -eq 1 -a $res_found -eq 0 ]; then
				command="$command --mode $word"
				res_found=1
				#disp_found=0
			fi;
			break
		fi;
		#disp_found=0
		#res_found=0
		#echo $word
		if [ "$word" = "Screen" -o "$word" = "LVDS1" ]; then
			break
		fi;
		if [ $disp_found -eq 1 ]; then
			if [ "$word" = "disconnected" ]; then
				command="$command --output $temp_disp --off"
				disp_found=0
			elif [ "$word" = "connected" ]; then
				command="$command --output $temp_disp $default_side $last_disp"
				last_disp=$temp_disp
			fi;
			break
		fi;
		temp_disp=$word
		disp_found=1
		echo $temp_disp
	done
	if [ $res_found -eq 1 ]; then
		disp_found=0
		res_found=0
	fi
	#IFS=$'\n'
	#read -r
	echo $command
done
$command
