These configuration steps work in Fedora 43

## Setup git configuration
```shell
git config --global core.autocrlf 
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

## Setup github cli

```shell
sudo dnf install dnf5-plugins
sudo dnf config-manager addrepo --from-repofile=https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install gh --repo gh-cli

ssh-keygen -t ed25519 -C "you@example.com"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
dotfiles remote set-url origin git@github.com:Jallalbrahimi/dotfiles.git
dotfiles push --set-upstream origin main
```

## Setup dotfiles save using git --bare
See [how to](https://www.atlassian.com/git/tutorials/dotfiles)

```shell
sudo dnf install git
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
echo ".dotfiles" >> $HOME/.gitignore
git clone --bare https://github.com/Jallalbrahimi/dotfiles.git $HOME/.dotfiles
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

## Update repos

### For multimedia
See [how to](https://rpmfusion.org/Configuration)

```shell
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

dnf check-update
sudo dnf install code # or code-insiders
```

### Terra repos
See [how to](https://rpmfusion.org/Configuration)

($releasever is expected to be 42)
```shell
sudo dnf install --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' --setopt='terra.gpgkey=https://repos.fyralabs.com/terra$releasever/key.asc' terra-release
```

## Install tools

```shell
# sudo dnf install  nushell helix fd-find bat fzf ripgrep eza btop fastfetch
sudo dnf install nushell
sudo dnf install helix
sudo dnf install fd-find
sudo dnf install bat
sudo dnf install fzf
sudo dnf install ripgrep
sudo dnf install eza
sudo dnf install btop
sudo dnf install fastfetch

sudo dnf install vlc

# sudo dnf install yazi
```

## Install VS Code

https://code.visualstudio.com/docs/setup/linux#_install-vs-code-on-linux
```
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
```

## Install non free codecs  (Fedora 42)
See [how to](https://rpmfusion.org/Howto/Multimedia)

Non-free repos must have been set up

```shell
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin

sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld
sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld
```

## keyboard and cedilla
Some info regarding cedilla configuration are detailed here (https://gist.github.com/ericdouglas/74469cb97188751f71bfdcd7d28f75fd?permalink_comment_id=4759069)

First, check the current keymap layout : 
```shell
localectl
``` 
or 
```shell
localectl status
``` 
To set the keymap
```shell
localectl list-keymaps | grep intl # to filter the list of available keymaps for us intl
sudo localectl set-keymap us-intl
sudo localectl set-x11-keymap us intl
```
BOTH commands are required.

Firefox/librewolf did not use this configuration. I have to create a .XCompose file
```shell
include "/usr/share/X11/locale/en_US.UTF-8/Compose"
<dead_acute> <C> : "Ç" "Ccedilla"
<dead_acute> <c> : "ç" "ccedilla"
```

If this is not enough,
patch the locale file :
```shell
sudo sed -i /usr/share/X11/locale/en_US.UTF-8/Compose -e 's/ć/ç/g' -e 's/Ć/Ç/g'
```

and create/edit `~/.config/environment.d/im.conf`
```
GTK_IM_MODULE=cedilla
QT_IM_MODULE=cedilla
```


## Hour
sudo timedatectl set-local-rtc 1 

## Grub 

```shell
hx /etc/default/grub #
```

```
GRUB_DEFAULT=
GRUB_SAVEDEFAULT=true
```

```shell
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```

## host name
```shell
sudo hostnamectl set-hostname --static fedora-laptop
```

# Nerd fonts

```shell
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaCode.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Lilex.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Lilex.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/UbuntuSans.zip

sudo mkdir -p /usr/local/share/fonts/CascadiaCode
sudo mkdir -p /usr/local/share/fonts/Lilex
...
sudo unzip CascadiaCode.zip -d /usr/local/share/fonts/CascadiaCode/
sudo unzip Lilex.zip -d /usr/local/share/fonts/Lilex
sudo fc-cache -v
```

## .NET
```shell
sudo dnf install dotnet-sdk-9.0
dotnet tool install --ignore-failed-sources --add-source https://api.nuget.org/v3/index.json --global dotnet-ef

```

## Flathub
```shell
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```
## PodmanDesktop
```shell
flatpak install flathub io.podman_desktop.PodmanDesktop
```

## Keyboard function keys issue
https://blog.burkert.me/posts/solution-to-epomaker-keyboards-f-row-keys-in-linux/
```shell
echo "options hid_apple fnmode=2" | sudo tee /etc/modprobe.d/hid_apple.conf
sudo dracut --regenerate-all --force
# reboot and enjoy your fully functioning keyboard!
```

## Change shell to zsh

```
sudo dnf install zsh
cat /etc/shells
chsh -s $(which zsh)
```
