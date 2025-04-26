alias v="nvim"
alias zj="zellij"
alias tp='cd ~ && cd "$(find . -type d | fzf)" && tmux new-session -s "$(basename "$(pwd)")"'
alias his='$(cat ~/.bash_history | fzf)'
alias fmouse='sudo nvim /etc/X11/xorg.conf.d/90-mouse.conf'
export PRJ=~/Documents/prj/
export GR=~/Documents/gitRepo/
export HISTFILE=~/.bash_history
alias ond="onedrive --synchronize"
export TERM=xterm-256color
export COLORTERM=truecolor
export PATH=$PATH:~/.local/share/kitty.app/bin
export PATH=$PATH:/usr/local/go/bin
eval "$(starship init zsh)"




export STARSHIP_CONFIG=~/example/non/default/path/starship.toml
source ~/.zsh-plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey -v
bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
. "/home/nerd/.deno/env"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
