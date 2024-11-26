# Define environment variables
```
HOME = %USERPROFILE%
STARTUP_DIR = D:\home
XDG_CONFIG_HOME = %USERPROFILE%\.config
```

# Install Powershell
```
winget install Microsoft.PowerShell
```

# Clone the repository
```
git clone --bare https://github.com/Jallalbrahimi/dotfiles.git $HOME/.dotfiles
```

If needed, reset it :
```
git --git-dir=$env:USERPROFILE/.dotfiles --work-tree=$env:USERPROFILE reset --hard
```

# Create Symbolic Links
At the present time, only for Helix

The following lines must be either ran as Admin, or on a dev machine
```
mkdir "$($env:USERPROFILE)\AppData\Roaming\helix" 
New-Item -ItemType SymbolicLink -Path "$($env:USERPROFILE)\AppData\Roaming\helix\config.toml" -Target "$($env:USERPROFILE)\.config\helix\config.toml"
New-Item -ItemType SymbolicLink -Path "$($env:USERPROFILE)\AppData\Roaming\helix\languages.toml" -Target "$($env:USERPROFILE)\.config\helix\languages.toml"
```

# Install tools
```
winget install nushell Helix.Helix sharkdp.fd  sharkdp.bat  junegunn.fzf  BurntSushi.ripgrep.msvc  eza-community.eza  aristocratos.btop4win  Fastfetch-cli.Fastfetch  sxyazi.yazi
```
or 
```
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
```
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```