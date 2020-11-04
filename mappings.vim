" Window Navigation
" (make uppercase navigation work across windows)
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

" Map VIM 0 to first non-blank character
map 0 ^

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Ctrl+s saves
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>

" Ctrl+b makes
map <c-b> :make<CR>

" Visual mode '*' searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

" Plain arrows move text around
nmap <up>    [e
nmap <down>  ]e
nmap <left>  <<
nmap <right> >>
vmap <up>    [egv
vmap <down>  ]egv
vmap <left>  <gv
vmap <right> >gv

" Ctrl+arrow to resize pane
nnoremap <c-up>    :resize +2<CR>
nnoremap <c-down>  :resize -2<CR>
nnoremap <c-left>  :vertical resize -2<CR>
nnoremap <c-right> :vertical resize +2<CR>

" Exit terminal mode naturally
tnoremap <Esc> <C-\><C-n>

" Tab cycles through tabs (in normal mode!)
nnoremap <tab> :tabn<CR>
