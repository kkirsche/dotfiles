#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Kevin Kirsche <kev.kirsche@gmail.com>
#

# Ensure we have the basic path setup
case `uname` in
  Darwin)
    export PATH='/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:'
  ;;
  Linux)
    export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$HOME/bin:/usr/games:/usr/local/games:/snap/bin:."
  ;;
  FreeBSD)
    export PATH="$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:."
  ;;
esac

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "${SHLVL}" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Terminal Configuration
export VISUAL="nvim"
export EDITOR="${VISUAL}"
if [ "$(uname 2> /dev/null)" = "Darwin" ]; then
  export HOMEBREW_NO_ANALYTICS=1
fi

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
