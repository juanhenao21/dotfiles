set nocompatible

runtime vimrc

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/bundle')

Plug 'bronson/vim-trailing-whitespace'
Plug 'christoomey/vim-sort-motion'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } | Plug 'junegunn/fzf.vim'

call plug#end()

" Settings

syntax enable
set ttyfast
set mouse=a

" Mappgings

let mapleader=','

nnoremap <leader>w :w <CR>
nnoremap <leader>x :x <CR>
nnoremap <leader>nh :nohlsearch <CR>
nnoremap <leader>nu :set invnumber <CR>
nnoremap <leader>nt :NERDTreeToggle <CR>
nnoremap Y y$

inoremap jj <ESC>
inoremap kk <ESC>
inoremap jk <ESC>

nnoremap <leader>ev :e ~/.config/nvim/init.vim <CR>
nnoremap <leader>sv :so ~/.config/nvim/init.vim <CR>

nnoremap <C-p> :GFiles<CR>
nnoremap <C-t> :Rg<CR>
nnoremap <C-.> :pumvisible()<CR>

" Wild stuff
set suffixes+=.a,.o,.pyc
set wildignore+=*.o,*.so,*.pyc
set wildignore+=*/node_modules/*,*/dist/*,*/.tmp*,*/tmp*,*/build/*,*/__pycache__/*,*/venv/*

" NERDTree
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeMapOpenInTab='\t'