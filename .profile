alias ls='ls -G'
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;35;40'

# Git
if [ -f ~/.git-prompt.sh ]; then
  . ~/.git-prompt.sh
  export GIT_PS1_SHOWCOLORHINTS=1
  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_SHOWUPSTREAM="auto"
  PROMPT_COMMAND='__git_ps1 "" " \w \\\$ "'
fi

# XDG
export XDG_DATA_HOME="${HOME}"/.config
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# Setup editor
export EDITOR=vim

# Export only the essentials here
export JOPLIN_BIN="${HOME}"/.joplin-bin/bin

export ESSENTIAL_PATH_EXPORTS=(
    "${JOPLIN_BIN}"
)

