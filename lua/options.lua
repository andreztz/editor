-- Mapeamento de teclas
local opt = vim.opt

-- Sincroniza com a área de tranferência do sistema
opt.clipboard = "unnamedplus"
-- Habilita mouse
opt.mouse = "a"
-- Exibe linhas numeradas
opt.number = true
-- Habilita truecolor
opt.termguicolors = true
-- Highlight para linha selecionada
opt.cursorline = true

-- Indentação
-- Converte espaços em tabulação
opt.expandtab = true
-- Define o número de espaços inseridos para cada indentação
opt.shiftwidth = 4
-- Insere indentação automáticamente
opt.smartindent = true
-- Número de espaços para cada tabulação
opt.tabstop = 4
