#!/usr/bin/bash

OUTPUT_PATH=/usr/share/X11/xkb/symbols/prog

if [ -s $OUTPUT_PATH ] && [ "$1" != '--force' ]; then
    echo "File in $OUTPUT_PATH exists!"
else
    cp prog $OUTPUT_PATH
fi
