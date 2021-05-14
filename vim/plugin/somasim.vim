augroup filetype_scheme
    au!

    au FileType scheme nnoremap <buffer> <localleader>c <esc>0i;<esc>
    au FileType scheme setl sw=8 sts=8 noet list
augroup END
