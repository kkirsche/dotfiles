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

# ruby setup
if ! type "rbenv" > /dev/null; then
  eval "$(rbenv init -)"
fi

# elixir path configuration
if ! type "/usr/local/bin/elixir" > /dev/null; then
  export PATH="$PATH:/usr/local/Cellar/elixir/$(/usr/local/bin/elixir -v | tail -n 1 | cut -d ' ' -f 2)/bin"
fi

# reminders
# `defaults domains` to get all mac domain's you can control
# to make this easier to read: `defaults domains | tr , '\n'`
if [ "$(uname 2> /dev/null)" = "Darwin" ]; then
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi
export POWERLEVEL9K_MODE='nerdfonts-complete'
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
bindkey '^R' history-incremental-search-backward
