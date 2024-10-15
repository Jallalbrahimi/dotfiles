# Install tools

winget install Helix.Helix

winget install sharkdp.fd
winget install sharkdp.bat
winget install junegunn.fzf 
winget install BurntSushi.ripgrep.msvc
winget install eza-community.eza 
winget install aristocratos.btop4win 
winget install Fastfetch-cli.Fastfetch
winget install sxyazi.yazi


# Create symlinks for Helix configuration files
New-Item -ItemType SymbolicLink -Path "$($env:USERPROFILE)\AppData\Roaming\helix\config.toml" -Target "$($env:USERPROFILE)\.config\helix\config.toml"
New-Item -ItemType SymbolicLink -Path "$($env:USERPROFILE)\AppData\Roaming\helix\languages.toml" -Target "$($env:USERPROFILE)\.config\helix\languages.toml"


git config --global user.email "you@example.com"
git config --global user.name "Your Name"
