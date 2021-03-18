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
set number

" key bindings
noremap <C-@> <c-x><c-o>

" plugins
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'

Plug 'govim/govim'
Plug 'dense-analysis/ale'
Plug 'bufbuild/vim-buf'

" code formatter
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'jiangmiao/auto-pairs'

call plug#end()

colorscheme nord
set termguicolors

" override file settings
autocmd BufNewFile,BufRead *.go.tpl,*.qtpl,*.gunk setlocal syntax=go
autocmd BufNewFile,BufRead *.fish setlocal syntax=sh
autocmd FileType html,xml,sh,javascript,typescript,json,yaml,sql,vim,fish,proto,tf,tfvars setlocal tabstop=2 shiftwidth=2  softtabstop=2 expandtab

" plugins settings

let g:ale_linters = {
\   'proto': ['buf-check-lint',],
\}
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters_explicit = 1

call glaive#Install()

augroup autoformat_settings
	autocmd FileType html,css,json AutoFormatBuffer js-beautify
augroup END

" govim
set updatetime=500
set balloondelay=250
set signcolumn=number

if has("patch-8.1.1904")
  set completeopt+=popup
  set completepopup=align:menu,border:off,highlight:Pmenu
endif

nmap <silent> <buffer> <C-h> : <C-u>call GOVIMHover()<CR>
