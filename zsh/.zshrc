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

# Aliases
# alias vim=nvim
alias polo=". polo"
alias n=newsboat
alias m=mutt

# Tmux
[ -z $TMUX ] && { tmux attach || exec tmux new-session -s general && exit }
tmux source ~/.tmux.conf

# Ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"
alias js="bundle exec jekyll server"

# Dotnet BS
export DOTNET_CLI_TELEMETRY_OPTOUT=1

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
