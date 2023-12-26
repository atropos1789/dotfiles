#! /bin/sh

case "$1" in
    *.a|*.ace|*.alz|*.arc|*.arj|*.bz|*.bz2|*.cab|*.cpio|*.deb|*.gz|*.jar|*.lha|*.lz|*.lzh|*.lzma|*.lzo|*.rpm|*.rz|*.t7z|*.tar|*.tbz|*.tbz2|*.tgz|*.tlz|*.txz|*.tZ|*.tzo|*.war|*.xpi|*.xz|*.Z|*.zip)
        atool --list "$1";;
    *.rar)
        ## Avoid password prompt by providing empty password
        unrar vt -p- -- "$1";;
    *.7z)
        ## Avoid password prompt by providing empty password
        7z l -p -- "$1";;
    *.cbz)
        atool --list --format=zip -- "$1";;
    *.cbr)
        atool --list --format=rar -- "$1";;
    *.flac|*.mp3|*.ogg|*.acc)
        mediainfo "$1";;
    *.mp4|*.mkv|*.mov|*.MOV|*.avi)
        mediainfo "$1";;
    *.pdf)
        pdfinfo "$1";;
    *.pdf|*.epub|*.djvu|*.djv)
        exiftool "$1";;
    *.jpeg|*.jpg|*.JPG|*.png|*.PNG|*.webp|*.tiff|*.gif|*.heic|*.HEIC)
        exiftool "$1";;
    # *.md)
    #     env PAGER='less -R' glow "$1";;
    *) 
        case $(file --mime-type -Lb "$1") in
            text/*) 
                bat --theme='base16' --color='always' --style 'plain' --terminal-width "$(($2 - 4))" --wrap 'character' "$1";;
            *) 
                echo -e "----- File Type Classification ----- \n$(file --dereference --brief "$1")"| bat --theme='base16' --decorations='always' --style 'plain' --terminal-width "$(($2 - 4))" --wrap 'character';;
                # exiftool "$1";;
        esac;;
        
esac

# behavior:
# 1. scan unix filetypes: 



# 1. if video, audio, image, document, use exiftool
# 2. else if archive then use atool or other cmd to preview contents
# 3. print out contents of text file, use syntax highlighting
# if binary, print out file output
# what to do for device files, 
