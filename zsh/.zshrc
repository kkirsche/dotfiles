#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Kevin Kirsche <kev.kirsche@gmail.com>
#
export TERM="xterm-256color"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# mac aliases
alias killproxy='unset http_proxy; unset https_proxy; unset HTTP_PROXY; unset HTTPS_PROXY'

#python
alias python=python2

# ruby setup
eval "$(rbenv init -)"

# elixir path configuration
export PATH="$PATH:/usr/local/Cellar/elixir/$(/usr/local/bin/elixir -v | tail -n 1 | cut -d ' ' -f 2)/bin"

# reminders
# `defaults domains` to get all mac domain's you can control
# to make this easier to read: `defaults domains | tr , '\n'`

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export POWERLEVEL9K_MODE='nerdfonts-complete'
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
bindkey '^R' history-incremental-search-backward
