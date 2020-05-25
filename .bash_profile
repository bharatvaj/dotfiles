#
# ~/.bash_profile
#

export BASH_SILENCE_DEPRECATION_WARNING=1
[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -f ~/.profile ]] && . ~/.profile
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx -logverbose 1
fi
