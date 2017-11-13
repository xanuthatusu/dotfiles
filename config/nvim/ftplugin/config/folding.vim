setlocal foldexpr=GetConfigFold(v:lnum)
function! GetConfigFold(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
        if getline(a:lnum - 1) =~? '\v^\s*$'
            return '0'
        endif
    endif

    return '1'
endfunction
