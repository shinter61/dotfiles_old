if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  nnoremap <C-g> :exec 'Ack' expand('<cword>')<CR>
  nnoremap ag :Ack<CR>
endif
