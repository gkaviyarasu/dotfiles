#!/bin/sh
a=`xrandr`

i3_config="/home/kavi/.i3/config"
i3_office="/home/kavi/.i3/config_office"
i3_home="/home/kavi/.i3/config_home"
i3_actual="/home/kavi/.i3/config_actual"
if [[ "$a" =~ [.]*DP1\ connected[.]* ]]; then
	#if [ -e "$i3_config" ]; then
	#	rm -f "$i3_config"
	#fi
	#ln -s "$i3_office" "$i3_config"
	cat $i3_actual > "$i3_config"
	cat $i3_office >> "$i3_config"
	xrandr --output VIRTUAL1 --off --output DP3 --off --output DP2 --off --output DP1 --mode 1280x1024 --pos 1280x0 --rotate normal --output HDMI3 --off --output HDMI2 --off --output HDMI1 --off --output LVDS1 --mode 1280x800 --pos 0x224 --rotate normal --output VGA1 --off
	i3-msg restart
elif [[ "$a" =~ [.]*HDMI1\ connected[.]* ]]; then
	#if [ -e "$i3_config" ]; then
	#	rm -f "$i3_config"
	#fi
 	#ln -s "$i3_home" "$i3_config"
	cat $i3_actual > $i3_config
	cat $i3_home >> $i3_config
	xrandr --output VIRTUAL1 --off --output DP3 --off --output DP2 --off --output DP1 --off --output HDMI3 --off --output HDMI2 --off --output HDMI1 --mode 1920x1080 --pos 0x0 --rotate normal --output LVDS1 --mode 1280x800 --pos 1920x280 --rotate normal --output VGA1 --off
	i3-msg restart
else

xrandr --output VIRTUAL1 --off --output DP3 --off --output DP2 --off --output DP1 --off --output HDMI3 --off --output HDMI2 --off --output HDMI1 --off --output LVDS1 --auto --output VGA1 --off

fi
