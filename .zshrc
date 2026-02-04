PS1='%F{blue}%B%~%b%f %F{green}❯%f '

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory
setopt inc_append_history

autoload -U compinit && compinit

bindkey -e
bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward

alias v='nvim'
alias o='xdg-open'
alias g='git'

# color
alias ls='ls --color=auto -hv'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -c=auto'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
echo ".dotfiles" >> $HOME/.gitignore

alias l='ls'
alias ll='ls -l'
alias la='ls -lA'

alias mv='mv -i'

precmd () { print -Pn "\e]2;%-3~\a"; }

if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)"
fi

export PATH="$HOME/.cargo/bin:$PATH"

export ASPNETCORE_ENVIRONMENT=Development

fastfetch
eval "$(starship init zsh)"
