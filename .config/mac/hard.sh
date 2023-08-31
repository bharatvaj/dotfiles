#!/bin/sh
# TODO Use a general script to shadow copy all
cp $XDG_ROOT/.config/mac/.cache/alacritty_unstaged.yml $XDG_ROOT/.cache/alacritty_unstaged.yml

# map caps lock to esc
hidutil property --set '{"UserKeyMapping":[
{
	  "HIDKeyboardModifierMappingSrc": 0x700000039,
	  "HIDKeyboardModifierMappingDst": 0x700000029
	}
]}'
