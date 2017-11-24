#! /bin/sh

set -e

export N_PREFIX="$HOME/.n"

curl -L https://git.io/n-install | bash -s -- -y

. ~/.bashrc
npm i -g http-server prettier

cp ~/linux_files/conf/.prettierrc ~/.prettierrc
