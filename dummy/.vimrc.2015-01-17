" syntastic doesn't like fish
" https://github.com/scrooloose/syntastic/issues/803
set shell=bash

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

" .json files should use javascript syntax
au BufRead,BufNewFile *.json set ft=javascript
au BufNewFile,BufRead manifest.webapp set filetype=javascript

syntax enable
set background=light
"set background=dark
let g:solarized_termcolors=256
colorscheme solarized
"map <C-s> set paste
" Tell vim to remember certain things when we exit
"  '100 :  marks will be remembered for up to 10 previously edited files
"  "1000:  will save up to 100 lines for each register
"  :200 :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='100,\"2500,:200,%,n~/.viminfo

let &colorcolumn=join(range(81,999),",")

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

let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components\|.sass-cache'
