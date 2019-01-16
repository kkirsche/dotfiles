# dotfiles
Dotfiles for configuration across systems

## Usage

```
git clone https://github.com/kkirsche/dotfiles ~/.local/share/chezmoi
chmod 0700 ~/.local/share/chezmoi
chezmoi diff
chezmoi apply -v
nvim -c PlugUpdate -c qa
nvim -c GoUpdateBinaries -c qa
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
```
