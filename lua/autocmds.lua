-- Restaura a posição do cursor
vim.cmd([[
    autocmd BufRead * autocmd FileType <buffer> ++once
      \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif
]])
-- Recarreha automaticamente arquivos modificados
vim.cmd([[
    au FocusGained,BufEnter * :checktime
]])


vim.cmd([[
    command! Pytest :TermExec cmd='pytest -vv -s'
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
-- `:NewNote dir=drafts title=nova_nota, ...`
-- veja os paramêtros permitidos em:
-- https://github.com/zk-org/zk/blob/main/docs/editors-integration.md#zknew
vim.api.nvim_create_user_command("NewNote", function(opts)
    -- Parse de argumentos a partir de opts.args
    local args = {}
    for _, pair in ipairs(vim.split(opts.args, "%s+")) do
        local key, value = unpack(vim.split(pair, "="))
        args[key] = value
    end
    -- Define paramêtros aceitos pela função zk.new
    local params = {
        dir = args.dir or "drafts",
        title = args.title or "Untitled",
        group = args.group or nil,
        content = args.content or nil,
        template = args.template or nil,
        extra = args.extra or nil,
        date = args.date or nil,
        dryRun = args.dryRun == "true",
    }
    -- Chama a função zk.new para criar uma nova nota
    require("zk").new(params)
end, { nargs = "*" })

-- Terminal
vim.api.nvim_create_autocmd("TermOpen", {
    desc = "Open Terminal",
    group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
        vim.cmd.startinsert()
    end,
})


vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.yml,*.yaml",
    callback = function()
        local lines = vim.api.nvim_buf_get_lines(0, 0, 20, false)
        for _, line in ipairs(lines) do
            if line:match("^%s*hosts:") or line:match("^%s*tasks:") or line:match("^%s*roles:") then
                vim.bo.filetype = "yaml.ansible"
                return
            end
        end
        -- fallback: se não detectou palavras-chave, mantém como yaml
        vim.bo.filetype = "yaml"
    end,
})
