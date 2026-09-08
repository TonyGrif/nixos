" === Core ===
set nocompatible
filetype plugin indent on
syntax enable

" === Display ===
set number
set relativenumber
set cursorline
set scrolloff=8
set sidescrolloff=8
set wrap
set linebreak
set showmatch
set ruler
set showcmd
set wildmenu
set wildmode=longest:full,full
set laststatus=2

" === Statusline ===
set statusline=%f\ %m%r%h%w
set statusline+=%=
set statusline+=[%{&ft}]\ %l/%L:%c\ %p%%

" === Indentation ===
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

" === Search ===
set incsearch
set hlsearch
set ignorecase
set smartcase

" === Behavior ===
set hidden
set backspace=indent,eol,start
set history=1000
set undolevels=1000
set autoread
set encoding=utf-8
set ttimeoutlen=50

" === File Finding ===
set path+=**
set wildignore+=*/.git/*,*/node_modules/*,*/__pycache__/*,*.o,*.pyc

" === Splits ===
set splitbelow
set splitright

" === Swap / Backup ===
set noswapfile
set nobackup
set nowritebackup

" === Persistent Undo (if $HOME writable) ===
if isdirectory($HOME . '/.vim/undo') == 0
    silent !mkdir -p ~/.vim/undo
endif
set undofile
set undodir=~/.vim/undo

" === Clipboard ===
if has('clipboard')
    set clipboard=unnamed
endif

" === Netrw (built-in file browser) ===
let g:netrw_banner    = 0
let g:netrw_liststyle = 3
let g:netrw_winsize   = 25

" === Keymaps ===
let mapleader = " "

" Easy escape
inoremap jk <ESC>

" Clear search highlight
nnoremap <ESC> :nohlsearch<CR>

" File browser
nnoremap <leader>e :Lexplore<CR>

" Split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize splits
nnoremap <leader>= <C-w>=
nnoremap <leader>> <C-w>>
nnoremap <leader>< <C-w><

" Buffer navigation
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bl :ls<CR>

" Move lines up/down in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Keep cursor centered on search
nnoremap n nzzzv
nnoremap N Nzzzv

" Keep cursor position on join
nnoremap J mzJ`z

" Yank to end of line
nnoremap Y y$

" Quick save / quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Indent/dedent and reselect
vnoremap < <gv
vnoremap > >gv

" Find file (tab-completes across ** path)
nnoremap <leader>ff :find<Space>

" Grep across project, results in quickfix
nnoremap <leader>fg :grep!<Space>

" Quickfix navigation
nnoremap <leader>fo :copen<CR>
nnoremap <leader>fc :cclose<CR>
nnoremap ]q :cnext<CR>zz
nnoremap [q :cprevious<CR>zz

" === Filetype-specific ===
augroup filetypes
    autocmd!
    autocmd FileType make setlocal noexpandtab
    autocmd FileType yaml,json,html,css,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd BufWritePre * :%s/\s\+$//e
augroup END

" === Color ===
set background=dark
silent! colorscheme slate
