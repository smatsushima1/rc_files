" To source this file from your default .vimrc, input:
" :source [PATH_TO_THIS_FILE] 

" To install Vim from github:
" git clone https://github.com/vim/vim.git
" cd vim
" configure
" (install dependencies as needed, usually 'yum install -y ncurses-devel')
" make
" make install


""""""""""""""""""""""""""""""""""" Plugins """""""""""""""""""""""""""""""""""
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

" Let vim not act like vi
set nocompatible                  
filetype off
"set rtp+=~/.vim/bundle/Vundle.vim

" Plugins must follow this, not before
"call vundle#begin()

" Let Vundle manage Vundle, required
" Status bar on bottom of vim
" Work with R from vim
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'vim-airline/vim-airline'
"Plugin 'jalvesaq/Nvim-R'
"call vundle#end()


"""""""""""""""""""""""""""""""" Modifications """"""""""""""""""""""""""""""""
" Allows text highlighting
syntax enable

" Allows some vim features to work
" Automatically indent based on file syntax
filetype plugin on
filetype indent on

" Sets tabs to spaces in insert mode
" Sets tabs to 2 spaces
" Sets shifts to 2 spaces
" Tabs get deleted as tabs, not spaces
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Shows number of lines on left
" Shows line where cursor is on
" Sets mouse support
" Show cursor position in lower right corner
" Shows commad in bottom
" Font will brighten as if in dark background
set number
set cursorline
set mouse=a
set ruler
set showcmd
set background=dark            

" Searches down in subdirectories
" Shows matches for auto-completion
" Ignores case when searching
" Ignores case when searching when combined with ignorecase
" Highlight matches as searching
" Matches while typing
set path+=**
set wildmenu
set ignorecase
set smartcase
set hlsearch
set incsearch

" No creation of ~ temp files
set nobackup
set nowritebackup              
set noundofile

" Don't show hidden buffers in tabs
" Backspaces work as normal
" Shows matching braces
" Automatically scrolls 10 characters
" Words don't get broken at end of line
" Shows folds in columns
" Remembers 500 vim commands
set hidden
set backspace=indent,eol,start
set showmatch
set sidescroll=10
set linebreak
set foldcolumn=4
set viminfo='500


"""""""""""""""""""""""""""""""""" Remappings """"""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""" Functions """"""""""""""""""""""""""""""""""
" Create titles surrounded by comment blocks
function CTi(wrd, del)
  let wstr = ' ' . a:wrd . ' '
  let wlen = len(wstr)
  let wnum = 80 - wlen
  let wnum = wnum/2
  let fstr = repeat(a:del, wnum) . wstr . repeat(a:del, wnum)
  call setline('.', fstr)
endfunction


