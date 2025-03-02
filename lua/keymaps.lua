-- Modos:
--      normal_mode = "n"
--      insert_mode = "i"
--      visual_mode = "v"
--      visual_block_mode = "x"
--      term_mode = "t"
--      command_mode = "c"

local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- remapeia ';' para `.` - busca do próximo padrão
vim.api.nvim_set_keymap("n", ".", ";", { noremap = true, silent = true })

-- Window - Movimentação entre janelas
map("", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("", "<C-l>", "<C-w>l", { desc = "Go to right window" })
map("", "<A-Left>", "<C-w>h", { desc = "Go to left window" })
map("", "<A-Down>", "<C-w>j", { desc = "Go to lower window" })
map("", "<A-UP>", "<C-w>k", { desc = "Go to upper window" })
map("", "<A-Right>", "<C-w>l", { desc = "Go to right window" })

-- vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
-- Mapeie a tecla <F5> para executar o comando Pytest
vim.api.nvim_set_keymap(
    "n",
    "<F5>",
    ":Pytest<CR>",
    { noremap = true, silent = true }
)
