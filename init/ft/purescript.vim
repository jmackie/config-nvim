let g:neomake_purescript_enabled_makers = []   " Don't use Neomake
let g:psc_ide_syntastic_mode            = 1    " Use Syntastic (for now)

augroup PurescriptMaps
    au FileType purescript setlocal makeprg=psc-package\ build
augroup END
