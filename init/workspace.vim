let g:workspace_powerline_separators = 1

noremap <Tab>           :WSNext<CR>
noremap <S-Tab>         :WSPrev<CR>
noremap <Leader><Tab>   :WSClose<CR>
noremap <Leader><S-Tab> :WSClose!<CR>
noremap <C-t>           :WSTabNew<CR>

cabbrev bonly WSBufOnly

" Mimic the 'simple' airline theme
function! WorkspaceSetCustomColors()
    highlight WorkspaceBufferCurrent ctermfg=8   ctermbg=10  guifg=#000000 guibg=#999999
    highlight WorkspaceBufferActive  ctermfg=8   ctermbg=10  guifg=#000000 guibg=#999999 cterm=bold

    ":hi airline_b
    highlight WorkspaceBufferHidden  ctermfg=247 ctermbg=236 guifg=#9e9e9e guibg=#303030
    highlight WorkspaceBufferTrunc   ctermfg=247 ctermbg=236 guifg=#9e9e9e guibg=#303030

    ":hi airline_a
    highlight WorkspaceTabCurrent    ctermfg=22  ctermbg=148 guifg=#005f00 guibg=#afd700 cterm=bold
    highlight WorkspaceTabHidden     ctermfg=22  ctermbg=148 guifg=#005f00 guibg=#afd700

    ":hi airline_x
    highlight WorkspaceFill          ctermfg=231 ctermbg=255 guifg=#ffffff guibg=#000000
endfunction

