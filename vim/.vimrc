" inoremap is reammpings in insert mod, nnoremp for normal mode, vnoremap for
" visual

let mapleader = " "

inoremap jj <Esc>

nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left> 

set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set number ruler
set autoindent smartindent
syntax enable

" detect file type and do stuff with it
filetype plugin indent on

" colorscheme habamax
