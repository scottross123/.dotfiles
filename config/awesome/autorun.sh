#!/bin/sh

source /home/scott/.Xmodmap
picom

REDSHIFT_PROCESS=$(ps aux | grep redshift)

if [[ -z $REDSHIFT_PROCESS ]]; then
	redshift
fi
