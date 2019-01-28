" Stops producing  A B C D when pressing
" the arrow keys. Well, when I think about it, this
" might be just for vi not VIM
set nocompatible

set tabstop=4
set shiftwidth=4
set backspace=2
set autoindent " Copy indent from last line when starting new lineiletype indent on
set smartcase
syntax on

" Have line number on the left side
set number
set relativenumber

set cursorline
hi CursorLine cterm=NONE 
hi CursorLineNr ctermbg=NONE ctermfg=yellow
hi LineNr ctermbg=NONE ctermfg=darkgrey

set textwidth=80
map <C-a> :source .vimrc <Enter>

" Disable the arrow keys so that I get used to using hjkl. Also, this forces
" to change to normal mode when I have want to move the cursor

" In NORMAL mode
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>

" In INSERT mode
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

" In VISUAL mode
xnoremap <up>    <nop>
xnoremap <down>  <nop>
xnoremap <left>  <nop>
xnoremap <right> <nop>
