set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'tpope/vim-rails'
Plugin 'gmarik/Vundle.vim'
Plugin 'slim-template/vim-slim'
Plugin 'wincent/command-t'
Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
Bundle 'edkolev/promptline.vim'
Bundle 'edkolev/tmuxline.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'terryma/vim-smooth-scroll'
Bundle 'elixir-lang/vim-elixir'
Bundle 'junegunn/fzf.vim'
call vundle#end()
filetype plugin indent on

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_max_depth = 40
syntax enable
syntax on
set background=dark
colorscheme base16-default

hi Search cterm=NONE ctermfg=grey ctermbg=blue

set wrap

set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
set hlsearch
set incsearch
set foldmethod=indent
set title

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
let g:promptline_theme = 'airline'


let mapleader=","

set dir=~/.vim/tmp

if executable('ag')
  set grepprg=ag\ --vimgrep\ $*
  set grepformat=%f:%l:%c:%m
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>
  let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching=0
endif

""""" Normalization ====================
" Delete trailing white space on save
func! DeleteTrailingWS()
 exe "normal mz"
 %s/\s\+$//ge
 exe "normal `z"
endfunc
""""" End Normalization ================


noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
set clipboard=unnamed
set nu
set t_Co=256
hi Normal ctermbg=none
set cursorline
set cursorcolumn
set noswapfile
