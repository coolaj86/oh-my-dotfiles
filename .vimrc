call pathogen#infect()
syntax on

set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set softtabstop=2

set hlsearch
set autoindent
set scrolljump=10
set scrolloff=7
set number

" .json files are javascript
au BufRead,BufNewFile *.json set ft=javascript


set rtp+=/Users/coolaj86/Code/go/misc/vim
filetype plugin indent on

" Open NerdTree when Vim starts
"au VimEnter * NERDTree
"au VimEnter * wincmd p


syntax enable
"set background=light
set background=dark
colorscheme solarized
"map <C-s> set paste
" Tell vim to remember certain things when we exit
"  '100 :  marks will be remembered for up to 10 previously edited files
"  "1000:  will save up to 100 lines for each register
"  :200 :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='100,\"2500,:200,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END
