set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'wincent/command-t'
Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
Bundle 'edkolev/tmuxline.vim'
call vundle#end()
filetype plugin indent on

syntax enable
syntax on
filetype plugin indent on
set background=light
colorscheme base16-default
hi Search cterm=NONE ctermfg=grey ctermbg=blue

set wrap
set textwidth=100

set tabstop=4
set expandtab
set hlsearch
set incsearch
set nu
set foldmethod=indent
set foldnestmax=4
set foldlevel=0
set title

ino jj <esc>
cno jj <c-c>
vno jj <esc>

let g:airline_left_sep='>'
let g:airline_theme             = 'murmur'
let g:airline_left_sep          = '>'
let g:airline_left_alt_sep      = '||'
let g:airline_right_sep         = '<'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'y'    : '%a %Y-%m-%d %l:%M%p',}


let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<Up>', '<C-Up>', '<']
let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<Down>', '<C-Down>', '>']
let g:CommandTAcceptSelectionMap = '<C-CR>'
let g:CommandTAcceptSelectionSplitMap = '<C-v>'
let g:CommandTAcceptSelectionTabMap = ['<CR>', '<C-b>']
let g:CommandTTraverseSCM = '~/ans/web/lib/a'

let mapleader=","
