# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


autoload -Uz promptinit
promptinit

# TODO different prompts on different machines
prompt minimal

# Extra initialization &c.
eval "$(fasd --init auto)"
agentid=$(eval $(ssh-agent))

export VISUAL=nvim
export EDITOR="$VISUAL"

tmux source ~/.tmux.conf

# Aliases
alias vim=nvim
alias makepass='curl -X GET -G https://www.random.org/passwords/ \
	-d "num=1" \
	-d "len=24" \
	-d "format=plain" \
	-d "rnd=new" | pbcopy'
alias polo=". polo"

# Ruby stuff
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
alias js="bundle exec jekyll server"

# dotnet BS
export DOTNET_CLI_TELEMETRY_OPTOUT=1
