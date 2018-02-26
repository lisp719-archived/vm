[[ $- != *i* ]] && return

alias ls='ls --color=auto'

. /usr/share/bash-completion/completions/git
. /usr/share/fzf/key-bindings.bash
. /usr/share/fzf/completion.bash
. /usr/share/git/completion/git-prompt.sh

__git_complete g __git_main

export HISTSIZE=2000
export PATH=$PATH:$HOME/bin
export PS1='\w$(__git_ps1)$ '

export FZF_DEFAULT_COMMAND='fd -t f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd -t d'

alias dc=docker-compose
alias g=git
alias mine="sudo chown -R $USER:$USER"
alias r=ranger

bit() { git clone git@bitbucket.org:lisp719/$1.git; }
vsts() { git clone ssh://lisp719@vs-ssh.visualstudio.com:22/DefaultCollection/_ssh/$1; }
