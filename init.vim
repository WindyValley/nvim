if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

if !empty(glob('~/.config/nvim/_machine_different.vim/universal.vim'))
    source ~/.config/nvim/_machine_different.vim/universal.vim
endif

source ~/.config/nvim/etc/universal.vim
source ~/.config/nvim/etc/keybindings.vim

call plug#begin('~/.config/nvim/plugged')
    if !empty(glob('~/.config/nvim/_machine_different.vim/pluglist.vim'))
        source ~/.config/nvim/_machine_different.vim/pluglist.vim
    endif
    Plug 'yianwillis/vimcdoc'

    """ make me edit easy
    Plug 'neoclide/coc.nvim', {'branch':'release'}
    Plug 'fatih/vim-go', {'for': ['go', 'vim-plug'], 'tag': '*'}
    Plug 'jiangmiao/auto-pairs'
    Plug 'tyru/caw.vim'
    Plug 'tpope/vim-surround'
    Plug 'lervag/vimtex', {'for': 'tex'}
    Plug 'honza/vim-snippets'
    Plug 'gcmt/wildfire.vim'
    Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo']  }

    """ Functional integrations
    Plug 'mbbill/undotree'
    Plug 'liuchengxu/vista.vim'
    Plug 'mhinz/vim-startify'
    Plug 'voldikss/vim-floaterm'
    Plug 'ryanoasis/vim-devicons'
    Plug 'liuchengxu/vim-which-key'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/vim-easy-align'
    Plug 'skywind3000/asynctasks.vim'
    Plug 'skywind3000/asyncrun.vim'
    Plug 'skywind3000/asyncrun.extra'
    Plug 'preservim/vimux'
    Plug 'denstiny/Terslation'
    Plug 'SpringHan/Terslation.vim', {'on': ['TerslationToggle','TerslationWordTrans']}
    Plug 'voldikss/vim-translator'

    """ make it colorful
    Plug 'vim-airline/vim-airline'
    Plug 'jackguo380/vim-lsp-cxx-highlight', {'for': ['c', 'cpp']}
    Plug 'nvim-treesitter/nvim-treesitter'
    " Plug 'sheerun/vim-polyglot'
call plug#end()

if !empty(glob('~/.config/nvim/_machine_different.vim/dependonplug.vim'))
    source ~/.config/nvim/_machine_different.vim/dependonplug.vim
endif

so ~/.config/nvim/etc/coc.vim

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
let g:floaterm_position      = 'center'
command! Ranger FloatermNew --autoclose=1 ranger
nnoremap <space>fr :Ranger<CR>
tnoremap fr <C-\><C-n>:Ranger<CR>

"""end of config with Floaterm}}}

"""{{{ config for ale
"自定义error和warning图标
let g:ale_disable_lsp=1

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

let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#error_symbol = '✘'
let g:airline#extensions#coc#warning_symbol = '⚡'
let g:airline#extensions#coc#open_lnum_symbol = '[:'
let g:airline#extensions#coc#close_lnum_symbol = '] '

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#right_alt_sep=''
let g:airline#extensions#tabline#right_sep=''
let g:airline#extensions#tabline#left_alt_sep=''
let g:airline#extensions#tabline#left_sep=''

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

"""{{{ config for wildfire.vim
" use '*' to mean 'all other filetypes'
" in this example, html and xml share the same text objects
let g:wildfire_objects = {
    \ "*" : ["i'", "i\"", "i<", "i)", "i]", "i}", "ip", "if", "af"],
    \ "html,xml,php" : ["at", "it"],
    \}
"""}}}

"""{{{ keymap with fzf.vim
nnoremap <silent> <space>lb :Buffers<CR>
nnoremap <silent> <space>lh :History<CR>
"""}}}

"""{{{ config for UndoTree
let g:undotree_WindowLayout='Layout 2'
nnoremap <M-u> :UndotreeShow<CR>:UndotreeFocus<CR>
"""}}}

""" config for far
nnoremap <LEADER>fr :Farr<CR>
let g:far#enable_undo = 1
"""

""" config for nvim-treesitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
}
EOF
"""

""" config for Asyncrun/AsynxTasks
au! BufRead,BufNewFile .tasks set ft=dosini
let g:asyncrun_mode = 'floaterm'
let g:asyncrun_rootmarkers=['.git', '.svn', '.project', 'build', 'go.mod', 'Cargo.toml']
let g:asynctasks_term_pos = 'floaterm'
let g:asynctasks_extra_config = [
            \ '~/.config/nvim/tasks.ini',
            \]

nnoremap <silent><F7> :AsyncTask project-build<CR>
nnoremap <silent><C-F7> :AsyncTask file-build<CR>
nnoremap <silent><F6> :AsyncTask project-run<CR>
nnoremap <silent><C-F6> :AsyncTask file-run<CR>
"""

""" config for vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"""
