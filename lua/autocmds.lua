-- Restaura a posição do cursor
vim.cmd([[
    autocmd BufRead * autocmd FileType <buffer> ++once
      \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif
]])
-- Recarreha automaticamente arquivos modificados
vim.cmd([[
    au FocusGained,BufEnter * :checktime
]])

-- vim.cmd([[
--     command! Pytest :!hatch run test -vv -s
-- ]])
--
vim.cmd([[
    command! Pytest :TermExec cmd='hatch run test -vv -s' 
]])

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
    callback = function()
        vim.cmd([[Trouble qflist open]])
    end,
})

-- Define configurações específicas para arquivos Markdown
vim.api.nvim_create_autocmd("FileType", {
    pattern = "md",
    callback = function()
        vim.opt_local.textwidth = 79
        vim.opt_local.formatoptions:append("t")
    end,
})

-- Define o comando`:NewNote`. Ex.:
-- `:NewNote dir=drafts title=nova_nota`
vim.api.nvim_create_user_command("NewNote", function(opts)
    -- Parse de argumentos a partir de opts.args
    local args = {}
    for _, pair in ipairs(vim.split(opts.args, "%s+")) do
        local key, value = unpack(vim.split(pair, "="))
        args[key] = value
    end
    -- Define valores padrão para argumentos quando não
    -- são fornecidos com o comando
    local dir = args.dir or "drafts"
    local title = args.title or "Untitled"
    -- Chama a função zk.new para criar uma nova nota
    require("zk").new({ dir = dir, title = title })
end, { nargs = "*" })
