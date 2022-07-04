# If not running interactively, don't do anything
[[ $- != *i* ]] && return


[ -f ~/.profile ] && . ~/.profile
[ -f "${XDG_CONFIG_HOME}/bash/bashrc" ] && . "${XDG_CONFIG_HOME}"/bash/bashrc

# Zoho
[ -f ~/.zoho/zoho ] && . ~/.zoho/zoho
