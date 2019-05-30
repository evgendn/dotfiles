call plug#begin('~/.local/share/nvim/plugged')

" ------------------------------ Plugin imports ------------------------------
" Common
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
Plug 'python-mode/python-mode'

" Rust
Plug 'wting/rust.vim' , { 'for': 'rust' }
Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rust' }

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Java
Plug 'https://github.com/artur-shaik/vim-javacomplete2'

" Themes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'liuchengxu/space-vim-dark'
call plug#end()


" ------------------------------ Settings" ------------------------------

" --- Theme settings ---
syntax enable
"colorscheme onedark
colorscheme space-vim-dark
let g:space_vim_dark_background = 235
color space-vim-dark


" --- Common settings ---
let mapleader = ","

syntax on

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

" Change how vim represents characters on the screen
set encoding=utf-8

" Set the encoding of files written
set fileencoding=utf-8

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


" --- Indentation settings ---
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

autocmd BufRead,BufNewFile *.py let python_highlight_all=1
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

" Control all other files
set tabstop=4 softtabstop=0 expandtab shiftwidth=4  

" Allow backspace to delete indentation and inserted text
" i.e. how it works in most programs
set backspace=indent,eol,start
" indent  allow backspacing over autoindent
" eol     allow backspacing over line breaks (join lines)
" start   allow backspacing over the start of insert; CTRL-W and CTRL-U stop once at the start of insert.


" --- Searching ---"
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


" ------------------------------ Plugin settings ------------------------------


" --- NERDTree plugin ---
"CTRL-t to toggle tree view with CTRL-t
nmap <silent> <C-p> :NERDTreeToggle<CR>
"Set F2 to put the cursor to the nerdtree
nmap <silent> <F2> :NERDTreeFind<CR>
set timeoutlen=1000
" set ttimeout"
set ttimeoutlen=50
" ignoring files"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" --- Airline plugin ---
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='onedark'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


" --- Ale plugin ---
" Shorten error/warning flags
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
" I have some custom icons for errors and warnings but feel free to change them.
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

" Disable or enable loclist at the bottom of vim 
" Comes down to personal preferance.
let g:ale_open_list = 0
let g:ale_loclist = 0


" --- Go ---
let g:go_def_mapping_enabled = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
set autowrite

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" go-vim plugin specific commands
" Also run `goimports` on your current file on every save
" Might be be slow on large codebases, if so, just comment it out
let g:go_fmt_command = "goimports"

" Status line types/signatures.
let g:go_auto_type_info = 1
" au filetype go inoremap <buffer> . .<C-x><C-o>
