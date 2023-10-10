#!/bin/sh
[ -n "$1" ] && XDG_ROOT="$1" || XDG_ROOT="$HOME"

# XDG
export XDG_CONFIG_HOME="$XDG_ROOT/.config"
export XDG_DATA_HOME="$XDG_ROOT/.local/share"
export XDG_CACHE_HOME="$XDG_ROOT/.cache"
export XDG_RUNTIME_DIR="$XDG_ROOT/.local/run"
export XDG_STATE_HOME="$XDG_ROOT/.local/state"

export ABDUCO_SOCKET_DIR="$XDG_STATE_HOME"/abuco
export LESSHISTFILE="$XDG_STATE_HOME"/lesshst

# Global programs
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export ELINKS_CONFDIR="$XDG_CONFIG_HOME/elinks"
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export LESSHISTFILE=-
export LYNX_CFG="$XDG_CONFIG_HOME/lynx/lynx.cfg"
export LYNX_LSS="$XDG_CONFIG_HOME/lynx/lynx.lss"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch/config"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"
export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
export TASKRC="$XDG_CONFIG_HOME/task/taskrc"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc

export ANDROID_HOME="$XDG_DATA_HOME"/android
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export FFMPEG_DATADIR="$XDG_DATA_HOME"/ffmpeg
export GEM_HOME="$XDG_DATA_HOME"/gem
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME"/go
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export HISTFILE="$XDG_DATA_HOME"/history
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine
export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql_history"
export NB_PATH="$XDG_DATA_HOME/notebook"
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export SONGDL_HOME="${XDG_DATA_HOME}/music/"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
export VSCODE_PORTABLE="$XDG_DATA_HOME/vscode"
export W3M_DIR="$XDG_DATA_HOME"/w3m
export _Z_DATA="$XDG_DATA_HOME/z"

export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export PSQL_HISTORY="$XDG_CACHE_HOME/pg/psql_history"

# Make `history` print timestamp
HISTTIMEFORMAT="%F %T "
HISTCONTROL=erasedups

# Local executables
export PATH=${PATH}:${HOME}/.local/bin:${HOME}/.local/bin/sh:${XDG_DATA_HOME}/npm/bin:${XDG_DATA_HOME}/.cargo/bin:${GOPATH}/bin:${XDG_DATA_HOME}/gem/bin

chance() {
    # Hit or miss
    [ -f "${1}" ] && . "${1}"
}

there() {
	# Checks the availability of an executable
    type "$@" >/dev/null 2>/dev/null
}

# Setup editor
# TODO until I grok the shell and able to control the clipboard and
# registers with terminal level keybings. I am not going back to vi/nvi
#alias vim=vi
#alias nvim=vi
export VISUAL=nvim
export EDITOR=nvim
there $EDITOR || unset $EDITOR
export FUZZER=fzy
there $FUZZER || unset $FUZZER

export BROWSER=lynx
export SURFRAW_browser="$BROWSER"

chance "${XDG_CONFIG_HOME}/sh/functions"
chance "${XDG_CONFIG_HOME}/sh/aliases"
chance "${XDG_CONFIG_HOME}/sh/unstaged"

# Theme
# Hyper Red
export LESS_TERMCAP_so=$'\e[31m'
export LESS_TERMCAP_se=$'\e[0m'
export CLICOLOR=1
export LSCOLORS="xxexcxdxbxegxdxbagxcxd"
export LS_COLORS="di=0:ln=34:so=32:pi=33:ex=31:bd=34;46:cd=0;43:su=0;41:sg=30;46:tw=0;42:ow=0;43"
