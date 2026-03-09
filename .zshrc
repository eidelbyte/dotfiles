# x: normal foreground or background
# a: black, b: red, c: green, d: brown, e: blue,
# f: magenta, g: cyan, h: light grey, [caps: bright]
# First five: dir, symlink, socket, pipe, executable
# Default:ex fx cx dx bx
LSCOLORS='cx ex fx dx bx'
# Next two: block special, character special
# Default: eg ed
LSCOLORS+='xx xx'
# Next two: executable with setuid, executable with setgid
# Default: ab ag
LSCOLORS+='ab ad'
# Next two: directory writable to others, with sticky bit, 
#   & as before, without sticky bit
# Default: ac ad
LSCOLORS+='ac ae'
# Last: dataless file
# Default: ah
LSCOLORS+='hA'
LSCOLORS=${LSCOLORS//[[:space:]]/}  # Remove spaces from the above string
export LSCOLORS
export EDITOR='nvim'

### What the hell is this... whatever.
# Autoload zsh's `add-zsh-hook` and `vcs_info` functions
# (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info

# Set prompt substitution so we can use the vcs_info_message variable
setopt prompt_subst

# Run the `vcs_info` hook to grab git info before displaying the prompt
add-zsh-hook precmd vcs_info

# Style the vcs_info message
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats '%b%u%c'
# Format when the repo is in an action (merge, rebase, etc)
zstyle ':vcs_info:git*' actionformats '%F{14}⏱ %*%f'
zstyle ':vcs_info:git*' unstagedstr '*'
zstyle ':vcs_info:git*' stagedstr '+'
# This enables %u and %c (unstaged/staged changes) to work,
# but can be slow on large repos
zstyle ':vcs_info:*:*' check-for-changes true

PROMPT=$'%F{2}%{\x1b[3m%}%n%{\x1b[0m%}%f@%F{4}%m%f %~ λ '
RPROMPT='%F{8}⎇ $vcs_info_msg_0_%f'

source path.sh

alias v='nvim'

alias ls="ls --color"
alias la="ls -a --color" # Show all files
alias ll="ls -la --color" # Long listings
alias l.="ls -d --color .*" # List only dotfiles
alias grep="grep --color"  # Colorful grep
