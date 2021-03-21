#!/bin/sh

RRD_FILE=$1
DATE=`date +"%Y-%m-%d-%H-%M-%S"`

rrdtool graph $RRD_FILE.png --imgformat PNG -w 1024 -h 760 --start now-30d --end now 				\
		--title "Appliance CPU Time" --watermark "Generated by ISVA Support RRD Grapher v1.0 on $DATE" 		\
		DEF:syscpu=$RRD_FILE:syscpu:MAX   LINE2:syscpu#FF0000:"System CPU"		\
		DEF:usercpu=$RRD_FILE:usercpu:MAX LINE2:usercpu#000000:"User CPU"		\
		DEF:idlecpu=$RRD_FILE:idlecpu:MAX LINE2:idlecpu#0000FF:"Idle CPU"
