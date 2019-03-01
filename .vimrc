" Stops producing  A B C D when pressing
" the arrow keys. Well, when I think about it, this
" might be just for vi not VIM
" I have also heard that it sets compatibility to Vim only.
set nocompatible

" Use spaces when usinf "<" and ">" to tab
set expandtab

" Use 4 spaces to represent tab
set tabstop=4

" Number of spaces to use for auto indent
set shiftwidth=4

" Copy indent from last line when starting new lineiletype indent on
set autoindent

filetype indent on
set smartindent

set softtabstop=4

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases.
" What I have notcied is that, when searching with
" only lowercase, the upper case words are also shown.
" But if you search with uppercase, only uppercase is shown
set smartcase

" Turn on syntax highlighting.
syntax on

" Fixes common backspace problems
set backspace=indent,eol,start

" Highlight matching search patterns
set hlsearch

" Show line numbers
set number
set relativenumber
hi LineNr ctermbg=NONE ctermfg=darkgrey

" Display different types of white spaces.
" Very usefull when coding
set list
"set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
set listchars=tab:›\ ,extends:#,nbsp:.


" set textwidth=80
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

" Not sure if this is good. C-v is very usefull
"vnoremap <C-c> "+y
" Check later if P or p is better
"map <C-v> "+p

" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
