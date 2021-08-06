# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -f ~/.profile ] && . ~/.profile
[ -f ~/.personal/config ] && . ~/.personal/config
[ -f "${XDG_CONFIG_HOME}/bash/bashrc" ] && . "${XDG_CONFIG_HOME}"/bash/bashrc
[ -f "${XDG_CONFIG_HOME}/bash/aliases" ] && . "${XDG_CONFIG_HOME}"/bash/aliases

# Zoho
[ -f ~/.zoho/zoho ] && . ~/.zoho/zoho
