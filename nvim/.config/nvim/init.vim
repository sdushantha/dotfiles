"{{{ Looks
" -----------------------------------------------------------------------------
" Turn on syntax highlighting.
syntax on

" Show line numbers
set number relativenumber 
hi LineNr ctermbg=NONE ctermfg=darkgrey

" Disable the status line
set laststatus=0

" Display all matching results when we tab complete
set wildmenu

" Highlight the 81st charcter
" I like to stay in the 80 character limit :)
highlight OverLength ctermbg=magenta ctermfg=black
match OverLength /\%81v\+/
" -----------------------------------------------------------------------------
"}}}


"{{{ Search
" -----------------------------------------------------------------------------
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases.
" What I have notcied is that, when searching with
" only lowercase, the upper case words are also shown.
" But if you search with uppercase, only uppercase is shown
set smartcase

" show search matches as you type
set incsearch

" Highlight matching search patterns
set hlsearch

" Make double <Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
" -----------------------------------------------------------------------------
" }}}


"{{{ Tabs
" -----------------------------------------------------------------------------
" Use spaces when using "<" and ">" to tab
set expandtab

" Use 4 spaces to represent tab
set tabstop=4

set softtabstop=4

" Copy indent from last line when starting new lineiletype indent on
set autoindent

" Number of spaces to use for auto indent
set shiftwidth=4

filetype indent on
set smartindent
" -----------------------------------------------------------------------------
" }}}


"{{{ Plugins
" -----------------------------------------------------------------------------
call plug#begin()
Plug 'Yggdroot/indentLine'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'junegunn/goyo.vim'
call plug#end()
" -----------------------------------------------------------------------------
"}}}


"{{{ Plugin configs
" -----------------------------------------------------------------------------
" Use qutebrowser as Markdown viewer for markdown-preview-nvim
let g:mkdp_browser = "qutebrowser"
au BufEnter *.{md,mkd,markdown,mdown,mkdn,mdwn} call mkdp#util#open_preview_page()

" Dont hide markdown symbols. 
" By default, VIM hides characters like # and *
" on the editor, but that really confuses me when editing
let g:indentLine_fileTypeExclude = ['md']
let g:indentLine_fileTypeExclude = ['markdown']
set conceallevel=0

" Need to see if this for jedi python thingy, if so, then remove it
filetype plugin indent on  " allows auto-indenting depending on file type
autocmd FileType python setlocal completeopt-=preview

" View selection from top when doing tab completion
let g:SuperTabDefaultCompletionType = "<c-n>"

" Styling the autocomplete window
"  == Reference ==
"  Pmenu – normal item
"  PmenuSel – selected item
"  PmenuSbar – scrollbar
"  PmenuThumb – thumb of the scrollbar
highlight Pmenu ctermbg=grey
highlight PmenuSel ctermbg=darkgrey ctermfg=grey
" -----------------------------------------------------------------------------
"}}}


"{{{ Functions
" -----------------------------------------------------------------------------
" Yank to clipboard
function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction

" Paste from clipboard
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction
" -----------------------------------------------------------------------------
"}}}


"{{{ Key mappings
" -----------------------------------------------------------------------------
" Disable the arrow keys
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

" Scroll up
nnoremap J <C-e>
" Scroll down
nnoremap K <C-y>

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

" Quickly edit init.vim while editing another file.
" :e# to go to the prevouse file you were originaly editing
nnoremap <c-x> :edit ~/.config/nvim/init.vim<cr>

" Quick way to update init.vim while Im using it
map <C-a> :source ~/.config/nvim/init.vim <cr>

" Remapping the simple yank, delete, paste keys to my functions
vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p
onoremap <silent> y y:call ClipboardYank()<cr>
onoremap <silent> d d:call ClipboardYank()<cr>

" Shift+. causes some trouble at times and it is not efficient
" The first line here is just here so that I get used to
" the new maping which the line after
" The first line here is just here so that I get used to
" the new maping which the line after.
" By the way, I have a MacBook, so the keyboard is
" a little different
nnoremap , :
" -----------------------------------------------------------------------------
" }}}


"{{{ Command mappings
" -----------------------------------------------------------------------------
" In case you forget to type sudo before editing a file
" where you might need to be root, write the file file
" by typing w!!
cmap w!! w !sudo tee % >/dev/null
" -----------------------------------------------------------------------------
"}}}


"{{{ Uncatogorised
" -----------------------------------------------------------------------------
" Search down into subfolders
" Provides tab-completion for all file related tasks
set path+=**

" Save the undotree to a file when exiting a buffer
set undofile
set undolevels=1000
set undodir=~/.config/nvim/tmp/undo/
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), 'p')
endif


" Autoreload file when it gets changed externaly
" For example "echo hi > file.txt"
" Source: https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" Triger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

set encoding=utf-8

" Stops producing  A B C D when pressing
" the arrow keys. Well, when I think about it, this
" might be just for vi not VIM
" I have also heard that it sets compatibility to Vim only.
set nocompatible

" Fixes common backspace problems
set backspace=indent,eol,start

" Fold the code. I only use this in my config files to organize it.
" zo - open fold
" zc - close fold
set foldmethod=marker
hi Folded ctermfg=white
" -----------------------------------------------------------------------------
"}}}
