# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -f ~/.profile ] && . ~/.profile
[ -f ~/.personal/config ] && . ~/.personal/config
[ -f ~/.bashrc ] && . ~/.bashrc

# Zoho
[ -f ~/.zoho/zoho ] && . ~/.zoho/zoho
