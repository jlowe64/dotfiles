autoload -U +X compinit && compinit

HISTSIZE=99999
HISTFILESIZE=999999
SAVEHIST=$HISTSIZE

eval "$(direnv hook zsh)"
source <(kubectl completion zsh)

# PYTHON
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# AWS VAULT
# https://github.com/99designs/aws-vault/blob/master/USAGE.md#environment-variables
export AWS_VAULT_KEYCHAIN_NAME=login

# default is 1h, which is awkward
export AWS_SESSION_TOKEN_TTL=12h

# BREW
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

HOMEBREW_CASK_OPTS=--appdir=/Applications

# ALIASES
alias brew="arch -x86_64 brew"
alias history="history 1"