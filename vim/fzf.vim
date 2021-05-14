" TODO export this to a file on imaginary!
let g:ecr_fzfProjects = []

" paths we would like to search
let g:ecr_fzfPath = [
            \ g:ecr_NdPath,
            \ 'c:\build\erobison\' . g:ecr_NdBranch . '\dcx\dch\']

let include_paths = ""
for path in g:ecr_fzfPath
    let include_paths .= path . ' '
endfor

" projects we omit if not searching all
let ignore_projects = ""
for project in g:ecr_fzfProjects
    if project == g:ecr_NdGame
        continue
    endif
    let ignore_projects .= '-E "' . project . '" '
endfor

" extensions to ignore
let g:ecr_fzfIgnoreExt = [
            \ 'swp',
            \ 'dll',
            \ 'el',
            \ 'ppt',
            \ 'txt',
            \ 'html',
            \ 'ico',
            \ 'backup']

let ignore_ext = ""
for ext in g:ecr_fzfIgnoreExt
    let ignore_ext .= '-E "*.' . ext . '" '
endfor

" paths to ignore
let g:ecr_fzfIgnoreDir = [
            \ 'docs',
            \ 'makerules',
            \ 'unittest-ndlib',
            \ 'unittest-corelib',
            \ 'unittest-gamelib',
            \ 'py27',
            \ 'tools',
            \ 'wws_sdk',
            \ 'vcproj',
            \ 'vcxproj',
            \ 'emacs']

let ignore_dir = ""
for dir in g:ecr_fzfIgnoreDir
    let ignore_dir .= '-E "' . dir . '" '
endfor

" TODO add all projects search
let g:ecr_fzfProjectSource = "fd --type f " . ignore_ext . " " . ignore_dir . " " . ignore_projects . " " . " . " . include_paths
nnoremap <leader>, :call fzf#run(fzf#wrap({'source': g:ecr_fzfProjectSource, 'sink': 'tabedit', 'down': '30%', 'options' : ['--reverse']}))<cr>
nnoremap <leader>v :call fzf#run(fzf#wrap({'source': g:ecr_fzfProjectSource, 'sink': 'vsplit', 'down': '30%', 'options' : ['--reverse']}))<cr>
nnoremap <leader>e :call fzf#run(fzf#wrap({'source': g:ecr_fzfProjectSource, 'sink': 'e', 'down': '30%', 'options' : ['--reverse']}))<cr>
