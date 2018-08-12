" Wrap text in git commit messages
au FileType gitcommit set tw=72

" Fugitive settings
nmap <leader>gs :Gstatus<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gh :Glog -- %<CR>

" git grep the word under cursor
nmap <leader>gg :Ggrep <cword> .<CR>

" Git gutter settings
set updatetime=100      " suggested by gitgutter

let g:gitgutter_enabled = 1

function! s:Gcm(message)
    execute ":Gwrite"
    execute ":Gcommit -m ". a:message
endfu

command! -nargs=1 Gcm call s:Gcm(<f-args>)

" Don't index files listed in gitignore.
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
