set title number relativenumber completeopt-=preview
set tabstop=4 shiftwidth=4 noexpandtab 
set encoding=utf-8 nobomb
set ignorecase smartcase
set scrolloff=999

set scrolloff=40 showmode showcmd hidden wildmode=list:longest
set signcolumn=yes

" override higlight color
highlight Search     ctermfg=Black	ctermbg=Red	cterm=NONE
highlight Cursor     ctermfg=Black	ctermbg=Red	cterm=bold

syntax on
""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Functions
"
""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer --tern-completer --omnisharp-completer --gocode-completer
  endif
endfunction

" Deoplete
function! DoRemoteUpdate(arg)
 UpdateRemotePlugins
endfunction<Paste>

""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugins
"
""""""""""""""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.nvim/plugged')

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'

" Code completion
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM'), 'for': ['c', 'cpp', 'objc', 'objcpp'] } | Plug 'ervandew/supertab' | Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'SirVer/ultisnips'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemoteUpdate')} 
Plug 'ervandew/supertab'

" Others
Plug 'tmhedberg/matchit'
Plug 'Yggdroot/indentLine'
Plug 'Raimondi/delimitMate'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'editorconfig/editorconfig-vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Languages
Plug 'exu/pgsql.vim', { 'for': 'sql' }
Plug 'fatih/vim-go', { 'for': 'go' } | Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'jparise/vim-graphql', { 'for': 'graphql' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' } | Plug 'davinche/godown-vim'
Plug 'tikhomirov/vim-glsl', { 'for': 'glsl' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'elzr/vim-json', { 'for': 'json' } 
Plug 'posva/vim-vue', { 'for': 'vue'}
Plug 'leafgarland/typescript-vim', { 'for': 'typescript'} | Plug 'Quramy/tsuquyomi'
Plug 'mxw/vim-jsx', { 'for': 'jsx'}
Plug 'ianks/vim-tsx', { 'for': 'tsx'}

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin settings
"
""""""""""""""""""""""""""""""""""""""""""""""""""
let delimitMate_expand_cr = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme= 'bubblegum'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:closetag_filenames = '*.html,*.xml'
let g:deoplete#enable_at_startup = 1
let g:flow#qfsize = 0
let g:go_auto_type_info = 1
let g:godown_autorun = 1
let g:godown_port = 7331
let g:go_fmt_command = 'goimports'
let g:go_gocode_unimported_packages = 1
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_color_term = 111
let g:indentLine_faster = 1
let g:java_fmt_options = '--aosp'
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0
let g:sql_type_default = 'pgsql'
let g:SuperTabDefaultCompletionType = '<c-n>'
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1

let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

"---------------------------------------------------
"
" Keys remap
"
"---------------------------------------------------
nnoremap ; :

" Disable arrow keys
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" vim-go settings
au FileType go nmap <Leader>r <Plug>(go-rename)
au FileType go nmap <Leader>gd <Plug>(go-def-split)
au FileType go nmap <Leader>gv <Plug>(go-def-vertical)
au FileType go nmap <Leader>gt <Plug>(go-def-tab)
au FileType go nmap <Leader>gs <Plug>(go-doc)

""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Other settings
"
""""""""""""""""""""""""""""""""""""""""""""""""""

" file settings
autocmd FileType html,xml,ruby,sh,javascript,javascript.jsx,jsx,json,yaml,sql,vim,cmake,proto,typescript,ps1 setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType gitconfig setlocal tabstop=2 shiftwidth=2 softtabstop=2 noexpandtab
autocmd BufNewFile,BufRead *.bolt setlocal filetype=typescript
autocmd BufNewFile,BufRead *.go.tpl,*.qtpl setlocal syntax=go

" python hosts
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    let g:python2_host_prog = '/opt/local/bin/python2.7'
    let g:python3_host_prog = '/opt/local/bin/python3.4'
  if s:uname == "Linux\n"
    let g:python2_host_prog = '/usr/bin/python'
    let g:python3_host_prog = '/usr/bin/python3'
  endif
endif
endif

" ctrl-p settings
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|node_modules\|dist|lib$',
  \ }


