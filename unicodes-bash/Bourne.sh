#!/usr/bin/env bash
set +x
function base(){
	TERM_WIDTH=$(tput lines)
	TERM_HEIGHT=$(tput cols)
	for ((y=0;y<$TERM_WIDTH;y++));do
	for ((x=0;x<$TERM_HEIGHT;x++));do
		echo -n "."
	done
	echo -e "\n"
done

}

base
