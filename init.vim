" Vim-plug {{{
call plug#begin(stdpath('data') . '/plugged')

Plug 'morhetz/gruvbox'
Plug 'godlygeek/tabular'

Plug 'tpope/vim-liquid'
"Plug 'plasticboy/vim-markdown'
"Plug 'lervag/vimtex'

call plug#end()
" }}}

" misc settings 
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

" Terminal Specifics {{{
let os=""
if has("unix")
    let s:uname = system("uname")
    if matchstr(s:uname, "Darwin") == "Darwin"
        let os="mac"
    else
        " NB: this is for the LSW as well
        let os="unix" 
    endif
endif

" colorscheme
set termguicolors
let h=strftime("%H") 
" if h > 7 && h < 17
    " set background=light
" else
    " set background=dark
" endif
set background=dark
colorscheme gruvbox
" }}}

" Keybindings, Abbreviations {{{
let mapleader=","
let maplocalleader="-"

nnoremap <leader>ev :tab split $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>

inoremap jk <esc>
inoremap <esc> <nop>

nnoremap Y y$
" TODO add yank to system clipboard
nnoremap d$ <nop>
nnoremap <leader>o o<esc>k

nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>

inoremap <leader>u <esc>viwUw<esc>i
nnoremap <leader>u viwU<esc>

nnoremap <leader>pb :execute "split " . bufname("#")<cr>
nnoremap <leader>m :execute "write" <bar> :execute "!make"<cr>

iabbrev @@ ethanrobison@protonmail.com
" }}}

" Markdown Files {{{
augroup filetype_markdown
    au!

    au BufNewFile,BufRead *.md setl tw=72

    au FileType markdown nnoremap <buffer> <leader>fq <esc>VgqA
    au FileType markdown nnoremap <buffer> <leader>ff <esc>{V}gq
    au FileType markdown nnoremap <buffer> <leader>nh /^#<space><cr>n
    au FileType markdown nnoremap <buffer> <leader>ph ?^#<space><cr>n

    au FileType markdown inoremap <buffer> <localleader>a á
    au FileType markdown inoremap <buffer> <localleader>e é
    au FileType markdown inoremap <buffer> <localleader>i í
    au FileType markdown inoremap <buffer> <localleader>o ó
    au FileType markdown inoremap <buffer> <localleader>u ú
    au FileType markdown inoremap <buffer> <localleader>n ñ


    " TODO add binding for comments

augroup END
" }}}

" SomaSim Config Files {{{
augroup filetype_scheme
    au!

    au FileType scheme nnoremap <buffer> <localleader>c <esc>0i;<esc>
augroup END

" }}}

" Vimscript Files {{{
augroup filetype_vim
    au!
    au FileType vim nnoremap <buffer> <localleader>c I"<space><esc>
    au FileType vim setl foldmethod=marker
    au FileType vim setl foldlevelstart=0
augroup END
" }}}
