#!/usr/bin/env bash

#activate seashore
osascript -e 'tell application "Seashore" to activate'
I=18
while [ $I -lt 100 ]
do
	nextI=`expr $I + 1`
	if [ $nextI -lt 10 ]
		then
		nextI=00$nextI
	elif [ $nextI -lt 100 ]
		then 
		nextI=0$nextI
	fi

	J=0
	#fewer iterations since we are scaling more
	while [ $J -lt 20 ]
	do
		#resize dialog
		#resize down
		osascript -e 'tell application "System Events"' \
		-e 'keystroke "i" using {command down, option down}' \
		-e 'keystroke tab' \
		-e 'keystroke tab' \
		-e 'keystroke tab' \
		-e 'keystroke " "' \
		-e 'keystroke tab using {shift down}' \
		-e 'keystroke tab using {shift down}' \
		-e 'keystroke "2203"' \
		-e 'keystroke tab using {shift down}' \
		-e 'keystroke tab using {shift down}' \
		-e 'keystroke "1347"' \
		-e 'keystroke tab' \
		-e 'keystroke return' \
		-e 'end tell'
		sleep 2
		#resize dialog
		#resize up
		osascript -e 'tell application "System Events"' \
		-e 'keystroke "i" using {command down, option down}' \
		-e 'keystroke tab' \
		-e 'keystroke tab' \
		-e 'keystroke tab' \
		-e 'keystroke " "' \
		-e 'keystroke tab using {shift down}' \
		-e 'keystroke tab using {shift down}' \
		-e 'keystroke "2208"' \
		-e 'keystroke tab using {shift down}' \
		-e 'keystroke tab using {shift down}' \
		-e 'keystroke "1350"' \
		-e 'keystroke tab' \
		-e 'keystroke return' \
		-e 'end tell'
		sleep 2
		J=`expr $J + 1`
	done
	#save as
	osascript -e 'tell application "System Events" to keystroke "s" using {command down, shift down}'
	sleep 1
	#and enter new index
	osascript -e 'tell application "System Events"' \
	-e "keystroke \"Tundra_${nextI}_resize_5\"" \
	-e 'keystroke return' \
	-e 'end tell'
	sleep 10

	I=`expr $I + 1`
	echo $I
done