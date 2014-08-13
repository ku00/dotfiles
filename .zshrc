# Environment variable configuration

## SSHで接続した先で日本語が使えるようになる
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## エディタ
export EDITOR=/usr/local/bin/vim

## ページャ
export PAGER=/usr/local/bin/vimpager
export MANPAGER=/usr/local/bin/vimpager


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


# Prompt

autoload -U promptinit; promptinit
autoload -Uz colors; colors
autoload -Uz is-at-least

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' max-exports 6 # formatに入る変数の最大数
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '%b@%r' '%c' '%u'
zstyle ':vcs_info:git:*' actionformats '%b@%r|%a' '%c' '%u'
setopt prompt_subst
function vcs_echo {
    local st branch color
    STY= LANG=en_US.UTF-8 vcs_info
    st=`git status 2> /dev/null`
    if [[ -z "$st" ]]; then return; fi
    branch="$vcs_info_msg_0_"
    if   [[ -n "$vcs_info_msg_1_" ]]; then color=${fg[green]} #staged
    elif [[ -n "$vcs_info_msg_2_" ]]; then color=${fg[red]} #unstaged
    elif [[ -n `echo "$st" | grep "^Untracked"` ]]; then color=${fg[blue]} # untracked
    else color=${fg[cyan]}
    fi
    echo "%{$color%}(%{$branch%})%{$reset_color%}" | sed -e s/@/"%F{yellow}@%f%{$color%}"/
}
PROMPT='
%F{yellow}[%~]%f `vcs_echo`
%(?.$.%F{red}$%f) '

if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi


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
