"!clear && gcc % -o %< && ./%< && read
"{{{ Plugins  
call plug#begin()
Plug 'junegunn/goyo.vim'
    let g:goyo_width = 82
    let g:goyo_height = "80%"

Plug 'Yggdroot/indentLine'
    " Dont hide markdown symbols. 
    " By default, VIM hides characters like # and *
    " on the editor, but that really confuses me when editing
    let g:indentLine_fileTypeExclude = ['md']
    let g:indentLine_fileTypeExclude = ['markdown']
    let g:indentLine_concealcursor = 0
    let g:indentLine_conceallevel = 0

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    let g:mkdp_browser = "firefox"

Plug 'mboughaba/i3config.vim'
    " Set syntex highlighting for i3 config
    aug i3config_ft_detection
      au!
      au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
    aug end


Plug 'tpope/vim-commentary'
    " Insert/remove comment, vim-commentary
    nmap cq gcc
    vmap cq gcc

" Plug 'maxboisvert/vim-simple-complete'
"     set complete-=t
"     set complete-=i
Plug 'vim-python/python-syntax'
    let g:python_highlight_all = 1

Plug 'itchyny/lightline.vim'
    Plug 'mengelbrecht/lightline-bufferline'

    let g:lightline						= {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ] ],
      \ }
      \ }

    let g:lightline.colorscheme = "wombat"
    let g:lightline.tabline          = {'left': [['buffers']], 'right': [['']]}
    let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
    let g:lightline.component_type   = {'buffers': 'tabsel'}
    let g:lightline#bufferline#filename_modifier = ':t'

Plug 'lilydjwg/colorizer'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()
"}}}


"{{{ Looks  
" Turn on syntax highlighting.
syntax on

" Show line numbers
set number relativenumber 
hi LineNr ctermbg=NONE ctermfg=darkgrey

" Styling the autocomplete window
"  == Reference ==
"  Pmenu – normal item
"  PmenuSel – selected item
"  PmenuSbar – scrollbar
"  PmenuThumb – thumb of the scrollbar
highlight Pmenu ctermbg=grey
highlight PmenuSel ctermbg=darkgrey ctermfg=grey

" Always show tabline
set showtabline=2

" Always show status line
set laststatus=2

" Dont show --INSERT-- , --NORMAL-- , etc
set noshowmode

" Display all matching results when we tab complete in command mode
set wildmenu

" Highlight the 81st charcter
" I like to stay in the 80 character limit :)
highlight OverLength ctermbg=magenta ctermfg=black
match OverLength /\%81v\+/

" Fold the code. I only use this in my config files to organize it.
set foldmethod=marker
hi Folded ctermfg=white ctermbg=none

" Have an bar that indicates which line I am on
set cursorline
highlight CursorLine ctermbg=236 cterm=None
hi CursorLineNR ctermbg=236

highlight LineNr ctermfg=darkgrey

" Enable syntax highlighting for files formats that are not known by
" vim, but use the same syntax as file that are known to vim
" Example:
"    vifmrc uses the same syntax as .vim files
"    rofi themes (*.rasi) uses the same syntax as css
autocmd BufEnter,BufRead vifmrc :setfiletype vim

" Show quotes in JSON files because they are usually hidden and
" it honestly messes up what you are typing/seeing
set conceallevel=0
"}}}


"{{{ Search  
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
" }}}


"{{{ Tab  
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
" }}}


"{{{ Functions  
" Credits: https://github.com/LinuxSDA/HashBang
function! Hashbang(portable, permission, RemExt)
let shells = { 
        \    'awk': "awk",
        \     'sh': "bash",
        \     'hs': "runhaskell",
        \     'jl': "julia",
        \    'lua': "lua",
        \    'mak': "make",
        \     'js': "node",
        \      'm': "octave",
        \     'pl': "perl", 
        \    'php': "php",
        \     'py': "python",
        \      'r': "Rscript",
        \     'rb': "ruby",
        \  'scala': "scala",
        \    'tcl': "tclsh",
        \     'tk': "wish"
        \    }
let extension = expand("%:e")
if has_key(shells,extension)
	let fileshell = shells[extension]

	if a:portable
		let line =  "#!/usr/bin/env " . fileshell 
	else 
		let line = "#!" . system("which " . fileshell)
	endif

	0put = line

	" if a:permission
	" 	:autocmd BufWritePost * :autocmd VimLeave * :!chmod u+x %
	" endif

	if a:RemExt
		:autocmd BufWritePost * :autocmd VimLeave * :!mv % "%:p:r"
	endif
endif
endfunction
:autocmd BufNewFile *.* :call Hashbang(1,1,0)

"}}}


"{{{ Key mappings  
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
nnoremap j gj
nnoremap k gk

" Quickly edit init.vim while editing another file.
" :e# to go to the prevouse file you were originaly editing
nnoremap <silent> <c-x> :e ~/.config/nvim/init.vim<cr>

" Quick way to update init.vim while Im using it
map <silent> <C-a> :source ~/.config/nvim/init.vim <cr>

" Shift+. causes some trouble at times and it is not efficient
" The first line here is just here so that I get used to
" the new maping which the line after
" The first line here is just here so that I get used to
" the new maping which the line after.
" By the way, I have a MacBook, so the keyboard is
" a little different
nnoremap , :

" Moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Top/bottom of fold
nnoremap fj zo]zk
nnoremap fk zo[zj

" Toggel folds with space bar
nnoremap <space> za

" Some nice bindings for buffers
" Create new file or edit an existing file
nmap <C-t> :e 
" Close current buffer
nmap <C-w> :bp<CR>:bdelete #<CR>  

" Go to Nth buffer
" nnoremap <silent> <A-1> :b1<CR>
" nnoremap <silent> <A-2> :b2<CR>
" nnoremap <silent> <A-3> :b3<CR>
" nnoremap <silent> <A-4> :b4<CR>
" nnoremap <silent> <A-5> :b5<CR>
" nnoremap <silent> <A-6> :b6<CR> 
" nnoremap <silent> <A-7> :b7<CR>
" nnoremap <silent> <A-8> :b8<CR>
" nnoremap <silent> <A-9> :b9<CR>
nmap <A-1> <Plug>lightline#bufferline#go(1)
nmap <A-2> <Plug>lightline#bufferline#go(2)
nmap <A-3> <Plug>lightline#bufferline#go(3)
nmap <A-4> <Plug>lightline#bufferline#go(4)
nmap <A-5> <Plug>lightline#bufferline#go(5)
nmap <A-6> <Plug>lightline#bufferline#go(6)
nmap <A-7> <Plug>lightline#bufferline#go(7)
nmap <A-8> <Plug>lightline#bufferline#go(8)
nmap <A-9> <Plug>lightline#bufferline#go(9)

" Enable Goyo
nnoremap <silent> Q :Goyo<CR>:setlocal showtabline=0<CR>

nnoremap <c-o> :Files<CR>
inoremap <c-o> <Esc>:Files<CR>

" Automatic close certain characters (e.g brackets)
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O

" Since I have mapped Shift-J or uppercase J to scrolling down, we have to map
" ctrl-j to join so that we can join two lines
nnoremap <c-j> :join<CR>

" Create a nice custom fold. This requires the vimfold script from 
" my bin folder
vnoremap f :!vimfold<cr>za

" Tab auto completation at it's finest.
" Usually you would have to hit ctrl-n to show
" the completation but mapping it to Tab is feels more normal
inoremap <Tab> <C-n>
inoremap <S-Tab> <C-p>

" {{{ Code snippets  
" Jump to <++>, which is used in my mappings
inoremap ,, <Esc>/<++><Enter>"_c4l

" Markdown
autocmd FileType markdown inoremap ,1 # 
autocmd FileType markdown inoremap ,2 ## 
autocmd FileType markdown inoremap ,3 ### 
autocmd FileType markdown inoremap ,i ![<++>](<++>)
autocmd FileType markdown inoremap ,a [<++>](<++>)
autocmd FileType markdown inoremap ,c ``<Esc>i
autocmd FileType markdown inoremap ,bc ```<cr><cr>```<cr><Esc>2kI

" Bash
autocmd FileType sh inoremap ,f <++>(<++>){<CR>    <++><CR>}<CR><CR>
autocmd FileType sh inoremap ,i if [ <++> ]; then<CR><++><CR><BS>fi<CR><CR>
autocmd FileType sh inoremap ,e if [ <++> ]; then<CR><++><CR><BS>else<CR><++><CR><BS>fi<CR><CR>
" }}}

" }}}


"{{{ Command mappings  
" In case you forget to type sudo before editing a file
" where you might need to be root, write the file file
" by typing w!!
cmap w!! w !sudo tee % >/dev/null

" Prevent accidental closing of all buffers when doing :wq or :q
"cnoreabbrev wq w<bar>bd
"cnoreabbrev q bd


"}}}


"{{{ Uncatogorised  
" Search down into subfolders
" Provides tab-completion for all file related tasks
set path+=**

" Use system clipboard
set clipboard+=unnamedplus

" Save the undotree to a file when exiting a buffer
set undofile
set undolevels=1000
set undodir=~/.cache/nvim/undo/
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), 'p')
endif

" Save content from register to clipboard on exit
" https://stackoverflow.com/a/9381778/9215267
autocmd VimLeave * call system("xsel -ib", getreg('+'))

" Autoreload file when it gets changed externaly
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

" Autowrite, this is very useful because when you have edited a file
" and want to edit another one using :e or move to another buffer,
" you dont have to write the current one manually every time you switch
" buffers.
set autowriteall
"}}}
