#!/bin/sh

case "$f" in
    *.flac|*.mp3|*.ogg)
        mpv -- "$fx";;
        #lf -remote "send $id \$$(mpv --no-audio-display $f)";;
    *.mp4|*.mkv|*.mov)
        smplayer "$f";;
    *.pdf|*.djvu|*.djv|*.epub|*.cbz|*.cbr)
        zathura -- "$f";;
    *.jpeg|*.jpg|*.JPG|*.png|*.PNG|*.webp|*.tiff|*.gif|*.heic|*.HEIC)
        feh --draw-exif --draw-filename --draw-tinted --scale-down -- "$f";;
    *)
        case $(file --mime-type -Lb "$f") in
            text/*)
                lf -remote "send $id \$$EDITOR \$f";;
            *)
                exit 0;;
        esac
esac


# decision tree:
# if audio: run mpv
# if video: run smplayer
# if picture: run feh
# if pdf/graphical document: run zathura
# if if text: open in $EDITOR

# default:
# define a custom 'open' command
# This command is called when current file is not a directory. You may want to
# use either file extensions and/or mime types here. Below uses an editor for
# text files and a file opener for the rest.
# case $(file --mime-type -Lb $f) in
#     text/*) lf -remote "send $id \$$EDITOR \$fx";;
#     *) for f in $fx; do $OPENER $f > /dev/null 2> /dev/null & done;;
# esac
