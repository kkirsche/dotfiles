# dotfiles
Dotfiles for configuration across systems

## Usage

```
apt-get -y install software-properties-common
add-apt-repository universe && add-apt-repository ppa:neovim-ppa/stable && sudo apt-get update
apt-get -y install curl git golang neovim fonts-firacode python3-pip
git clone https://github.com/kkirsche/dotfiles ~/.local/share/chezmoi
chmod 0700 ~/.local/share/chezmoi
go get -u -v github.com/twpayne/chezmoi
mkdir -p ~/.config/chezmoi
nvim ~/.config/chezmoi/chezmoi.yaml
~/go/bin/chezmoi diff
~/go/bin/chezmoi apply -v
tic -x ~/.xterm-256color-italic.terminfo
tic -x ~/.tmux-256color.terminfo
python3 -m pip install -U neovim
nvim -c PlugUpgrade -c qa
nvim -c PlugUpdate -c qa
nvim -c GoUpdateBinaries -c qa
nvim -c BlackUpgrade -c qa
```

## Configuration File

```yaml
# ~/.config/chezmoi/chezmoi.yaml

data:
  name: "YOUR NAME"
  email: "YOUR EMAIL"
  is_work_machine: False
  work_user_id: "WORK USERNAME"
  github_access_token: "YOUR ACCESS TOKEN"
  gpg:
    sign: True
    signingkey: "SIGNING KEY ID"
```
