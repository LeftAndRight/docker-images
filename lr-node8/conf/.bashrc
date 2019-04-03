#!/usr/bin/env bash

# Utils
alias ll="ls -la"

alias c="clear && printf '\e[3J'"

# Terminal prompt change
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

# Turns on colorised ls
export CLICOLOR=1

# Color scheme for the ls command
export LSCOLORS=ExFxBxDxCxegedabagacad