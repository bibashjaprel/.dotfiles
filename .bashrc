# ~/.bashrc - Productivity Boosted

# Only run if interactive shell
[[ $- != *i* ]] && return

# Basic aliases with color
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'

# Grep with color
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate --all'
alias gco='git checkout'

# Docker shortcuts (if you use Docker)
alias dps='docker ps'
alias dpa='docker ps -a'
alias dstop='docker stop'
alias drm='docker rm'
alias dlogs='docker logs -f'

# Quick directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'

# Show hidden files by default
alias dotfiles='ls -ld .??*'

# Enhanced prompt with git branch info and exit status
parse_git_branch() {
  git branch 2>/dev/null | grep '*' | sed 's/* //'
}

PROMPT_COLOR='\[\e[0;32m\]'
GIT_COLOR='\[\e[0;35m\]'
ERROR_COLOR='\[\e[0;31m\]'
RESET_COLOR='\[\e[0m\]'

# Show exit status if last command failed
function set_prompt() {
  local EXIT="$?"
  PS1="${PROMPT_COLOR}[\u@\h \W${GIT_COLOR}"
  local BRANCH=$(parse_git_branch)
  if [[ -n $BRANCH ]]; then
    PS1+=" ($BRANCH)"
  fi
  PS1+="${PROMPT_COLOR}]"
  if [[ $EXIT != 0 ]]; then
    PS1+=" ${ERROR_COLOR}✘($EXIT)${PROMPT_COLOR}"
  fi
  PS1+="\$ ${RESET_COLOR}"
}

PROMPT_COMMAND=set_prompt

# History improvements
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend # Append history rather than overwrite
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Enable autocd - just type directory name to cd into it
shopt -s autocd

# Case-insensitive globbing
shopt -s nocaseglob

# Enable programmable completion features
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# Set default editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# Add composer and OpenWebStart to PATH
export PATH="$HOME/.composer/vendor/bin:$HOME/.config/composer/vendor/bin:/opt/OpenWebStart/bin:$PATH"

# Useful functions

# mkcd: make directory and enter it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# extract: extract most archive types easily
extract() {
  if [ -f "$1" ]; then
    case "$1" in
    *.tar.bz2) tar xjf "$1" ;;
    *.tar.gz) tar xzf "$1" ;;
    *.bz2) bunzip2 "$1" ;;
    *.rar) unrar x "$1" ;;
    *.gz) gunzip "$1" ;;
    *.tar) tar xf "$1" ;;
    *.tbz2) tar xjf "$1" ;;
    *.tgz) tar xzf "$1" ;;
    *.zip) unzip "$1" ;;
    *.Z) uncompress "$1" ;;
    *.7z) 7z x "$1" ;;
    *) echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Reload .bashrc quickly
alias reload='source ~/.bashrc'

# End of productivity .bashrc
