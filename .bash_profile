[ -n "$1" ] && XDG_ROOT="$1" || XDG_ROOT="$HOME"

[ -f "${XDG_ROOT}"/.profile ] && . "${XDG_ROOT}"/.profile
[ -f "${XDG_CONFIG_HOME}"/bash/bashrc ] && . "${XDG_CONFIG_HOME}"/bash/bashrc
