call plug#begin('~/.local/share/nvim/plugged')

" Common"
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'terryma/vim-multiple-cursors/'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/neopairs.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'w0rp/ale'
Plug '907th/vim-auto-save' 
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'tpope/vim-fugitive'

" Python
Plug 'zchee/deoplete-jedi'
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
Plug 'python-mode/python-mode'
Plug 'vim-scripts/django.vim'
Plug 'plytophogy/vim-virtualenv'

" Rust"
Plug 'wting/rust.vim' , { 'for': 'rust' }
Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rust' }

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Java
Plug 'https://github.com/artur-shaik/vim-javacomplete2'

" Themes"
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'liuchengxu/space-vim-dark'
call plug#end()

"Settings"

let mapleader = ","

let python_highlight_all=1
syntax on

syntax enable
"colorscheme onedark
colorscheme space-vim-dark
let g:space_vim_dark_background = 235
color space-vim-dark

" turn off backup and log files
set nobackup 	     " no backup files
set nowritebackup    " only in case you don't want a backup file while editing
set noswapfile 	     " no swap files

" Sets how many lines of history VIM has to remember
set history=500

if has('mouse')
  set mouse=a
endif

" enable system clipboard
set clipboard=unnamedplus

set tabstop=4 softtabstop=0 expandtab shiftwidth=4  

" PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \| set softtabstop=4
    \| set shiftwidth=4
    \| set textwidth=79
    \| set expandtab
    \| set autoindent
    \| set fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css 
    \| set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2

au BufNewFile,BufRead *.tex 
    \| set tabstop=2
    \| set softtabstop=0
    \| set shiftwidth=2
    \| set noexpandtab
    \| set fileformat=unix

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 

set enc=utf-8
set ls=2
set number

set cursorline
syntax sync minlines=256

set hidden
set wildmenu
set cmdheight=1
set lazyredraw "redraw only when we need to.

set nocompatible " not compatible with vi

set completeopt-=preview

set fileformats=unix,dos

" Searching"
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch

set runtimepath+=$XDG_CONFIG_HOME/nvim/plugged/deoplete.nvim

" turn off search highlight"
nnoremap <leader><space> :nohlsearch<CR>

" highlight last inserted text"
nnoremap gV `[v`]

vmap <Tab> >gv
vmap <S-Tab> <gv

"  при переходе за границу в 80 символов в Ruby/Python/js/C/C++ подсвечиваем
"  на темном фоне текст
augroup vimrc_autocmds
    autocmd!
    autocmd FileType rust,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType rust,python,javascript,c,cpp match Excess /\%80v.*/
    autocmd FileType rust,python,javascript,c,cpp set nowrap
augroup END

" Plugin settings"

" Nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"CTRL-t to toggle tree view with CTRL-t
nmap <silent> <C-t> :NERDTreeToggle<CR>
"Set F2 to put the cursor to the nerdtree
nmap <silent> <F2> :NERDTreeFind<CR>
set timeoutlen=1000
" set ttimeout"
set ttimeoutlen=50

" NERDTree settings"
" ignoring files"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']

"Airline options
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='onedark'

" Movement within 'ins-completion-menu'
imap <expr><C-j>   pumvisible() ? "\<Down>" : "\<C-j>"
imap <expr><C-k>   pumvisible() ? "\<Up>" : "\<C-k>"

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#max_abbr_width = 35
let g:deoplete#max_menu_width = 20

" Ale
" Shorten error/warning flags
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
" I have some custom icons for errors and warnings but feel free to change them.
let g:ale_sign_error = '✘✘'
let g:ale_sign_warning = '⚠⚠'

" Disable or enable loclist at the bottom of vim 
" Comes down to personal preferance.
let g:ale_open_list = 0
let g:ale_loclist = 0


" Setup compilers for languages

let g:ale_linters = {
      \  'cs':['syntax', 'semantic', 'issues'],
      \  'python': ['pylint'],
      \  'java': ['javac'],
	  \  'rust': ['rustc']
      \ }

"Loc List
map <leader>e :lopen<CR>
map <leader>w :lclose<CR>

" Neosnippet
let g:neosnippet#enable_completed_snippet = 1
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-l> <Plug>(neosnippet_expand_or_jump)
xmap <C-l> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


" Rust-Deoplete"
let g:deoplete#sources#rust#racer_binary='/usr/bin/racer'
let g:deoplete#sources#rust#rust_source_path="/usr/src/rust/src/"
let g:deoplete#sources#rust#documentation_max_height=20

let g:rustfmt_autosave = 1


" Python
let g:python3_host_prog='/usr/bin/python3'

" Django
fun! DetectTemplate()
  let n = 1
  while n < line("$")
    if getline(n) =~ '{%' || getline(n) =~ '{{'
      set ft=htmldjango
      return
    endif
    let n = n + 1
  endwhile
  set ft=html "default html
endfun

autocmd BufNewFile,BufRead *.html call DetectTemplate()

" Golang
let g:go_def_mapping_enabled = 0
set autowrite

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
