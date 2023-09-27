-- Restaura a posição do cursor
vim.cmd [[ 
    autocmd BufRead * autocmd FileType <buffer> ++once
      \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif
]]

-- Recarreha automaticamente arquivos modificados 
vim.cmd [[
    au FocusGained,BufEnter * :checktime
]]

vim.cmd [[
    command! Pytest :!hatch run test -vv -s
]]
