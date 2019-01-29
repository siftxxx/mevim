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
set confirm
set listchars=tab:»·,trail:·,eol:$
set autoread
set autowrite
set wildmenu
set report=0
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
set cursorline
set laststatus=2

" text formatting/layout
set cindent
set autoindent
set smartindent
set backspace=2
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smarttab

"text searching/matching
set showmatch
set matchpairs+=<:>
set ignorecase
set hlsearch
set incsearch

au BufRead,BufNewFile *.py,*.pyw,*.c,*.cpp*,*.h,*.sh,*.proto match Error /\s\+$/
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
au BufWritePre * call Removetrailingspace()

function! Removetrailingspace()
    if $vim_hate_space_errors != '0' &&
                \(&filetype == 'c' || &filetype == 'cpp' || &filetype == 'vim' || &filetype == 'sh' || &filetype == 'py')
        normal m`
        silent! :%s/\s\+$//e
        normal ``
    endif
endfunction

setlocal indentexpr=GetGooglePythonIndent(v:lnum)
function GetGooglePythonIndent(lnum)
  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif
  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)
endfunction
let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"

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

highlight RedundantSpaces ctermfg=110
match RedundantSpaces /\|\|\|\|\|\|/

au BufRead,BufNewFile * syn match Type /\S*nz_album/
au BufRead,BufNewFile * syn match String /\S*nz_music/
au BufRead,BufNewFile * syn match rubyIdentifier /\S*nz_game/
au BufRead,BufNewFile * syn match WildMenu /\S*nr_role/
