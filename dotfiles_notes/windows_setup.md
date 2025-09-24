# Define environment variables

```powershell
# env variables are resolved to avoid issues with other shells than Powershell

[Environment]::SetEnvironmentVariable("HOME", "$env:USERPROFILE", "User")
[Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME", "$env:USERPROFILE\.config", "User")
[Environment]::SetEnvironmentVariable("STARTUP_DIR", "D:\home", "User")
```

# Install Powershell

```powershell
winget install Microsoft.PowerShell
```

# Clone the repository

```powershell
git clone --bare https://github.com/Jallalbrahimi/dotfiles.git $HOME/.dotfiles
git --git-dir=$env:USERPROFILE/.dotfiles --work-tree=$env:USERPROFILE checkout
git --git-dir=$env:USERPROFILE/.dotfiles --work-tree=$env:USERPROFILE config --local status.showUntrackedFiles no
```

If needed, reset it :

```powershell
git --git-dir=$env:USERPROFILE/.dotfiles --work-tree=$env:USERPROFILE reset --hard
```

# Create Symbolic Links

At the present time, only for Helix

The following lines must be either ran as Admin, or on a dev machine

```powershell
mkdir "$($env:USERPROFILE)\AppData\Roaming\helix" 
New-Item -ItemType SymbolicLink -Path "$($env:USERPROFILE)\AppData\Roaming\helix\config.toml" -Target "$($env:USERPROFILE)\.config\helix\config.toml"
New-Item -ItemType SymbolicLink -Path "$($env:USERPROFILE)\AppData\Roaming\helix\languages.toml" -Target "$($env:USERPROFILE)\.config\helix\languages.toml"
```

# Install fonts

```powershell
Invoke-WebRequest -Uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaCode.zip -OutFile $env:TEMP
Expand-Archive -Path $env:TEMP\CascadiaCode.zip -Destination .
Copy-Item -Path "$env:TEMP\Fonts\*font" -Destination "C:\Windows\Fonts\" -Recurse -Force
```

# Install tools

```powershell
winget install wez.wezterm nushell Helix.Helix sharkdp.fd  sharkdp.bat  junegunn.fzf  BurntSushi.ripgrep.msvc  eza-community.eza  aristocratos.btop4win  Fastfetch-cli.Fastfetch  sxyazi.yazi
```

or:

```powershell
winget install wez.wezterm
winget install nushell
winget install Helix.Helix
winget install sharkdp.fd
winget install sharkdp.bat
winget install junegunn.fzf 
winget install BurntSushi.ripgrep.msvc
winget install eza-community.eza 
winget install aristocratos.btop4win 
winget install Fastfetch-cli.Fastfetch
winget install sxyazi.yazi
```

# Update git config

```powershell
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```
