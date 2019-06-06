set encoding=utf-8

" Detects the filetype and set correct syntax color
"filetype detect

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
set relativenumber
hi LineNr ctermbg=NONE ctermfg=darkgrey

" Display different types of white spaces.
" Very usefull when coding
"set list
"set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
"set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_



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

" Make double <Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" More intuitive way of...
" going home
nnoremap H 0
vnoremap H 0
" going to end of line
vnoremap L $
" and going to end of line and append
nnoremap L A

" Move up and down visual lines
" https://www.reddit.com/r/vim/comments/bjbhht/jumping_through_the_string_of_characters_like_go/
nnoremap j gj
nnoremap k gk

" In case you forget to type sudo before editing a file
" where you might need to be root, write the file file
" by typing w!!
cmap w!! w !sudo tee % >/dev/null

" Quickly edit init.vim while editing another file.
" :e# to go to the prevouse file you were originaly editing
nnoremap <c-x> :edit ~/.config/nvim/init.vim<cr>

" Quick way to update init.vim while Im using it
map <C-a> :source ~/.config/nvim/init.vim <cr>

syntax on

filetype off

""""PLUGIN""""
call plug#begin()
Plug 'Yggdroot/indentLine'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'davidhalter/jedi-vim'
Plug 'junegunn/goyo.vim'
call plug#end()
""""PLUGIN END""""

let g:mkdp_browser = "qutebrowser"


filetype plugin indent on  " allows auto-indenting depending on file type
autocmd FileType python setlocal completeopt-=preview
" Yank to clipboard
function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction

function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p

" Disable the status line
set laststatus=0

" Search down into subfolders
" Provides tab-completion for all file related tasks
set path+=**

" Display all matching results when we tab complete
set wildmenu

" show search matches as you type
set incsearch

set autoread

" Highlight the 81st charcter
" I like to stay in the 80 character limit :)
highlight OverLength ctermbg=magenta ctermfg=black
match OverLength /\%81v\+/

" Save the undotree to a file when exiting a buffer
set undofile
set undolevels=1000
set undodir=~/.config/nvim/tmp/undo/
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), 'p')
endif
