
alias vi="nvim"
alias zj="zellij"
alias tp='cd ~ && cd "$(find . -type d | fzf)" && tmux new-session -s "$(basename "$(pwd)")"'
alias his='n=$(cat ~/.bash_history | fzf);echo |$n|;$n'
alias fmouse='sudo nvim /etc/X11/xorg.conf.d/90-mouse.conf'
alias ond="onedrive --synchronize"
alias zathu='zathura $(fzf)'
alias kitty='/home/nerd/.local/share/kitty.app/bin/kitty'

export PRJ=~/Documents/prj/
export GR=~/Documents/gitRepo/
export HISTFILE=~/.bash_history
export TERM=xterm-256color
export COLORTERM=truecolor
export STARSHIP_CONFIG=~/example/non/default/path/starship.toml
export PATH=$PATH:~/.local/share/kitty.app/bin:/usr/local/go/bin
export NVM_DIR="$HOME/.nvm"
export GOPATH=~/.local/bin



bindkey -v
bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history



#loading fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Load Deno environment
[ -f /home/nerd/.deno/env ] && source /home/nerd/.deno/env

load_dev_env() {
  # Load NVM
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

}

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

#source "$HOME/.local/share/zsh/plugins/@zpm/zpm.zsh"

