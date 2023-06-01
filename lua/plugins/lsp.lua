return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' }, -- Required
        {
            -- Optional
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional
        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },                  -- Required
        { 'hrsh7th/cmp-nvim-lsp' },              -- Required
        { 'L3MON4D3/LuaSnip' },                  -- Required
        {"jose-elias-alvarez/null-ls.nvim"},
    },
    config = function()
        local lsp = require('lsp-zero').preset("recommended")

        lsp.ensure_installed({
            'rust_analyzer', 'tsserver', 'lua_ls', 'gopls'
        })

        lsp.on_attach(function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }
            vim.keymap.set(
                'n', 'K',
                '<cmd>lua vim.lsp.buf.hover()<cr>', opts
            )
            vim.keymap.set(
                'n', 'gd',
                '<cmd>lua vim.lsp.buf.definition()<cr>', opts
            )
            vim.keymap.set(
                'n', 'gD',
                '<cmd>lua vim.lsp.buf.declaration()<cr>', opts
            )
            vim.keymap.set(
                'n', 'gi',
                '<cmd>lua vim.lsp.buf.implementation()<cr>', opts
            )
            vim.keymap.set(
                'n', 'go',
                '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts
            )
            vim.keymap.set(
                'n', 'gr',
                '<cmd>Telescope lsp_references<cr>', opts
            )
            vim.keymap.set(
                'n', 'gs',
                '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts
            )
            vim.keymap.set(
                'n', 'lr',
                '<cmd>lua vim.lsp.buf.rename()<cr>', opts
            )
            vim.keymap.set(
                'n', 'la',
                '<cmd>lua vim.lsp.buf.code_action()<cr>', opts
            )

            vim.keymap.set(
                'n', 'lw',
                '<cmd>Telescope diagnostics<cr>', opts
            )
            vim.keymap.set(
                'n', 'gl',
                '<cmd>lua vim.diagnostic.open_float()<cr>', opts
            )
            vim.keymap.set(
                'n', '[d',
                '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts
            )
            vim.keymap.set(
                'n', ']d',
                '<cmd>lua vim.diagnostic.goto_next()<cr>', opts
            )

            -- -- check file type, if Go then use GoFmt else the default
            if vim.bo.filetype == 'go' then
                vim.keymap.set(
                    { 'n', 'x' }, 'lf', '<cmd>GoFmt<cr>', opts)
            else
                vim.keymap.set(
                    { 'n', 'x' }, 'lf',
                    '<cmd>lua vim.lsp.buf.format({async = true})<cr>',
                    opts)
            end
        end)

        lsp.set_preferences({
            suggest_lsp_servers = false,
            sign_icons = {
                error = 'E',
                warn = 'W',
                hint = 'H',
                info = 'I'
            }
        })

        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

        lsp.setup()

        vim.diagnostic.config({
            virtual_text = true
        })

        local cmp = require('cmp')
        local cmp_action = require('lsp-zero').cmp_action()

        cmp.setup({
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = {
                ['<Tab>'] = cmp_action.luasnip_supertab(),
                ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
            }
        })

        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.blue
            }
        })
    end
}
