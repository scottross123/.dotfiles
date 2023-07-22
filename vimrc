" inoremap is reammpings in insert mod, nnoremp for normal mode, vnoremap for
" visual

let mapleader = " "

inoremap jj <Esc>

nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left> 
