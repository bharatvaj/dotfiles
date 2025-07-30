#!/bin/sh
: ${XDG_ROOT:=$HOME}

set -a
# XDG
XDG_CONFIG_HOME="$XDG_ROOT/.config"
XDG_DATA_HOME="$XDG_ROOT/.local/share"
XDG_CACHE_HOME="$XDG_ROOT/.cache"
XDG_STATE_HOME="$XDG_ROOT/.local/state"

ABDUCO_SOCKET_DIR="$XDG_STATE_HOME"/abuco
HISTFILE="$XDG_STATE_HOME"/history
LESSHISTFILE="$XDG_STATE_HOME"/lesshst

# Global programs
ELINKS_CONFDIR="$XDG_CONFIG_HOME/elinks"
INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
LYNX_CFG="$XDG_CONFIG_HOME/lynx/lynx.cfg"
LYNX_LSS="$XDG_CONFIG_HOME/lynx/lynx.lss"
NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch/config"
PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"
PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
TASKRC="$XDG_CONFIG_HOME/task/taskrc"
WGETRC="$XDG_CONFIG_HOME/wgetrc"
XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
#XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc

GNUPGHOME="$XDG_DATA_HOME/gnupg"
PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
W3M_DIR="$XDG_DATA_HOME"/w3m

# Local executables
PATH=${PATH}:${HOME}/.local/bin:${HOME}/.local/bin/sh:${XDG_DATA_HOME}/npm/bin:${XDG_DATA_HOME}/.cargo/bin:${GOPATH}/bin:${XDG_DATA_HOME}/gem/bin

# Setup editor
# TODO until I grok the shell and able to control the clipboard and
# registers with terminal level keybings. I am not going back to vi/nvi
#alias vim=vi
#alias nvim=vi
{
command -v vim && VISUAL=vim && EDITOR=vim
} >/dev/null

if [ $(uname -s) = "Windows_NT" ]; then
    FUZZER=$(command -v wlines)
else
    FUZZER=$(command -v fzy)
fi
FM=vifm

BROWSER=lynx
SURFRAW_browser="$BROWSER"

# Theme
# Hyper Red
LESS_TERMCAP_so=$'\e[31m'
LESS_TERMCAP_se=$'\e[0m'
CLICOLOR=1
LSCOLORS="xxexcxdxbxegxdxbagxcxd"
LS_COLORS="di=0:ln=34:so=32:pi=33:ex=31:bd=34;46:cd=0;43:su=0;41:sg=30;46:tw=0;42:ow=0;43"

set +a

# Make `history` print timestamp
HISTTIMEFORMAT="%F %T "
HISTCONTROL=erasedups

. "${XDG_CONFIG_HOME}/sh/functions"
. "${XDG_CONFIG_HOME}/sh/aliases"
[ -f "${XDG_CONFIG_HOME}/sh/unstaged" ] && . "${XDG_CONFIG_HOME}/sh/unstaged"
