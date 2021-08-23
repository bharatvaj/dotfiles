# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi

[ -f ~/.profile ] && . ~/.profile
[ -f ~/.personal/config ] && . ~/.personal/config
[ -f "${XDG_CONFIG_HOME}/bash/bashrc" ] && . "${XDG_CONFIG_HOME}"/bash/bashrc

# Zoho
[ -f ~/.zoho/zoho ] && . ~/.zoho/zoho
