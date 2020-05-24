[[ $- != *i* ]] && return

. /usr/share/bash-completion/completions/git
. /usr/share/fzf/key-bindings.bash
. /usr/share/fzf/completion.bash
. /usr/share/git/completion/git-prompt.sh
. /usr/share/nvm/init-nvm.sh

__git_complete g __git_main

export HISTCONTROL=ignoredups
export HISTSIZE=2000
export PATH=$PATH:$HOME/bin
export PS1='\w$(__git_ps1)$ '

export FZF_DEFAULT_COMMAND='fd -t f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd -t d'

DOCKER_CONFIG="$HOME/.docker-config"

alias dc=docker-compose
alias dtag="docker run --rm goodwithtech/dockertags"
alias g=git
alias gcloud='docker run -it --rm -v $DOCKER_CONFIG/gcloud:/root/.config/gcloud -v $PWD:$PWD -w $PWD google/cloud-sdk:alpine gcloud'
alias gibo="docker run --rm -v $DOCKER_CONFIG/gitignore-boilerplates:/root/.gitignore-boilerplates simonwhitaker/gibo"
alias ls='ls --color=auto'
alias lzd="docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v $DOCKER_CONFIG/lazydocker:/.config/jesseduffield/lazydocker lazyteam/lazydocker"
alias mine="sudo chown -R $USER:$USER"
alias phs="python -m http.server"
alias r=ranger
