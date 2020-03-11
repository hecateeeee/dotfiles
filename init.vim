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

" colorscheme
let h=strftime("%H") 
if h > 7 && h < 17
    set background=light
    colorscheme peachpuff
else
    set background=dark
    colorscheme elflord
endif

" Keybindings, Abbreviations {{{
let mapleader=","
let localleader="\\"
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>

inoremap jk <esc>
inoremap <esc> <nop>

nnoremap Y y$
nnoremap d$ <nop>

nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>

inoremap <leader>u <esc>viwU<esc>i
nnoremap <leader>u viwU<esc>

nnoremap <leader>pb :execute "split " . bufname("#")<cr>

iabbrev @@ ethanrobison@protonmail.com
" }}}

" markdown {{{
augroup filetype_markdown
    au!
    au BufNewFile,BufRead *.md setl tw=72
    au FileType markdown nnoremap <buffer> <leader>fq <esc>VgqA
    au FileType markdown nnoremap <buffer> <leader>ff <esc>{V}gq
    au FileType markdown nnoremap <buffer> <leader>o 3o<esc>ki
    au FileType markdown nnoremap <buffer> <leader>nh /^#<space><cr>n
    au FileType markdown nnoremap <buffer> <leader>ph ?^#<space><cr>n
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
