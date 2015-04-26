#! /bin/bash
DOT_FILES=( .vimrc .bashrc .zshrc .zshrc.alias .zshrc.linux .zshrc.osx .tmux.conf .zlogin .zlogout .zpreztorc)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim && echo "you should run following command to setup plugins -> vim -c ':NeoBundleInstall'"

