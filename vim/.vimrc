set runtimepath=$VIMCONFIG,$VIMRUNTIME
set t_u7=
syntax on

" Vim-plug {{{
call plug#begin($VIMCONFIG . '/plugged')

" utils
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " fzf core
" Plug 'junegunn/fzf.vim'                                 " fzf vim integration
" Plug 'nfvs/vim-perforce'                                " p4
" Plug 'valloric/youcompleteme'                           " YCM baybee
" Plug 'tpope/vim-liquid'                                 " Liquid (for jekyll)

" visuals
Plug 'morhetz/gruvbox'                                  " Colorscheme gruvbox
Plug 'flazz/vim-colorschemes'                           " Even more colorschemes
" Plug 'pprovost/vim-ps1'                                 " Powershell support
Plug 'itchyny/lightline.vim'                            " Statusline
" Plug 'wlangstroth/vim-racket'				" Racket syntax etc, for dc/dcx files
" Plug 'adimit/prolog.vim'                                " SWI-prolog support

call plug#end()
" }}}

" General visuals {{{

" misc settings
set number
set ruler
set novisualbell
" turn off navigation tones, et al.
set belloff=all

" search
set hlsearch
set ignorecase
set smartcase

" tabs spaces &c.
set softtabstop=4
set shiftwidth=4
set expandtab
set nowrap

" tabs (pages, not the characters)
set showtabline=2

" whitespace
set listchars=tab:>�,trail:~

" gui
set backspace=2
set guifont=consolas:h12
" get rid of scrollbar, menubar, all that nonsense
set guioptions =t

" TODO
" directories 
" set dir^=c:\\vimtmp\\swp
" set backupdir=c:\\vimtmp\\backup
" set undodir=c:\\vimtmp\\undo

" colorscheme
" set termguicolors
set background=dark
colorscheme gruvbox

set encoding=utf-8

"}}}

" Terminal Specifics {{{

" Hack attack stolen from Max at ND
" Original comment from him: UGH terrible idea. Breaks a load of plugins.
" My comment: this enables p4 stuff when running from cygwin, since the cygwin
" term configs are wonky af. It's not clear, per Max's comment, which (if any)
" plugins are broken, but I'm keeping this around for posterity. Fucking
" software.
" if $SHELL == "/bin/tcsh"
    " set shell=c:/ndibin/cygwin/bin/tcsh.exe
    " set shellcmdflag=-c
    " set shellxquote=\"
    " set shellslash
" endif

" let g:ecr_NdBranch = $GAMEBRANCH
" let g:ecr_NdGame = $GAMENAME
" let g:ecr_NdPath = 'C:\branches\' . g:ecr_NdBranch

" set up the path properly
" :let &path = ""

" :let &path .= g:ecr_NdPath . '\shared\src\'
" :let &path .= ',' . g:ecr_NdPath . '\shared\src\**'
" :let &path .= ',' . g:ecr_NdPath . '\' . g:ecr_NdGame . '\src\'
" :let &path .= ',' . g:ecr_NdPath . '\' . g:ecr_NdGame . '\src\**'
" :let &path .= ',c:\build\erobison\code\' . g:ecr_NdBranch . '\' . g:ecr_NdGame . '\ps4\default\dch\'
" :let &path .= ',c:\build\erobison\code\' . g:ecr_NdBranch . '\' . g:ecr_NdGame . '\ps4\default\dch\**'
" :let &path .= ',c:\build\erobison\code\' . g:ecr_NdBranch . '\unittest-gamelib\ps4\default\dch\'				" because fuck you
" :let &path .= ',c:\build\erobison\code\' . g:ecr_NdBranch . '\unittest-gamelib\ps4\default\dch\**'			" because fuck me

" TODO
" exec ":cd " . g:ecr_NdPath

" }}}

" Keybindings, Abbreviations {{{
let mapleader=","
let maplocalleader="\\"

nnoremap <leader>ev :tab split $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>

inoremap jk <esc>
inoremap <esc> <nop>
vnoremap jk <esc>
vnoremap <esc> <nop>

nnoremap Y y$
nnoremap <leader>yy "+yy
vnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap d$ <nop>
nnoremap <leader>o o<esc>k

nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>

inoremap <leader>U <esc>viwUw<esc>i
inoremap <leader>u <esc>viwuw<esc>i
nnoremap <leader>U viwU<esc>
nnoremap <leader>u viwu<esc>

" clear last search highlighting, my god
nnoremap <silent> <cr> :nohl<cr><cr>

" I almost never use this... TODO remove?
" nnoremap <leader>pb :execute "split " . bufname("#")<cr>

" }}}

" NDI {{{
augroup filetype_cpp
    au!
    au Filetype cpp vmap <silent> <buffer> <localleader>= :pyfile c:/branches/main/tools/src/scripts/clang-format/clang-format.py<cr>
    au Filetype cpp nmap <silent> <buffer> <localleader>= :set opfunc=ClangFormat<CR>g@
augroup end

augroup ndi
    au!
    au BufNewFile,BufRead *.dc setlocal filetype=racket
    au BufNewFile,BufRead *.dcx setlocal filetype=racket
    au FileType cpp,racket setlocal
                \ noexpandtab
                \ tabstop=4
    au FileType cpp,racket nnoremap <buffer> <localleader>p :P4edit<cr>
    au FileType cpp,racket nnoremap <buffer> <localleader>P :P4revert<cr>
    au FileType cpp,racket nnoremap <silent> <buffer> <localleader>w :execute "setlocal list!"<cr>

augroup end

" clang format
let g:clang_format_path = "c:/ndibin/clang-format-ndi.exe"

function! ClangFormat(type)
	let start = getpos("'[")[1]
	let end = getpos("']")[1]
	let l:lines = start . ":" . end
	:pyf c:/branches/main/tools/src/scripts/clang-format/clang-format.py
endfunction

" }}}
