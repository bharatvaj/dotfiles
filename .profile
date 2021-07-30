source ~/.git-completion.bash
alias ls='ls -G'
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;35;40'

function parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
export PS1="\[\033[33m\]\$(parse_git_branch)\[\033[00m\] \w \$ "


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

