augroup filetype_markdown
    au!

    au BufNewFile,BufRead *.md setl tw=72

    au FileType markdown nnoremap <buffer> <localleader>fq <esc>VgqA
    au FileType markdown nnoremap <buffer> <localleader>ff <esc>{V}gq
    au FileType markdown nnoremap <buffer> <localleader>nh /^#<space><cr>n
    au FileType markdown nnoremap <buffer> <localleader>ph ?^#<space><cr>n
    au FileType markdown nnoremap <buffer> <localleader>m :execute "write" <bar> :execute "!make"<cr>

    au FileType markdown inoremap <buffer> <localleader>a Ã¡
    au FileType markdown inoremap <buffer> <localleader>e Ã©
    au FileType markdown inoremap <buffer> <localleader>i Ã­
    au FileType markdown inoremap <buffer> <localleader>o Ã³
    au FileType markdown inoremap <buffer> <localleader>u Ãº
    au FileType markdown inoremap <buffer> <localleader>n Ã±

    au FileType markdown iabbrev >; &rarr;

    " TODO add binding for comments

augroup END
