#! /bin/bash

echo "export EDITOR=vim" >> ~/.bashrc

cat <<EOF > ~/.gitconfig
[user]
	name = Jim Pick
	email = jim@backblend.com
	username = jimpick
[color]
	ui = true
[push]
	default = simple
EOF

cat <<EOF > ~/.vimrc
colorscheme desert
syntax enable
set ruler
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set hlsearch
set wildmode=longest,list
set expandtab
EOF

perl -pi -e 's#https://github.com/#git@github.com:#' ~/testground/.git/config
perl -pi -e 's#https://github.com/#git@github.com:#' ~/testground-misc-scripts/.git/config
