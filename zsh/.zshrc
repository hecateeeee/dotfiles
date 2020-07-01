# Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

autoload -Uz promptinit
promptinit
prompt minimal

# Extra initialization &c.
eval "$(fasd --init auto)"

export VISUAL=nvim
export EDITOR="$VISUAL"

# Aliases
alias vim=nvim
alias makepass='curl -X GET -G https://www.random.org/passwords/ \
	-d "num=1" \
	-d "len=24" \
	-d "format=plain" \
	-d "rnd=new" | pbcopy'
alias polo=". polo"

# Tmux
[ -z $TMUX ] && { tmux attach || exec tmux new-session -s general && exit }
tmux source ~/.tmux.conf

# Ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"
alias js="bundle exec jekyll server"

# Texlive
export PATH="/usr/local/texlive/2020/bin/x86_64-darwin/:$PATH"

# Dotnet BS
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# GNU Utils
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

