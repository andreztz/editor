return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
        { "neovim/nvim-lspconfig" },
        {
            "williamboman/mason.nvim",
            -- build = function()
            --     pcall(vim.cmd, 'MasonUpdate')
            -- end,
        },
        { "williamboman/mason-lspconfig.nvim" },
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "L3MON4D3/LuaSnip" },
        { "jose-elias-alvarez/null-ls.nvim" },
    },
    config = function()
        local lsp = require("lsp-zero").preset("recommended")

        lsp.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp.default_keymaps({ buffer = bufnr })
            -- -- -- check file type, if Go then use GoFmt else the default
            -- if vim.bo.filetype == 'go' then
            --     vim.keymap.set(
            --         { 'n', 'x' }, 'lf', '<cmd>GoFmt<cr>', opts)
            -- else
            --     vim.keymap.set(
            --         { 'n', 'x' }, 'lf',
            --         '<cmd>lua vim.lsp.buf.format({async = true})<cr>',
            --         opts)
            -- end
        end)

        lsp.set_preferences({
            suggest_lsp_servers = false,
            sign_icons = {
                error = "E",
                warn = "W",
                hint = "H",
                info = "I",
            },
        })
        require("mason").setup({})
        -- go to https://github.com/williamboman/mason-lspconfig.nvim
        -- to see list of languages
        require("mason-lspconfig").setup({
            ensure_installed = {
                "rust_analyzer",
                "tsserver",
                "lua_ls",
                "gopls",
                "pyright",
                "yamlls", -- yaml,yaml.github yaml.gitlab,yaml.docker-compose
                "ansiblels",
                "dockerls",
                -- "docker_compose_language_service",
                "htmx",
                "zk",
                "markdown_oxide",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,
                -- -- See `:h mason-lspconfig.setup_handlers()` to
                -- overrides for specific servers.
            },
        })

        require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

        lsp.setup()

        vim.diagnostic.config({
            virtual_text = true,
        })

        local cmp = require("cmp")
        local cmp_format = lsp.cmp_format({ details = true })
        local cmp_action = require("lsp-zero").cmp_action()

        cmp.setup({
            formatting = cmp_format,
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            -- mapping = cmp.mapping.preset.insert({
            --   -- scroll up and down the documentation window
            --   ['<Tab>'] = cmp_action.luasnip_supertab(),
            --   ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
            --   ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            --   ['<C-d>'] = cmp.mapping.scroll_docs(4),
            -- }),

            mapping = {
                -- `Enter` key to confirm completion
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
                ["<Tab>"] = cmp_action.luasnip_supertab(),
                ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
                -- Ctrl+Space to trigger completion menu
                ["<C-Space>"] = cmp.mapping.complete(),
                -- Navigate between snippet placeholder
                ["<C-f>"] = cmp_action.luasnip_jump_forward(),
                ["<C-b>"] = cmp_action.luasnip_jump_backward(),
                -- Scroll up and down in the completion documentation
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
        })

        -- local null_ls = require("null-ls")
        --
        -- null_ls.setup({
        --     sources = {
        --         null_ls.builtins.formatting.blue,
        --     }
        -- })
    end,
}
