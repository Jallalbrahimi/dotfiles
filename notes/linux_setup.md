# Setup using git --bare
url: https://www.atlassian.com/git/tutorials/dotfiles

```
sudo dnf install git
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/Jallalbrahimi/dotfiles.git $HOME/.dotfiles
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```


# Install tools
```
sudo dnf install --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' --setopt='terra.gpgkey=https://repos.fyralabs.com/terra$releasever/key.asc' terra-release
sudo dnf install nushell
sudo dnf install helix
sudo dnf install fd-find
sudo dnf install bat
sudo dnf install fzf
sudo dnf install ripgrep
sudo dnf install eza
sudo dnf install btop
sudo dnf install btop
sudo dnf install fastfetch
# sudo dnf install yazi
```
# github cli

```
sudo dnf install dnf5-plugins
sudo dnf config-manager addrepo --from-repofile=https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install gh --repo gh-cli
```

# keyboard
hx /etc/vconsole.conf
  KEYMAP="us-intl"

gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
# hour
sudo timedatectl set-local-rtc 1 


# git configuration
  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"
