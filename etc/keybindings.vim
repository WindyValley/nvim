" key map without any function from plugins

" convenient motion when line wrap on
noremap j gj
noremap k gk
" tab operations
nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tp :tabp<CR>
nnoremap <leader>tc :tabnew<space>
nnoremap <leader>td :tabclose<CR>

" buffer operations
nnoremap <C-Left> :bp<CR>
nnoremap <C-Right> :bn<CR>

" file operations
nnoremap S :w<CR>
nnoremap R :source $MYVIMRC<CR>
nnoremap Q :q<CR>

nmap <F1> :h<space>
noremap <M-c> :nohlsearch<CR>
nnoremap <M-]> zR
nnoremap <M-[> zM

