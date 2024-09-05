#!/bin/bash

if [ $DESKTOP_SESSION -eq "plasma" ]; then
	echo "[Layout]" >> ~/.config/kxkbrc
	echo "LayoutList=eu" >> ~/.config/kxkbrc
	echo "ResetOldOptions=true" >> ~/.config/kxkbrc
	echo "Use=true" >> ~/.config/kxkbrc
fi
