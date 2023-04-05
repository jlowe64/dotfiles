HISTSIZE=99999
HISTFILESIZE=999999
SAVEHIST=$HISTSIZE
alias history="history 1"

eval "$(direnv hook zsh)"
source <(kubectl completion zsh)

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"