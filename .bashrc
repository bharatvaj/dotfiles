[ -z "$XDG_HOME" ] && . ./.profile
[ -f "$XDG_CONFIG_HOME/sh/unstaged" ] && . "$XDG_CONFIG_HOME/sh/unstaged"
[ -f "$XDG_CONFIG_HOME/bash_unstaged" ] && . "$XDG_CONFIG_HOME/bash_unstaged"
. "${XDG_CONFIG_HOME}/sh/aliases"

PS1='\w> '

stty susp undef
bind '"\C-z":"fg\015"'
