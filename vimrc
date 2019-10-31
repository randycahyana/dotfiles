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
set mouse=a ttymouse=sgr
set number

colorscheme pablo

" key bindings
inoremap <C-@> <c-x><c-o>

" plugins
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'jiangmiao/auto-pairs'

" code formatter
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

call plug#end()

" override file settings
autocmd BufNewFile,BufRead *.go.tpl,*.qtpl,*.gunk setlocal syntax=go
autocmd BufNewFile,BufRead *.fish setlocal syntax=sh
autocmd FileType html,xml,sh,javascript,typescript,json,yaml,sql,vim,fish setlocal tabstop=4 shiftwidth=4  softtabstop=4 noexpandtab

" plugins settings
let g:airline_theme='badcat'

call glaive#Install()

augroup autoformat_settings
	autocmd FileType html,css,json AutoFormatBuffer js-beautify
augroup END
