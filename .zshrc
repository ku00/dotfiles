#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

## SSHで接続した先で日本語が使えるようになる
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## エディタ
export EDITOR=/usr/local/bin/vim

## ページャ
export PAGER="less"


# Option

## 補完機能の強化
autoload -U compinit
compinit

## タブによるファイルの順番切り替えをしない
setopt auto_menu

## cd -[tab]で過去のディレクトリに飛べるようにする
setopt auto_pushd

## ディレクトリ名を入力するだけでcdできるようにする
setopt auto_cd

## 入力しているコマンド名が間違っている場合にもしかして：を出す
setopt correct

## ビーブを鳴らさない
setopt nobeep

## 色を使う
setopt prompt_subst

## Ctrl + dでログアウトしない
setopt ignoreeof

## バックグラウンドジョブが終了したらすぐに知らせる
setopt no_tify

## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

# Path

## 重複する要素を自動的に削除
typeset -U path cdpath fpath manpath

path=(
  $HOME/bin(N-/)
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  $path
)
## rbenv
PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

## npm
export PATH=/usr/local/share/npm/bin:$PATH
export NODE_PATH=/usr/local/share/npm/lib/node_modules

# Alias

[ -f ~/dotfiles/.zshrc.alias ] && source ~/dotfiles/.zshrc.alias

case "${OSTYPE}" in
# MacOSX
 darwin*)
     # ここに設定
     [ -f ~/dotfiles/.zshrc.osx ] && source ~/dotfiles/.zshrc.osx
     ;;
 # Linux
 linux*)
     # ここに設定
     [ -f ~/dotfiles/.zshrc.linux ] && source ~/dotfiles/.zshrc.linux
     ;;
 esac

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
