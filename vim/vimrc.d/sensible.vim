if exists('g:loaded_sensible') || &compatible
  finish
else
  let g:loaded_sensible = 'yes'
endif

" lazy for faster redraw
set lazyredraw

" disable vi compatibility
set nocompatible

" set encoding
set encoding=utf-8

" show the full incomplete command at the bottom of screen.
set showcmd

" mouse support
set mouse=a

" enable line numbers
set number

" highlight the cursorline
set cursorline
" and also the column
set cuc cul

" make laggy connections work faster
set ttyfast

" case-insensitive filename completion
set wildignorecase

" allow unsaved hidden buffers
" https://vimtricks.com/p/what-is-set-hidden/
set hidden

" disable wrapping
set nowrap

" round tabs to the nearest tab
set shiftround

" set the tab to match
set autoindent

" when searching ignore case
set ignorecase

" when using case respect it
set smartcase

" highlight results
set hlsearch

"search as you type
set incsearch

" you know what's helpful a ridiculous back button
set history=1000
set undolevels=1000

" user backfile files foften
set backup
set backupdir=~/.vim/backup

" swap files kind of clutter up
set noswapfile

" I get these enough. I don't need more.
set noerrorbells

" always have a status.
set laststatus=2

" tab logic
set expandtab
set softtabstop=2 tabstop=2 shiftwidth=2

" add tab completion for commands
" https://vim.fandom.com/wiki/Great_wildmode/wildmenu_and_console_mouse
set wildmode=list:longest,full

" highlight matching [{()}]
set showmatch

" spellnig mattears.
set dictionary=/usr/share/dict/words

" ag isn't grep but it is faster.
if executable('ag')
   set grepprg=ag\ --nogroup\ --nocolor
endif

if has('autocmd')
  filetype plugin indent on
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" backspace cross the following
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" Delete commment characters when joining comment lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

" max tab count
if &tabpagemax < 50
  set tabpagemax=50
endif

if !empty(&viminfo)
  set viminfo^=!
endif

set sessionoptions-=options
set viewoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" vim:set ft=vim et sw=2:
