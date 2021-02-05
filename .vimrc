" To source this file from your default .vimrc, input:
" :source [PATH_TO_THIS_FILE] 
"
" To install Vim 8.0 from github:
" git clone https://github.com/vim/vim.git
" cd vim
" configure
" (install dependencies as needed, usually 'yum install -y ncurses-devel')
" make
" make install
"
" Vundle
" https://github.com/VundleVim/Vundle.vim
" 
" To install:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" 
" To add plugins:
" - Type plugin name after 'call vundle#begin()' but before 'call vundle#end()
" - Exit out, then re-edit .vimrc again
" - Type ':BundleInstall' to see if package was added

set nocompatible                  " let vim not act like vi
filetype off
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()               " plugins must follow this, not before
"
"Plugin 'VundleVim/Vundle.vim'     " let Vundle manage Vundle, required
"Plugin 'vim-airline/vim-airline'  " status bar on bottom of vim
"Plugin 'jalvesaq/Nvim-R'          " work with R from vim
"
"call vundle#end()

" Modifications
syntax enable                  " allows text highlighting
filetype plugin on             " allows some vim features to work
filetype indent on             " automatically indent based on file syntax

set expandtab                  " sets tabs to spaces in insert mode
set tabstop=2                  " sets tabs to 4 spaces
set shiftwidth=2               " sets shifts to 4 spaces
set softtabstop=2              " tabs get deleted as tabs, not spaces

set number                     " shows number of lines on left
set cursorline                 " shows line where cursor is on

set path+=**                   " searches down in subdirectories
set wildmenu                   " shows matches for auto-completion
set ignorecase                 " ignores case when searching
set hlsearch                   " highlight matches as searching
set incsearch                  " matches while typing

set nobackup                   " no creation of ~ temp files
set nowritebackup              " no creation of ~ temp files
set noundofile                 " no creation of ~ temp files

set mouse=a                    " sets mouse support
set hidden                     " don't show hidden buffers in tabs
set ruler                      " show cursor position in lower right corner
set showcmd                    " shows commad in bottom
set backspace=indent,eol,start " backspaces work as normal
set showmatch                  " shows matching braces
set sidescroll=10              " automatically scrolls 10 characters
set background=dark            " font will brighten as if in dark background
set linebreak                  " words don't get broken at end of line
set foldcolumn=4               " shows folds in columns
set viminfo='500               " remembers 500 vim commands

" Remappings
" c-space for escape
nnoremap <c-space> <esc>
vnoremap <c-space> <esc>
inoremap <c-space> <esc>

" For certain editors, this works
" nnoremap <nul> <esc>
" vnoremap <nul> <esc>
" inoremap <nul> <esc>

" hjkl moves with each character, not line, in normal mode
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

" hjkl moves with each character, not line, in visual mode
vnoremap j gj
vnoremap k gk
vnoremap <Down> gj
vnoremap <Up> gk

" ctrl-h,j,k,l moves like arrow keys in insert mode
inoremap <c-h> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>

" ZA = save and quit-all
nnoremap ZA :wqa<CR>

" ZS = save-all
nnoremap ZS :wa<CR>

" ZX = quit without save-all
nnoremap ZX :qa<CR>

" Space acts like space in normal mode
nnoremap <space> i<space><right><esc>

" Backspace acts like backspace in normal mode
nnoremap <bs> i<bs><right><esc>

" Enter acts like enter in normal mode
nnoremap <enter> i<enter><esc>

" move <c-_> to <c-l>
nmap <c-_> <C-l>

" 10 move 10 spaces down and up
nnoremap <c-j> 10j
inoremap <c-j> 10j
vnoremap <c-j> 10j

nnoremap <c-k> 10k
inoremap <c-k> 10k
vnoremap <c-k> 10k

" <c-h> = 0
nnoremap <c-h> 0
vnoremap <c-h> 0

" <c-l> = $
nnoremap <c-l> $
vnoremap <c-l> $

" gA to run python off of current file
" gB to run python off of current selection
nnoremap gA :!python3 %:p<cr>
vnoremap gB :'<,'>:w !python3<cr>

" Custom commands
" Run python3 for the current file
"command P3 :!python3 %:p

" Functions
" Create titles surrounded by comment blocks
function CT(wrd, den)
  let wstr = ' ' . a:wrd . ' '
  let wlen = len(wstr)
  let wnum = 80 - wlen
  let wnum = wnum/2
  let fstr = repeat(a:den, wnum) . wstr . repeat(a:den, wnum)
  call setline('.', fstr)
endfunction






