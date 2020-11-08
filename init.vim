if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

if !empty(glob('~/.config/nvim/_machine_different.vim/universal.vim'))
    source ~/.config/nvim/_machine_different.vim/universal.vim
endif

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
noremap <M-c> :nohlsearch<CR>

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

set dictionary+=/usr/share/dict/words

let g:ale_disable_lsp=1
call plug#begin('~/.config/nvim/plugged')
    if !empty(glob('~/.config/nvim/_machine_different.vim/pluglist.vim'))
        source ~/.config/nvim/_machine_different.vim/pluglist.vim
    endif
    Plug 'yianwillis/vimcdoc'

    """ make me edit easy
    Plug 'neoclide/coc.nvim', {'branch':'release'}
    Plug 'fatih/vim-go', {'for': ['go', 'vim-plug'], 'tag': '*'}
    Plug 'jiangmiao/auto-pairs'
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-surround'
    Plug 'lervag/vimtex', {'for': 'tex'}
    Plug 'honza/vim-snippets'

    """ Functional integrations
    Plug 'mbbill/undotree'
    Plug 'mhinz/vim-startify'
    Plug 'voldikss/vim-floaterm'
    Plug 'liuchengxu/vim-which-key'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
    Plug 'junegunn/fzf.vim'
    Plug 'dense-analysis/ale'

    Plug 'denstiny/Terslation'
    Plug 'SpringHan/Terslation.vim', {'on': ['TerslationToggle','TerslationWordTrans']}
    Plug 'voldikss/vim-translator'

    """ make it colorful
    Plug 'vim-airline/vim-airline'
    Plug 'edkolev/tmuxline.vim'
    Plug 'frazrepo/vim-rainbow'
    Plug 'jackguo380/vim-lsp-cxx-highlight'
    Plug 'sheerun/vim-polyglot'

    Plug 'liuchengxu/vista.vim'
call plug#end()

if !empty(glob('~/.config/nvim/_machine_different.vim/dependonplug.vim'))
    source ~/.config/nvim/_machine_different.vim/dependonplug.vim
endif

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

" convenient motion when line wrap on
noremap j gj
noremap k gk
" tab operations
nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tp :tabp<CR>
nnoremap <leader>tc :tabnew<space>
nnoremap <leader>td :tabclose<CR>

" file operations
nnoremap S :w<CR>
nnoremap R :source $MYVIMRC<CR>
nnoremap Q :q<CR>


""" config for coc.nvim{{{
if !empty(glob('~/.config/nvim/_machine_different.vim/forcoc.vim'))
    source ~/.config/nvim/_machine_different.vim/forcoc.vim
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <CR> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
nnoremap \\f :Format<CR>

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<CR>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<CR>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<CR>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<CR>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<CR>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" List item yankked
nnoremap <silent> <space>y :CocList -A --normal yank<CR>
" Mappings using coc-explorer
nmap <leader>ex :CocCommand explorer <CR>

" For coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
""" end of config for coc.nvim}}}

""" config for for vim-rainbow{{{
let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']]  ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']]  ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']]  ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']]  ],
    \ ]
""" end of config for vim-rainbow}}}

""" config for Vista.vim{{{
noremap <c-t> :silent! Vista finder coc<CR>
noremap <c-l> :Vista!!<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
 \   "function": "\uf794",
 \   "variable": "\uf71b",
 \  }
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
""" end of config for Vista.vim}}}

"""{{{ config for startify

let g:startify_custom_header =
        \ startify#pad(split(system('cowsay -f dragon Welcome back, my deer friend!'), '\n'))
let g:startify_bookmarks=[
    \ {'rc': '~/.config/nvim/init.vim'},
    \ {'zrc': '~/.zshrc'}
    \ ]

"""end of config for startify }}}

"""{{{ config with Floaterm
let g:floaterm_keymap_new    = '<space>fc'
let g:floaterm_keymap_prev   = '<space>fp'
let g:floaterm_keymap_next   = '<space>fn'
let g:floaterm_keymap_toggle = '<space>ft'
let g:floaterm_position      = 'topright'
command! Ranger FloatermNew --autoclose=1 ranger
nnoremap <space>fr :Ranger<CR>

"""end of config with Floaterm}}}
"""{{{ config for ale
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"""}}}

"""{{{ config for lines(bufferline & airline)
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

let g:airline_section_b = airline#section#create(['%{get(b:,''coc_git_status'','''')}','%{get(g:,''coc_git_status'','''')}'])

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = '✘'
let g:airline#extensions#ale#warning_symbol = '⚡'
let g:airline#extensions#ale#open_lnum_symbol = '[:'
let g:airline#extensions#ale#close_lnum_symbol = '] '

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#right_alt_sep=''
let g:airline#extensions#tabline#right_sep=''
let g:airline#extensions#tabline#left_alt_sep=''
let g:airline#extensions#tabline#left_sep=''

let g:airline#extensions#tmuxline#enabled=0

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'
"""}}}

"""{{{config for translators
let g:TerslationFloatWin=1

" Echo translation in the cmdline
nmap <silent> <space>ts <Plug>Translate
vmap <silent> <space>ts <Plug>TranslateV

" Display translation in a window
nmap <silent> <space>tw <Plug>TranslateW
vmap <silent> <space>tw <Plug>TranslateWV

" Replace the text with translation
nmap <silent> <space>tr <Plug>TranslateR
vmap <silent> <space>tr <Plug>TranslateRV

" Translate the text in clipboard
nmap <silent> <space>tx <Plug>TranslateX
"""end of config for translators}}}

"""{{{ config for whick-key
nnoremap <silent> <space> :<c-u>WhichKey '<space>'<CR>
nnoremap <silent> <leader> :<c-u>WhichKey '\'<CR>
"""end of config for which-key}}}

"""{{{ config for vimtex
let g:tex_flavor="latex"
" use vimtex as default compiler
let g:vimtex_compiler_latexmk_engines={'_':'-xelatex'}
let g:vimtex_compiler_latexrun_engines={'_':'xelatex'}

" use zathura as the default pdf reviewer
let g:vimtex_view_method='zathura'

" show the compiler hint
let g:vimtex_quickfix_mode = 1

" hide the last two lines
set conceallevel=1

let g:tex_conceal='abdmg'
"""}}}

"""{{{ config for vim-go
let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0
"""end}}}

