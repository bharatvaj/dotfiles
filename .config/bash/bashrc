#
# ~/.bashrc
#

# Make `history` print timestamp
HISTTIMEFORMAT="%F %T "

PATH_EXPORTS=( "${ESSENTIAL_PATH_EXPORTS[@]}" "${OTHER_PATH_EXPORTS[@]}" )

# Include one by one even if it affects performance
# If something fails, atleast others will be added to path
for PATH_EXPORT in ${PATH_EXPORTS}; do
    export PATH="${PATH_EXPORT}:${PATH}"
done

# Git
if [ -f ~/.config/.git-prompt.sh ]; then
  . "${HOME}/.config/.git-prompt.sh"
  export GIT_PS1_SHOWCOLORHINTS=1
  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_SHOWUPSTREAM="auto"
  export PROMPT_COMMAND='__git_ps1 "" " \w \\\$ "'
fi

