-- Testando terminal
vim.api.nvim_create_autocmd("TermOpen", {
    desc = "Desativa a exibição de números relativos e absolutos  buffers de terminal",
    group = vim.api.nvim_create_augroup("TerminalSettings", { clear = true }),
    callback = function()
        vim.opt_local.number = false -- Desativa números de linha
        vim.opt_local.relativenumber = false -- Desativa números relativos
    end,
})

-- Tabela para armazenar referências a terminais persistentes
local persistent_terminals = {}

-- Função para criar ou reabrir um terminal persistente
local function open_or_reuse_terminal(name, command, mode)
    -- Verifica se o terminal já existe
    if
        persistent_terminals[name]
        and vim.api.nvim_buf_is_valid(persistent_terminals[name].buf)
    then
        -- Se o terminal ainda está válido, apenas reabre a janela
        local win_id = vim.fn.bufwinid(persistent_terminals[name].buf)
        if win_id == -1 then
            -- Buffer existe mas não está visível, abrir em uma nova janela
            vim.cmd("split")
            vim.api.nvim_win_set_buf(0, persistent_terminals[name].buf)
        else
            -- Foca a janela existente
            -- vim.api.nvim_set_current_win(win_id)
            -- Se está visível, fechar a janela
            vim.api.nvim_win_close(win_id, true)
        end
    else
        -- Cria um novo terminal
        vim.cmd("split") -- Abre o terminal em um split
        local buf = vim.api.nvim_create_buf(false, true) -- Cria um buffer temporário
        vim.api.nvim_win_set_buf(0, buf) -- Associa o buffer à janela
        vim.cmd.term() -- Abre o terminal
        vim.cmd.wincmd("J")
        -- Salva a referência ao terminal
        persistent_terminals[name] = { buf = buf }

        -- Executa o comando no terminal, se fornecido
        if command and #command > 0 then
            vim.fn.chansend(
                vim.b.terminal_job_id,
                table.concat(command, "\n") .. "\n"
            )
        end
    end

    -- Ajusta o modo do terminal
    if mode == "insert" then
        vim.cmd.startinsert() -- Modo de inserção
    elseif mode == "normal" then
        vim.cmd.stopinsert() -- Volta ao modo normal
    end
end

--
-- Atalho para executar o comando de compilação
vim.keymap.set("n", "<F5>", function()
    open_or_reuse_terminal("compilation", { "make" }, "normal")
end, {
    desc = "Executar ou reabrir terminal, com mesmo buffer, para compilação",
})

-- Atalho para abrir o terminal do shell (zsh)
vim.keymap.set("n", "<leader>t", function()
    open_or_reuse_terminal("zsh", { "" }, "insert")
end, {
    desc = "Executar ou reabrir terminal, com o mesmo buffer, em modo de inserção",
})
