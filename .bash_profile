[ -f "${XDG_ROOT}"/.profile ] && . "${XDG_ROOT}"/.profile
set -o vi
PS1='\w> '
[ -f "$XDG_CONFIG_HOME/bash_unstaged" ] && . "$XDG_CONFIG_HOME/bash_unstaged"
