#!/bin/sh
# TODO implement [dest_dir] functionality
# Currently extracts to the current directory
# Iterate over each arguments
# Treat last argument as dest folder? or use -d
# Allow extraction of multple archives in the order
test $# -lt 1 && { printf "Usage: $(basename $0) <archive>\n"; exit 1; }
test -f "$1" || { printf "$0: $1: No such file \n"; exit 1; }
case "$1" in
    *.a) ar x "$1" ;;
    *.z) 7z x "$1" ;;
    *.rar) unrar x "$1" ;;
    *.tar|*.tar.xz|*.tar.gz) tar -xvf "$1" ;;
    *.tar.bz2) tar -xzvf "$1" ;;
    *.bz2) bzip2 -d "$1" ;;
    *.bz) bzip2 -d "$1" ;;
    *.gz) gunzip -d "$1" ;;
    *.tgz) tar -zxvf "$1" ;;
    *.zip) unzip "$1" ;;
    *.mp4)
        audio_codec=$(ffprobe -show_streams -select_streams a "$1" | grep codec_name | cut -f2 -d "=")
        ffmpeg -i "$1" -c:a copy $(basename $1).${audio_codec}
        ;;

*) printf "'$1' Error. Unsupported filetype.\n" >&2 ;;
esac
