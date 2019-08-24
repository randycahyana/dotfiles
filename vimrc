set encoding=utf-8

syntax off
filetype plugin indent on

set ruler smartindent
set synmaxcol=240
set wrap linebreak nolist nojoinspaces
set nobackup noswapfile nowritebackup
set noexpandtab tabstop=8 softtabstop=8 shiftwidth=8
set textwidth=80 formatoptions-=t formatoptions+=j
set showcmd showmode hidden
set incsearch ignorecase smartcase showmatch hlsearch
set noerrorbells novisualbell
set updatetime=500 signcolumn=number
set mouse=a ttymouse=sgr

colorscheme pablo

" plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'govim/govim'
Plug 'jiangmiao/auto-pairs'

call plug#end()

" override file settings
autocmd BufNewFile,BufRead *.go.tpl,*.qtpl,*.gunk setlocal syntax=go

" plugins settings
let g:airline_theme='badcat'
