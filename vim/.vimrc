set runtimepath=$VIMCONFIG,$VIMRUNTIME
set t_u7=
syntax on

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

nnoremap <space> za

" clear last search highlighting, my god
nnoremap <silent> <cr> :nohl<cr><cr>

" }}}

" fzf {{{

let g:her_Path	 = $HOME

let g:her_fzfPath = [ g:her_Path ]

let include_paths = ""
for path in g:her_fzfPath
	let include_paths .= path . ' '
endfor

" extensions to ignore
let g:her_fzfIgnoreExt =
			\ [
			\ 'swp',
			\ ]

let ignore_ext = ""
for ext in g:her_fzfIgnoreExt
	let ignore_ext .= '-E "*.' . ext . '" '
endfor

" paths to ignore
let g:her_fzfIgnoreDir =
			\ [
                        \ '.git',
                        \ 'Downloads'
			\ ]

let ignore_paths = ""
for dir in g:her_fzfIgnoreDir
	let ignore_paths .= '-E "' . dir . '" '
endfor

let g:her_fzfProjectSource = "fdfind --hidden --type f " . ignore_ext . " " . ignore_paths . " " . " . " . include_paths
nnoremap <leader><leader> :call fzf#run(fzf#wrap({'source': g:her_fzfProjectSource, 'sink': 'tabedit', 'down': '30%', 'options' : ['--reverse']}))<cr>

" }}}
