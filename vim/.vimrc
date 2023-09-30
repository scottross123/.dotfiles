" leader key
let mapleader = " "

" netrw settings
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=3
let g:netrw_altv=1
let g:netrw_winsize=30
let g:netrw_keepdir=0
let g:netrw_localcopydircmd='cp -r'
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" file explorer on right hadn side
nnoremap <leader>ea :Lexplore! %:p:h<CR>
nnoremap <leader>ee :Lexplore!<CR>

inoremap jj <Esc>

" search and replace
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left> 
" tab stuff
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set number ruler
set autoindent smartindent
syntax enable

" tell " to shut up about saving before switching buffer
set hidden

filetype plugin indent on

" line number
set number

" search stuff 
set incsearch
set showmatch
set ignorecase
set smartcase

" wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.class

" faster window navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" faster window resizing
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" colors
" set termguicolors 
set colorcolumn = ""

" shift lines like in vscode
" M is alt, see :help key-notations
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

" go back to explorer
nnoremap <leader>pv :Ex<CR>

"  center after crtl d and crtl u
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" keymap.set("n", "n", "nzzzv")
" keymap.set("n", "N", "Nzzzv")

" keymap.set("x", "<leader>p", [["_dP]])

"  copy to clipboard
"  gvim is needed on linux for clipboard support
nnoremap <leader>y :"+y<CR>
vnoremap <leader>y :"+y<CR>
nnoremap <leader>Y :"+Y<CR>

" send to blackhole
vnoremap <leader>d :"_d<CR>
nnoremap <leader>d :"_d<CR>

"  format, very useful
"  TODO put this in lua config
" keymap.set("n", "<leader>f", " lsp.buf.format)

" cycle through quix fix list
" TODO come up with better keymaps
" keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
" keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

" cycle through location list
" TODO come up with better keymaps
" keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
" keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

"  i think this was to make a file executable, might be worth turning back on
nnoremap <slient> <leader>x :!chmod +x %<CR>

" change word on enter 
nnoremap <cr> ciw
