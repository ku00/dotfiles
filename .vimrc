set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/dotfiles/.vim/bundle/'))
endif

call neobundle#begin(expand('~/dotfiles/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'The-NERD-tree'
NeoBundle 'The-NERD-Commenter'
NeoBundle 'Gist.vim'
NeoBundle 'altercation/vim-colors-solarized'

call neobundle#end()


filetype plugin indent on

" display
" ----------------------
set number
set ruler
set title
set cmdheight=2
set laststatus=2

" edit
" ----------------------
set autoindent
set smartindent
set expandtab
set wildmenu
set hidden
set showcmd
set nostartofline

" search
" ----------------------
set ignorecase
set smartcase
set hlsearch

" baskup
" ----------------------
set noswapfile
set nowritebackup


" Plugin setting
" ----------------------

" NERDTree
" ----------------------
let NERDTreeShowHidden = 1

" VimColorsSolarized
" ----------------------
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
syntax enable


