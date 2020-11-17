" 不依赖插件的通用设置
autocmd VimEnter * highlight clear SignColumn
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"一些外观上的修改
set formatoptions-=tc
let $t_ut=''
set t_Co=256
set number
set relativenumber
set ruler
set cursorline
set cmdheight=2
set wildmenu
syntax enable
syntax on

"编辑行为
set tabstop=4
set expandtab    "用等宽空格替代Tab
set shiftwidth=4
set softtabstop=4
setlocal scrolloff=5
set hidden
set completeopt=longest,noinsert,menuone,noselect,preview

"系统级设置
set nocompatible "关闭对vi的兼容
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
set lazyredraw
set foldmethod=syntax

"set clipboard=unnamed "启用系统剪贴板，vim有内置方案可以沟通系统剪贴板，如无必要，可以不启用
"set paste    "启用粘贴，否则vim会将粘贴视作短时间内的大量输入
set backspace=indent,eol,start

"不创建备份文件
set nobackup
set nowritebackup

" undo文件设置
if has("persistent_undo")
    if has('nvim')
        set undodir=~/.cache/nvim/undo
    else
        set undodir=~/.cache/vim/undo'
    endif
    set undofile
endif

" Status/command bar
set laststatus=2
set autochdir
set showcmd

"Search settings
set hlsearch
set incsearch
set ignorecase
set smartcase
exec "nohlsearch"

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

set dictionary+=/usr/share/dict/words

" 针对文件格式的设置
" C/C++ programming helpers
augroup csrc
  au!
  autocmd FileType *      set nocindent smartindent
  autocmd FileType c,cpp  set cindent ts=2 softtabstop=2 shiftwidth=2
augroup END
" Set a few indentation parameters. See the VIM help for cinoptions-values for
" details.  These aren't absolute rules; they're just an approximation of
" common style in LLVM source.
set cinoptions=:0,g0,(0,Ws,l1
" Add and delete spaces in increments of `shiftwidth' for tabs
set smarttab

" LLVM Makefiles can have names such as Makefile.rules or TEST.nightly.Makefile,
" so it's important to categorize them as such.
augroup filetype
  au! BufRead,BufNewFile *Makefile* set filetype=make
augroup END

" In Makefiles, don't expand tabs to spaces, since we need the actual tabs
autocmd FileType make set noexpandtab

