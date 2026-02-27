#!/bin/sh

usage="
Run commands in parallel
	Usage: $0 cmd1 cmd2
"

if [ "$1" = "-h" ]; then
	echo "$usage"
	exit
fi

if [ $# -ne 2 ]; then
	echo "$usage" >&2
	exit 1
fi


eval "$1" &
pid1=$!

eval "$2" &
pid2=$!

trap 'kill $pid1 $pid2' INT TERM HUP

wait
