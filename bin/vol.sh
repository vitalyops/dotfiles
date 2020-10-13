#!/usr/bin/env bash

fg="$(xres color1)"
light="$(xres color8)"

while getopts idq options
do
	case $options in
		i)
			amixer sset Master 1%+
			;;

		d)
			amixer sset Master 3%-
			;;
		q)
			if [[ $(amixer get Master | grep 'Right' | awk -F'[][] ' '{ print $2 }' | tr -d '\n') = "[on]" ]] >& /dev/null
			then
				cur_vol=$(amixer get Master | grep 'Right' | awk -F'[][]' '{ print $2 }' | tr -d '\n')
				echo -ne "%{F$light}vol %{F$fg}$cur_vol"
			else
				echo -ne "%{F$light}vol %{F$fg}muted" >& /dev/null
			fi
			;;
	esac
done
