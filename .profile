alias ls='ls -G'
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;35;40'

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

