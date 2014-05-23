osascript -e 'tell application "Adobe Photoshop CS5.1" to activate'
I=0
nextI=000
while [ $I -lt 720 ]
do
	nextI=`expr $I + 1`
	if [ $nextI -lt 10 ]
		then
		nextI=00$nextI
	elif [ $nextI -lt 100 ]
		then 
		nextI=0$nextI
	fi
	#rotate .5 degree
	./cliclick c:255,11 w:500 m:294,226 w:500 m:488,226 w:500 c:488,284
	sleep 1
	osascript -e 'tell application "System Events" to keystroke return'
	sleep 10
	#sometimes, trim (just don't want to trip at multiples of 90)
	if [ `expr $I % 4` -eq 1 ]
		then
		./cliclick c:255,11 w:500 c:272,265
		sleep 1
		osascript -e 'tell application "System Events" to keystroke return'
		sleep 5
	
		#save as
		osascript -e 'tell application "System Events" to keystroke "s" using {command down, shift down}'
		sleep 2

		osascript -e 'tell application "System Events"' \
		-e "keystroke \"Tundra_${nextI}_rotate_.5\"" \
		-e 'keystroke return' \
		-e 'keystroke return' \
		-e 'end tell'
		sleep 15
	fi

	I=`expr $I + 1`
done

#save as
osascript -e 'tell application "System Events" to keystroke "s" using {command down, shift down}'
sleep 2

osascript -e 'tell application "System Events"' \
-e "keystroke \"Tundra_${nextI}_rotate_.5\"" \
-e 'keystroke return' \
-e 'keystroke return' \
-e 'end tell'
sleep 15