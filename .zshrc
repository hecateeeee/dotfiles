# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

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

alias js="bundle exec jekyll server"
