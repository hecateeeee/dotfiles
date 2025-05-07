" n.b., need to have this before the runtimepath set-up... i'm not entirely
" sure why, but otherwise vim90 synload.vim complains about missing
" colorschemes later... sigh
syntax on
set t_u7=
set runtimepath=$VIMCONFIG,$VIMRUNTIME

" Vim-plug {{{
call plug#begin($VIMCONFIG . '/plugged')

" utils
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " fzf core
Plug 'junegunn/fzf.vim'                                 " fzf vim integration
Plug 'prabirshrestha/vim-lsp'

" visuals
Plug 'morhetz/gruvbox'                                  " Colorscheme gruvbox
Plug 'flazz/vim-colorschemes'                           " Even more colorschemes
Plug 'itchyny/lightline.vim'                            " Statusline

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
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
set autoindent

" tabs (pages, not the characters)
set showtabline=2

" whitespace
set listchars=tab:>·,trail:~

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

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" General
inoremap jk <esc>
inoremap <esc> <nop>
vnoremap jk <esc>
vnoremap <esc> <nop>

" Editing
nnoremap Y y$
nnoremap <leader>yy "+yy
vnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap d$ <nop>
nnoremap <leader>o o<esc>k

inoremap <leader>U <esc>viwUw<esc>i
inoremap <leader>u <esc>viwuw<esc>i
nnoremap <leader>U viwU<esc>
nnoremap <leader>u viwu<esc>

" Navigation
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>

nnoremap H ^

nnoremap <space> za

" clear last search highlighting, my god
nnoremap <silent> <cr> :nohl<cr><cr>

" }}}

" fzf {{{

let g:her_Path = $HOME

let g:her_fzfPath = [ g:her_Path ]

let include_paths = ""
for path in g:her_fzfPath
	let include_paths .= path . ' '
endfor

" extensions to ignore
let g:her_fzfIgnoreExt =
			\ [
			\ 'jpg', 'jpeg',
			\ 'png',
			\ 'swp',
            \ 'gif',
            \ 'mov',
            \ 'pdf',
            \ 'rkt~',
            \ 'zip',
			\ ]

let ignore_ext = ""
for ext in g:her_fzfIgnoreExt
	let ignore_ext .= '-E "*.' . ext . '" '
endfor

" paths to ignore
let g:her_fzfIgnoreDir =
			\ [
                        \ '.git',
                        \ '.runelite',
                        \ 'Applications',
                        \ 'Videos/Party',
			\ ]

let ignore_paths = ""
for dir in g:her_fzfIgnoreDir
	let ignore_paths .= '-E "' . dir . '" '
endfor

let s:fzfFoo            = ignore_ext . " " . ignore_paths . " " . " . " . include_paths
let g:her_fzfCommand    = "fdfind --type f " . s:fzfFoo
let g:her_fzfCommandAug = "fdfind --hidden --no-ignore --type f " . s:fzfFoo
nnoremap <leader>e :call fzf#run(fzf#wrap({'source': g:her_fzfCommand, 'down': '30%', 'options' : ['--reverse'], 'sink':    'edit'}))<cr>
nnoremap <leader>s :call fzf#run(fzf#wrap({'source': g:her_fzfCommand, 'down': '30%', 'options' : ['--reverse'], 'sink':   'split'}))<cr>
nnoremap <leader>v :call fzf#run(fzf#wrap({'source': g:her_fzfCommand, 'down': '30%', 'options' : ['--reverse'], 'sink':  'vsplit'}))<cr>
nnoremap <leader>t :call fzf#run(fzf#wrap({'source': g:her_fzfCommand, 'down': '30%', 'options' : ['--reverse'], 'sink': 'tabedit'}))<cr>
nnoremap <leader>E :call fzf#run(fzf#wrap({'source': g:her_fzfCommandAug, 'down': '30%', 'options' : ['--reverse'], 'sink':    'edit'}))<cr>
nnoremap <leader>S :call fzf#run(fzf#wrap({'source': g:her_fzfCommandAug, 'down': '30%', 'options' : ['--reverse'], 'sink':   'split'}))<cr>
nnoremap <leader>V :call fzf#run(fzf#wrap({'source': g:her_fzfCommandAug, 'down': '30%', 'options' : ['--reverse'], 'sink':  'vsplit'}))<cr>
nnoremap <leader>T :call fzf#run(fzf#wrap({'source': g:her_fzfCommandAug, 'down': '30%', 'options' : ['--reverse'], 'sink': 'tabedit'}))<cr>

" }}}
