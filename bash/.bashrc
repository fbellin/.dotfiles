# ~/.bashrc: executed by bash(1) for non-login shells.
# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# FBE : my settings

# Aliases
alias vi='nvim'

export EDITOR=vi

bind '"\eOP":"tmuxify ~/.dotfiles/\n"'
