#!/bin/sh
XDG_HOME=${1:-$HOME}

create_if_missing() {
    [ -d "$XDG_HOME/$1" ] || mkdir "$XDG_HOME/$1"
}

create_if_missing ".local"
create_if_missing ".local/state"

create_if_missing ".local/state/vim"
create_if_missing ".local/state/vim/backup"
create_if_missing ".local/state/vim/swap"
create_if_missing ".local/state/vim/undo"
