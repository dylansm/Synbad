nnoremap <C-Y> :call Synbad()<CR>

fun! Synbad()
  if exists("s:checked_syntaxes") == 0
    call CheckForSyntaxes()
  endif

  if exists("g:syntaxes")
    if &ft != ''
    endif

    if exists("g:cur_synbad_index") == 0
      if &ft != ''
        let index_to_remove = index(g:syntaxes, &ft)
        if index_to_remove > -1
          call remove(g:syntaxes, index_to_remove)
  echo g:syntaxes
        endif
        call add(g:syntaxes, &ft)
      endif
      let g:cur_synbad_index = -1
    endif

    call SetNextSyntax()
  else
    echohl WarningMsg
    echom "No alternate syntaxes listed in .vimrc, ~/.syntaxes or ./.syntaxes."
    echohl none
  endif
endf

fun! CheckForSyntaxes()
  if filereadable(".syntaxes")
    call SetSyntaxesWithFile(".syntaxes")
  elseif filereadable($HOME."/.syntaxes")
    call SetSyntaxesWithFile($HOME."/.syntaxes")
  endif
  let s:checked_syntaxes = 1
endf

fun! SetSyntaxesWithFile(syntax_file)
  let g:syntaxes = readfile(a:syntax_file)
endf

fun! SetNextSyntax()
  " let g:cur_synbad_index += g:cur_synbad_index < len(g:syntaxes) ? 1 : -len(g:syntaxes)
  let g:cur_synbad_index += g:cur_synbad_index < len(g:syntaxes) - 1 ? 1 : -len(g:syntaxes) - 1
  let l:syntax_name = g:syntaxes[g:cur_synbad_index]
  echohl Special
  echo "Syntax: " . l:syntax_name
  echohl None
  execute "set ft=".l:syntax_name
endf
