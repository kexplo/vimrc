#!/usr/bin/env zsh

source ~/.zplug/init.zsh

zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "plugins/virtualenv", from:oh-my-zsh
zplug "plugins/zsh-navigation-tools", from:oh-my-zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"

zplug "kexplo/rc", as:theme, use:kexplo.zsh-theme

# zplug load --verbose
zplug load

############################################################################################

# == basics
unsetopt auto_cd
setopt interactive
setopt interactivecomments

# === history
setopt appendhistory
setopt extendedhistory
setopt incappendhistory
setopt sharehistory
setopt histexpiredupsfirst
setopt histignoredups
setopt histignorespace
setopt histverify

# === completion
setopt alwaystoend
setopt completeinword

# === prompt
setopt promptsubst

# === job contorl
setopt longlistjobs
setopt monitor

# === I/O
setopt ignoreeof     # Prevent closing the terminal using ^D
setopt noflowcontrol

############################################################################################

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=yellow'
ZSH_HIGHLIGHT_STYLES[default]='fg=cyan'

autoload -U colors && colors

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

alias ls='ls --color=tty'
alias l='ls'

alias tmux='tmux -2'
alias fzf="fzf --preview 'head -100 {}'"

#F1 ^[OP
#F2 ^[OQ
#F3 ^[OR
#F4 ^[OS
#F5 ^[[15~
#F6 ^[[17~
#F7 ^[[18~
#F8 ^[[19~
#F9 ^[[20~
#F10 ^[[21~
#F11 ^[[23~
#F12 ^[[24~

# Bind keys: [Home] and [End].
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line

# Bind history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# Inside tmux
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

alias kgit='LANG=ko_KR git'
export PATH="$HOME/.linuxbrew/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export LESS='-RXF'

# pipsi
export PATH="$HOME/.local/bin:$PATH"

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# autoenv
source "$HOME/.autoenv/activate.sh"
# export AUTOENV_ENABLE_LEAVE=1

# z
. "$HOME"/.linuxbrew/etc/profile.d/z.sh
