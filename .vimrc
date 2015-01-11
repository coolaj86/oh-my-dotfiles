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

au BufRead,BufNewFile *.json set ft=javascript

syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

set viminfo='100,\"1000,:200,%,n~/.viminfo

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
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components'
