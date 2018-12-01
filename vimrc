"
"
"
set nocompatible              " required
filetype off                  " required
syntax enable
syntax on
filetype plugin indent on    " required

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile Appraisals set filetype=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd Syntax javascript set syntax=jquery

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

set autoread
set autowrite

set backspace=2
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set clipboard+=unnamed
set completeopt=preview,menu
set encoding=utf-8
set fileencodings=utf-8,bg18030,gbk,big5,latin1
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

set showmatch
set matchpairs+=<:>
set hlsearch
set ignorecase
set incsearch

set list
set listchars=tab:»·,trail:·
set cursorline
highlight CursorLine term=bold cterm=underline ctermfg=None ctermbg=0

"let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"DIY color refer to jellybeans
hi Normal ctermfg=188
hi Operator ctermfg=214 
hi NonText ctermfg=134 guifg=#af5fdf 
hi search cterm=NONE ctermfg=0 ctermbg=222 guifg=#fad07a
hi Visual ctermfg=218 ctermbg=243
hi Statement ctermfg=217
hi comment ctermfg=35
au BufRead,BufNewFile *.py,*.c,*.cpp,*.h,*.sh,*.proto syn match PreProc /\w*\./
au BufRead,BufNewFile *.py,*.c,*.cpp,*.h,*.sh,*.proto syn match Operator /[,:=!\.\-\~\+\*\%\|]/
au BufRead,BufNewFile *.py,*.c,*.cpp,*.h,*.sh,*.proto syn match StringDelimiter /[\(\)\[\]{}<>]/
au BufRead,BufNewFile *.py,*.pyw,*.c,*.cpp*,*.h,*.sh,*.proto match Error /\s\+$/

au BufRead,BufNewFile * syn match rubyConstant /\S*nz_album/
au BufRead,BufNewFile * syn match rubyString /\S*nz_music/
au BufRead,BufNewFile * syn match rubyIdentifier /\S*nz_game/
augroup filetype
    autocmd! BufRead,BufNewFile BUILD set filetype=blade
augroup end
