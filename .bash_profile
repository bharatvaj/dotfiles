# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -n "$1" ] && XDG_ROOT="$1" || XDG_ROOT="$HOME"

export XDG_CONFIG_HOME="$XDG_ROOT/.config"

[ -f "${XDG_CONFIG_HOME}"/.profile ] && . "${XDG_CONFIG_HOME}"/.profile
[ -f "${XDG_CONFIG_HOME}"/bash/bashrc ] && . "${XDG_CONFIG_HOME}"/bash/bashrc
