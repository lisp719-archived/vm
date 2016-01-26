from ubuntu:trusty

run apt-get update
run apt-get install -y emacs
run apt-get install -y git tmux curl
run curl https://raw.githubusercontent.com/lisp719/conf/master/linux_files/.spacemacs -o ~.spacemacs
run curl https://raw.githubusercontent.com/lisp719/conf/master/linux_files/.tmux.conf -o ~/.tmux.conf
run git config --global user.name lisp719
run git config --global user.email test@example.com
run git config --global push.default simple
