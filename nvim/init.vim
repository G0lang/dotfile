" install plug auto
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin('~/.config/nvim/plugins')
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'zchee/deoplete-go', { 'do': 'make' }
" Plug 'jodosha/vim-godebug'
Plug 'zchee/deoplete-jedi'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jreybert/vimagit'
Plug 'majutsushi/tagbar'
Plug 'jmcantrell/vim-virtualenv'
Plug 'mhartington/oceanic-next'
Plug 'mhinz/vim-signify'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'fatih/molokai'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'pseewald/vim-anyfold'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'mbbill/undotree'

Plug 'pangloss/vim-javascript'
Plug 'ekalinin/Dockerfile.vim'
Plug 'stephpy/vim-yaml'
Plug 'plasticboy/vim-markdown'
Plug 'othree/html5.vim'
Plug 'leafgarland/typescript-vim'
Plug 'uarun/vim-protobuf'
Plug 'vim-scripts/JSON.vim'
Plug 'nelsyeung/twig.vim'

Plug 'vimlab/split-term.vim'
Plug 'kien/ctrlp.vim'
Plug 'Raimondi/delimitMate'

Plug 'terryma/vim-multiple-cursors'

Plug 'pearofducks/ansible-vim'

Plug 'freitass/todo.txt-vim', { 'for': 'todo.txt' }
Plug 'raimon49/requirements.txt.vim'


Plug 'Shougo/neosnippet' | Plug 'Shougo/neosnippet-snippets'

" Add plugins to &runtimepath
call plug#end()

" install missing plugins on start
autocmd VimEnter *
  \  if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall
  \| endif

" leader key
let g:mapleader = ","
" python
let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" highligh 80 char
set colorcolumn=80

" use real tabs in .go files, not spaces
autocmd FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
autocmd FileType py setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab


" not scroll
set mouse=a
set scrolloff=9999

" deoplete
set completeopt=longest,menuone " auto complete setting
let g:deoplete#enable_at_startup           = 1
let g:deoplete#enable_smart_case           = 1
let g:deoplete#auto_complete_start_length  = 1
let g:deoplete#keyword_patterns            = {}
let g:deoplete#keyword_patterns['default'] = '\h\w*'
let g:deoplete#omni#input_patterns         = {}
let g:deoplete#sources#go#sort_class       = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#align_class      = 1
let g:deoplete#sources#go#gocode_binary    = $GOPATH.'/bin/gocode'

let g:AutoPairsMapCR=0

map <expr><TAB> pumvisible() ? "\<C-n>" : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>")
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
imap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>\<Plug>AutoPairsReturn"





" neomake
autocmd BufWritePost * Neomake
let g:neomake_error_sign            = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign          = {'text': '∆', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign          = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign             = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}
let g:neomake_go_enabled_makers     = [ 'go', 'gometalinter' ]
let g:neomake_go_gometalinter_maker = {
  \ 'args': [
  \   '--tests',
  \   '--enable-gc',
  \   '--concurrency=3',
  \   '--fast',
  \   '-D', 'aligncheck',
  \   '-D', 'dupl',
  \   '-D', 'gocyclo',
  \   '-D', 'gotype',
  \   '-E', 'errcheck',
  \   '-E', 'misspell',
  \   '-E', 'unused',
  \   '%:p:h',
  \ ],
  \ 'append_file': 0,
  \ 'errorformat':
  \   '%E%f:%l:%c:%trror: %m,' .
  \   '%W%f:%l:%c:%tarning: %m,' .
  \   '%E%f:%l::%trror: %m,' .
  \   '%W%f:%l::%tarning: %m'
  \ }
let g:neomake_python_flake8_maker = {
    \ 'args': ['--ignore=E221,E241,E272,E251,W702,E203,E201,E202',  '--format=default'],
    \ 'errorformat':
        \ '%E%f:%l: could not compile,%-Z%p^,' .
        \ '%A%f:%l:%c: %t%n %m,' .
        \ '%A%f:%l: %t%n %m,' .
        \ '%-G%.%#',
    \ }
let g:neomake_python_enabled_makers = ['flake8']

" vim-go
let g:go_def_mapping_enabled = 0
let g:go_snippet_case_type = "camelcase"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_term_mode = "split"
let g:go_term_enabled = 1
" performance !!!
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1
set updatetime=200
let g:go_auto_sameids = 1
let g:go_term_enabled = 1
let g:go_term_mode = "split"
let g:go_term_height = 13

" vim-go mappings
autocmd FileType go nmap <buffer><leader>r  <plug>(go-run)
autocmd FileType go nmap <buffer><leader>b  <plug>(go-build)
autocmd FileType go nmap <buffer><leader>t  <plug>(go-test)
autocmd FileType go nmap <buffer><leader>e  <plug>(go-rename)
autocmd FileType go nmap <buffer><leader>c  <plug>(go-coverage-toggle)
autocmd FileType go nmap <buffer>	 gd <plug>(go-def-split)
autocmd FileType go nmap <buffer><leader>i  <plug>(go-info)
autocmd FileType go nmap <buffer><Leader>gh <Plug>(go-doc)
autocmd FileType go nmap <buffer><Leader>gv <Plug>(go-doc-vertical)

" undotree 
nmap <C-U> :UndotreeToggle<CR>

" tagbar
nmap <C-T> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 25

" nerdtree
nmap <C-]> :NERDTreeTabsToggle<CR>
let g:NERDTreeWinPos         = "right"
let NERDTreeMinimalUI        = 1
let NERDTreeIgnore           = ['\~$', '\.pyc$', '^\.DS_Store$', '.ropeproject', '__pycache__']
let NERDTreeDirArrows        = 1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeWinSize        = 25
autocmd VimEnter * if argc() == 0 | NERDTree | endif
" Auto close if NERDTree is the last thing open
autocmd bufenter *
   \ if (winnr("$") == 1 && exists("b:NERDTree")
   \ && b:NERDTree.isTabTree()) | q | endif
set laststatus=2
let g:nerdtree_tabs_open_on_console_startup = 1

" copy to clipboard
noremap <C-c> "+y
let g:loaded_matchparen = 1
" startup with number
set number
set numberwidth=2
" fold
filetype plugin indent on
let anyfold_fold_comments=1
let anyfold_identify_comments=2
let anyfold_comments = ["//"]
syntax on
let anyfold_activate=0
set foldlevel=0
" Aireline theme
let g:airline_powerline_fonts = 1
let g:airline_theme           = 'oceanicnext'
" theme
syntax enable
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

"sets 
set wildignore+=.*,.git,*.swp,*pyc,*pyo,*.png,*.jpg,*.gif,*.ai,*.jpeg,*.psd,*.jar,*.zip,*.gem,log/**,tmp/**,coverage/**,rdoc/**,output_*,*.xpi,doc/**

set whichwrap+=<,>,h,l
set fileformat=unix

" spell check
setlocal spell spelllang=en_us
set nospell

" Easymotion
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
nmap	     s <Plug>(easymotion-overwin-f2)
map  <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" In insert or command mode, move normally by using Ctrl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>
