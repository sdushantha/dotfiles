" Make vim useful.
set nocompatible
set number

set tabstop=4
set shiftwidth=4
set expandtab
set backspace=2
set autoindent " Copy indent from last line when starting new lineiletype indent on
se mouse+=a
" set hlsearch
set smartcase
syntax on
" Enable cursor line position tracking
set cursorline

hi CursorLine cterm=NONE ctermbg=darkgrey ctermfg=white
hi CursorLineNr ctermbg=NONE ctermfg=yellow

hi LineNr ctermbg=NONE ctermfg=darkgrey
