
<h1 align="center">dotfiles ♥ ~/</h1>

![preview](https://user-images.githubusercontent.com/27065646/61782469-62ac3300-ae06-11e9-85e4-b22e45da39f7.png)

---

## Have any questions?
Dont hesitate to ask a a question. Like they say, there is no stupid question, only a stupid answer 😊

Just create an issue or email me → siddharth.dushantha[at]gmail[dot]com

## How to install the dotfiles?
I use ```stow``` to manage my dotfiles.
To install all of them, just run:
```bash
[~/dotfiles]$ # First delete the READEME.md because you dont want that :P
[~/dotfiles]$ rm README.md
[~/dotfiles]$ stow *
```

If you want the config of just one program (e.g ```mpv```), just run:
```bash
[~/dotfiles]$ stow mpv
```
**Note:** Some of the keybindings in the i3 config needs some scripts. You can find them in [this repo](https://github.com/sdushantha/bin).



## todo

Add some of this to my config 
```vim
call plug#begin('~/.vim/plugged')
call plug#end()

syntax on
set laststatus=0
set foldmethod=marker
hi Folded ctermfg=white ctermbg=none
set bg=light
set noshowcmd
set noruler
set relativenumber

" Save the undotree to a file when exiting a buffer
set undofile
set undolevels=1000
set undodir=~/.config/nvim/tmp/undo/
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), 'p')
endif

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

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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
nnoremap <silent> <c-x> :e ~/.config/nvim/init.vim<cr>

" Quick way to update init.vim while Im using it
map <silent> <C-a> :source ~/.config/nvim/init.vim <cr>

nnoremap , :
set backspace=indent,eol,start


colorscheme default


set cursorline
highlight CursorLine ctermbg=236 cterm=None
hi CursorLineNR ctermbg=236

highlight LineNr ctermfg=darkgrey
```
