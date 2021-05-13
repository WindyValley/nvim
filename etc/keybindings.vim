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
nnoremap ,r :source $MYVIMRC<CR>
nnoremap ,e :e $MYVIMRC<CR>
nnoremap S :w<CR>
nnoremap Q :q<CR>

nmap <F1> :h<space>
noremap <M-c> :nohlsearch<CR>
nnoremap <M-]> zR
nnoremap <M-[> zM

" 正常模式下 alt+j,k,h,l 调整分割窗口大小
nnoremap <M-j> :resize +5<cr>
nnoremap <M-k> :resize -5<cr>
nnoremap <M-h> :vertical resize -5<cr>
nnoremap <M-l> :vertical resize +5<cr>

