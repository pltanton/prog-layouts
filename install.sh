#!/usr/bin/bash

OUTPUT_PATH=/usr/share/X11/xkb/symbols/ru
START='START DIKTOR LAYOUT'
END='END DIKTOR LAYOUT'

if grep "$START" $OUTPUT_PATH && grep "$END" $OUTPUT_PATH
then
	echo "Found previous instalation, replacing."
	TEMP_PATH=/tmp/diktor_tmp
	awk "
		BEGIN {p=1}
		/^\\/\\/ $START/ {print;system(\"cat diktor\");p=0}
		/^\\/\\/ $END/ {p=1}
		p" $OUTPUT_PATH > $TEMP_PATH
		mv $TEMP_PATH $OUTPUT_PATH
else
	echo "First install, appending"
	(echo "// $START"; cat ./diktor; echo "// $END") >> $OUTPUT_PATH
fi
