source /etc/bash_completion.d/git-prompt
source /usr/share/doc/fzf/examples/key-bindings.bash

export HISTCONTROL=ignoredups
export HISTSIZE=2000
export PS1='\w$(__git_ps1)$ '

export FZF_DEFAULT_COMMAND="fd -t f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d"

alias dcy="docker run --rm mogurastore/dcy"
alias dtag="docker run --rm goodwithtech/dockertags"
alias gibo="docker run --rm simonwhitaker/gibo"
alias lzd="docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v ~/.config/lazydocker:/.config/jesseduffield/lazydocker lazyteam/lazydocker"

alias fd=fdfind
alias mine="sudo chown -R $USER:$USER"
