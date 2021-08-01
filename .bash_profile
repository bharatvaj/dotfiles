# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -f ~/.profile ] && . ~/.profile
[ -f ~/.personal/config ] && . ~/.personal/config
[ -f ~/.bashrc ] && . ~/.bashrc
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# Zoho
[ -f ~/.zoho/zoho ] && . ~/.zoho/zoho
