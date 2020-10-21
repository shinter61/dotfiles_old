let g:startify_change_to_dir = 1     
let g:startify_change_to_vcs_root = 1     

" ASCII ARTを真ん中寄せする
" :h startifyを参照
function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
    let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction

let g:startify_custom_header = s:filter_header([    
        \'           __    _       __            ________',
        \'     _____/ /_  (_)___  / /____  _____/ ___<  /',
        \'    / ___/ __ \/ / __ \/ __/ _ \/ ___/ __ \/ / ',
        \'   (__  ) / / / / / / / /_/  __/ /  / /_/ / /  ',
        \'  /____/_/ /_/_/_/ /_/\__/\___/_/   \____/_/   ',
        \ ''     
        \])
let g:startify_enable_special = 1   
let g:startify_skiplist = [
        \ '^/tmp',
        \ '.tmp$',
        \ ]
let g:startify_update_oldfiles = 1

"Nerdtreeと同時に開く
autocmd VimEnter *
                \   if !argc()
                \ |   Startify
                \ |   NERDTree
                \ |   wincmd w
                \ | endif
