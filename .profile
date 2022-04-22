export GREP_COLOR='1;35;40'

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Global programs
export VIMINIT="if !has('nvim')
source $XDG_CONFIG_HOME/vim/vimrc
endif"
export LESSHISTFILE=-
export LYNX_CFG="$XDG_CONFIG_HOME/lynx/lynx.cfg"
export LYNX_LSS="$XDG_CONFIG_HOME/lynx/lynx.lss"
export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"
export TASKRC="$XDG_CONFIG_HOME/task/taskrc"
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch/config"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export EM_CONFIG="$XDG_CONFIG_HOME"/emscripten/config
export ELINKS_CONFDIR="$XDG_CONFIG_HOME/elinks"

export FFMPEG_DATADIR="$XDG_DATA_HOME"/ffmpeg
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export ATOM_HOME="$XDG_DATA_HOME"/atom
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export HISTFILE="$XDG_DATA_HOME"/history
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine
export GOPATH="$XDG_DATA_HOME"/go
export NB_PATH="$XDG_DATA_HOME/notebook"
export EM_PORTS="$XDG_DATA_HOME"/emscripten/cache
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GEM_HOME="$XDG_DATA_HOME"/gem
export TERMINFO="$XDG_DATA_HOME/terminfo"
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo":/usr/share/terminfo
export VSCODE_PORTABLE="$XDG_DATA_HOME/vscode"
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql_history"
# export ZDOTDIR="$XDG_DATA_HOME/zsh"

export PSQL_HISTORY="$XDG_CACHE_HOME/pg/psql_history"
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export EM_CACHE="$XDG_CACHE_HOME"/emscripten/cache
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem

# Make `history` print timestamp
HISTTIMEFORMAT="%F %T "

# Local executables
export PATH=${PATH}:${HOME}/.local/bin:${XDG_DATA_HOME}/npm/bin:${XDG_DATA_HOME}/.cargo/bin

chance() {
    # Hit or miss
    [ -f "${1}" ] && . "${1}"
}

# TODO refactor function name
mich() {
    type "$@" >/dev/null 2>/dev/null
}

# Setup editor

export VISUAL=$(mich nvim && echo nvim || echo vim )
export EDITOR="$VISUAL"

export BROWSER="$(mich lynx && echo lynx)"
export SURFRAW_browser="$BROWSER"

chance "${XDG_CONFIG_HOME}/sh/aliases"
chance "${XDG_CONFIG_HOME}/sh/plugin/index"
chance "${XDG_CONFIG_HOME}/sh/unstaged"

