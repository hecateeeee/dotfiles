echo ">^.^<"

set number
set ruler
set visualbell

" search
set hlsearch
set ignorecase
set smartcase

" tabs spaces &c.
set softtabstop=4
set shiftwidth=4
set expandtab

" Keybindings, Abbreviations {{{
let mapleader=","
let localleader="\\"
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>

inoremap jk <esc>
inoremap <esc> <nop>

" remove this later...
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

nnoremap Y y$
nnoremap d$ <nop>

nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>

inoremap <leader>u <esc>viwU<esc>i
nnoremap <leader>u viwU<esc>

iabbrev @@ ethanrobison@protonmail.com

" }}}

" markdown {{{
augroup filetype_markdown
    au!
    au BufNewFile,BufRead *.md setl tw=72
    " format block quotes (really, format any line, but I use cmd + V for
    " quotes quite often, so that's how I'll remember it)
    au FileType markdown nnoremap <buffer> <leader>fq <esc>VgqA
    au FileType markdown onoremap ih :<c-u>exe "norm! ?^# [a-zA-Z]\r:nohl\rvg_"<cr>
augroup END
" }}}

" vimscript {{{
augroup filetype_vim
    au!
    au FileType vim nnoremap <buffer> <localleader>c I"<space><esc>
    au FileType vim setl foldmethod=marker
    au FileType vim setl foldlevelstart=0
augroup END
" }}}
