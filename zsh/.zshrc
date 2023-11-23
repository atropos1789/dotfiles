## --                    -- ##
## -- .config/zsh/.zshrc -- ##
## --                    -- ##

## ------ ##
## Prompt ##
## ------ ##

#this includes the tty 
# PROMPT='%D{%I:%M} %n %y %~ ] '

#this doesn't
PROMPT='%D{%I:%M} %n %~ ] '


## ----------- ##
## zsh options ##
## ----------- ##

export HISTFILE="$ZDOTDIR/.zsh_history"
export SAVEHIST=100000000
export HISTSIZE=100000000
export HISTTIMEFORMAT="[%F %T] "
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY

autoload -Uz compinit
compinit

## ------- ##
## aliases ##
## ------- ##

alias ls="eza -la"
alias cp="cp -v"
alias mv="mv -v"
alias rm="rm -v"

## ----------------- ##
## program execution ##
## ----------------- ##

# cbonsai -p
# neofetch
