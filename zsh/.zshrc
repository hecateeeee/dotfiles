# Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

autoload -Uz promptinit
promptinit
prompt minimal

set bellstyle none

# Extra initialization &c.
# eval "$(fasd --init auto)"

export VISUAL=vim
export EDITOR="$VISUAL"
export VIMCONFIG="/home/$USER/.config/dotfiles/vim"

export PATH="$HOME/.local/bin/:$PATH"
export PATH="/usr/racket/bin:$PATH"

supdate () {
    sudo apt-get autoremove -y
    sudo apt-get update -y && sudo apt-get upgrade -y
}
