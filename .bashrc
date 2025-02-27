[ -z "$XDG_ROOT" ] && . ./.profile
[ -f "$XDG_CONFIG_HOME/sh/unstaged" ] && . "$XDG_CONFIG_HOME/sh/unstaged"
[ -f "$XDG_CONFIG_HOME/bash_unstaged" ] && . "$XDG_CONFIG_HOME/bash_unstaged"
. "${XDG_CONFIG_HOME}/sh/aliases"

PS1='\w> '

bind '"\C-T":"fg\n"'
