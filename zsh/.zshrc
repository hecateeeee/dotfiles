# Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

autoload -Uz promptinit
promptinit
prompt minimal

# Extra initialization &c.
eval "$(fasd --init auto)"

export VISUAL=vim
export EDITOR="$VISUAL"

# Tmux
[ -z $TMUX ] && { tmux attach || exec tmux new-session -s general && exit }
tmux source ~/.tmux.conf

case $(uname -v) in
    *Microsoft* )
        CTX="WSL"
        source ~/.config/dotfiles/zsh/wsl_zshrc;;
    *Darwin* )
        CTX="OSX"
        source ~/.config/dotfiles/zsh/osx_zshrc;;
    * )
        CTX=""
        echo "Unknown context";;
esac

# Aliases
alias cdp="cd $PROJECTS_HOME"
alias polo=". polo"
alias n=newsboat
alias m=mutt
alias js="bundle exec jekyll server"
