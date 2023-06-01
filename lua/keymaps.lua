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

local Terminal = require("toggleterm.terminal").Terminal
local ipython_term = Terminal:new({ cmd = "ipython", hidden = true })

-- Terminal - Floating mode
map("n", "<leader>ft", function() ipython_term:toggle() end)

-- Muda janela
map("", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("", "<C-l>", "<C-w>l", { desc = "Go to right window" })

map("", "<A-Left>", "<C-w>h", { desc = "Go to left window" })
map("", "<A-Down>", "<C-w>j", { desc = "Go to lower window" })
map("", "<A-UP>", "<C-w>k", { desc = "Go to upper window" })
map("", "<A-Right>", "<C-w>l", { desc = "Go to right window" })


function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  -- Retorna para o modo 'Normal' a partir do modo de terminal
  -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  -- Retorna para o modo 'Normal' a partir do terminal
  -- vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  -- move o cursor para a janela da esquerda a partir do modo terminal
  vim.api.nvim_buf_set_keymap(0, 't', '<A-h>', [[<C-\><C-n><C-W>h]], opts)
  -- move o cursor para a janela inferior a partir do modo terminal
  vim.api.nvim_buf_set_keymap(0, 't', '<A-j>', [[<C-\><C-n><C-W>j]], opts)
  -- move o cursor para a janela superior a partir do modo terminal
  vim.api.nvim_buf_set_keymap(0, 't', '<A-k>', [[<C-\><C-n><C-W>k]], opts)
    -- move o cursor para a janela da direita a partir do modo terminal
  vim.api.nvim_buf_set_keymap(0, 't', '<A-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
