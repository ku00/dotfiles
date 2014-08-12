#! /bin/bash
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.vim ~/.vim

[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim && echo "you should run following command to setup plugins -> vim -c ':NeoBundleInstall'"

