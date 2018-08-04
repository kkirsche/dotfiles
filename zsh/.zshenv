#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Kevin Kirsche <kev.kirsche@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "${SHLVL}" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Terminal Configuration
export VISUAL="vim"
export EDITOR="${VISUAL}"
export HOMEBREW_NO_ANALYTICS=1

# Golang Configuration
export GOPATH="${HOME}/git/go"
export PATH="${PATH}:${GOPATH}/bin" # Add Golang binaries to the path
export PATH="${PATH}:/usr/local/opt/go/libexec/bin"

# Ruby Configuration
export PATH="${HOME}/.rbenv/bin:${PATH}"

# Rust Configuration
export PATH="${PATH}:${HOME}/.cargo/bin"

# Python Configuration
export PATH="/usr/local/opt/python/libexec/bin:/usr/local/Cellar/python/3.7.0/Frameworks/Python.framework/Versions/3.7/bin:/usr/local/lib/python3.7/site-packages/pipenv:${PATH}"
export PYTHONASYNCIODEBUG="1"

# Vagrant Configuration
export VAGRANT_DEFAULT_PROVIDER="vmware_fusion"

# Google Chrome Configuration
export SSLKEYLOGFILE="${HOME}/sslStripping.log"

# GPG
export GPG_TTY=$(tty)

# Rust Configuration
export RUST_BACKTRACE=1
