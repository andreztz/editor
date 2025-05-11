local load_modules = function(opts)
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

    if not vim.loop.fs_stat(lazypath) then
        -- bootstrap lazy.nvim
        -- stylua: ignore
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",
            lazypath
        })
    end

    vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

    require("lazy").setup({
        spec = {
            { import = "plugins" },
        },
        defaults = {
            lazy = false,
            version = false, -- always use the latest git commit
        },
        install = {
            missing = true,
            colorscheme = { "tokyonight", "gruvbox" },
        },
        checker = {
            enabled = false, -- automatically check for plugin updates
        },
        performance = {
            rtp = {
                -- disable some rtp plugins
                disabled_plugins = {
                    "gzip",
                    -- "matchit",
                    -- "matchparen",
                    -- "netrwPlugin",
                    "tarPlugin",
                    "tohtml",
                    "tutor",
                    "zipPlugin",
                },
            },
        },
    })
end

local start = function(leader, theme, transparency)
    vim.g.mapleader = leader
    vim.g.maplocalleader = leader
    -- Inicializa tema
    require("theme").set(theme, transparency)
    -- WARNING: "autocmds" deve ser carregado antes de load_modules.
    require("autocmds")
    load_modules()
    require("options")
    require("keymaps")
end

return {
    start = start,
}
