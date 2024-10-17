#!/bin/bash


if [[ $DESKTOP_SESSION = "plasma" ]] then
	if [[ ! -f ~/.config/kxkbrc ]]; then
		touch ~/.config/kxkbrc
	fi

	echo "[Layout]" >> ~/.config/kxkbrc
	echo "LayoutList=eu" >> ~/.config/kxkbrc
	echo "ResetOldOptions=true" >> ~/.config/kxkbrc
	echo "Use=true" >> ~/.config/kxkbrc
fi
