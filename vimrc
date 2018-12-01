" Written by sift <siftxxx@gmail.com>.
" 2018-12-01

set nocompatible
syntax enable
syntax on

" Color scheme
colorscheme jellybeans
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0
filetype plugin indent on
if ! has("gui_running")
    set t_Co=256
endif
if &diff
    colors jellybeans
endif

" Basic config.
set autoread
set autowrite

set backspace=2
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set encoding=utf-8
set fileencodings=utf-8,bg18030,gbk,big5,latin1

set showmatch
set matchpairs+=<:>
set hlsearch
set ignorecase
set incsearch

set clipboard+=unnamed
set completeopt=preview,menu
set gdefault
set number
set numberwidth=5
set ruler
set shiftround
set showcmd
set whichwrap=b,s,<,>,[,]
set colorcolumn=+1
set history=1000
set wrap
set linebreak
set list
set listchars=tab:»·,trail:·
set cursorline

"DIY color based on jellybeans.
hi Normal ctermfg=188
hi Operator ctermfg=214 
hi NonText ctermfg=134 guifg=#af5fdf 
hi search cterm=NONE ctermfg=0 ctermbg=222 guifg=#fad07a
hi Visual ctermfg=218 ctermbg=243
hi Statement ctermfg=217
hi comment ctermfg=35
hi CursorLine term=bold cterm=underline ctermfg=None ctermbg=0

au BufRead,BufNewFile *.py,*.c,*.cpp,*.h,*.sh,*.proto syn match PreProc /\w*\./
au BufRead,BufNewFile *.py,*.c,*.cpp,*.h,*.sh,*.proto syn match Operator /[,:=!\.\-\~\+\*\%\|]/
au BufRead,BufNewFile *.py,*.c,*.cpp,*.h,*.sh,*.proto syn match StringDelimiter /[\(\)\[\]{}<>]/
au BufRead,BufNewFile *.py,*.pyw,*.c,*.cpp*,*.h,*.sh,*.proto match Error /\s\+$/

au BufRead,BufNewFile * syn match Type /\S*nz_album/
au BufRead,BufNewFile * syn match String /\S*nz_music/
au BufRead,BufNewFile * syn match rubyIdentifier /\S*nz_game/
au BufRead,BufNewFile * syn match WildMenu /\S*nr_role/
