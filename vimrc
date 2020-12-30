set encoding=utf-8

syntax off
filetype plugin indent on

set ruler smartindent
set synmaxcol=1000
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

Plug 'dense-analysis/ale'
Plug 'fatih/vim-go'
Plug 'bufbuild/vim-buf'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" code formatter
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'jiangmiao/auto-pairs'

call plug#end()

" override file settings
autocmd BufNewFile,BufRead *.go.tpl,*.qtpl,*.gunk setlocal syntax=go
autocmd BufNewFile,BufRead *.fish setlocal syntax=sh
autocmd FileType html,xml,sh,javascript,typescript,json,yaml,sql,vim,fish,proto setlocal tabstop=2 shiftwidth=2  softtabstop=2 expandtab

" plugins settings
let g:airline_theme='bubblegum'
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"

let g:ale_linters = {
\   'proto': ['buf-check-lint',],
\}
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters_explicit = 1

call glaive#Install()

augroup autoformat_settings
	autocmd FileType html,css,json AutoFormatBuffer js-beautify
augroup END
