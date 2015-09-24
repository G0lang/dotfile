" close nerdtree with vim {{{

function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()

nnoremap <silent><Leader>0 :NERDTreeCWD<CR>
nnoremap <silent><Leader>9 :TlistToggle<CR> 

"}}}
" install plugin  {{{

call neobundle#append()
NeoBundle 'taglist.vim'
NeoBundle 'tslime.vim'
NeoBundle 'scrooloose/nerdtree'
call neobundle#end()
"}}}
" NERDTree Better file browser {{{

let NERDTreeWinPos = 'Right'
let NERDTreeShowBookmarks = 1
let NERDTreeWinSize = 35
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '__pycache__',
      \ '\.egg-info$', 'node_modules', '\.git$', '\.sass-cache']
      
" }}}
" custom vim config {{{
let g:gitgutter_max_signs = 1000
syntax on


"}}}
