export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;35;40'

# XDG
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# Global programs
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export VIMINIT="source $XDG_CONFIG_HOME/vim/vimrc"
export LESSHISTFILE=-
export LYNX_CFG="$XDG_CONFIG_HOME/lynx/lynx.cfg"
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PSQL_HISTORY="$XDG_CACHE_HOME/pg/psql_history"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export TASKRC="$XDG_CONFIG_HOME/task/taskrc"
export HISTFILE="$XDG_DATA_HOME"/bash/history
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority 
export ATOM_HOME="$XDG_DATA_HOME"/atom 
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine

# Local programs
export NB_PATH="$XDG_DATA_HOME/notebook"

# Make `history` print timestamp
HISTTIMEFORMAT="%F %T "

# Setup editor
export VISUAL=vi
export EDITOR="$VISUAL"

# Local executables
export PATH=${PATH}:~/.local/bin

chance() {
    # Hit or miss
    [ -f "${1}" ] && . "${1}" 
}

mich() {
    # Muted which
    which "$@" >/dev/null 2>/dev/null
}

chance "${XDG_CONFIG_HOME}/sh/aliases"
chance "${XDG_CONFIG_HOME}/sh/plugin/index"
chance "${XDG_CONFIG_HOME}/sh/unstaged"

