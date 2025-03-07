local _ensure_installed = {
    "rust_analyzer",
    "lua_ls",
    "gopls",
    "pyright",
    "ruff",
    "yamlls", -- yaml,yaml.github yaml.gitlab,yaml.docker-compose
    "ansiblels",
    "dockerls",
    "htmx",
    "zk",
    "markdown_oxide",
}

return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v4.x",
        lazy = true,
        config = false,
    },
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = true,
    },
    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            { "L3MON4D3/LuaSnip" },
        },
        config = function()
            local cmp = require("cmp")
            local lsp = require("lsp-zero")
            local cmp_format = lsp.cmp_format({ details = true })
            local cmp_action = require("lsp-zero").cmp_action()
            cmp.setup({
                sources = {
                    { name = "nvim_lsp" },
                },
                formatting = cmp_format,
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

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
        end,
    },
    -- LSP
    {
        "neovim/nvim-lspconfig",
        cmd = { "LspInfo", "LspInstall", "LspStart" },
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
        },
        config = function()
            local lsp = require("lsp-zero")
            -- lsp_attach is where you enable features that only work
            -- if there is a language server active in the file
            local lsp_attach = function(client, bufnr)
                local opts = { buffer = bufnr }

                vim.keymap.set(
                    "n",
                    "K",
                    "<cmd>lua vim.lsp.buf.hover()<cr>",
                    opts
                )
                vim.keymap.set(
                    "n",
                    "gd",
                    "<cmd>lua vim.lsp.buf.definition()<cr>",
                    opts
                )
                vim.keymap.set(
                    "n",
                    "gD",
                    "<cmd>lua vim.lsp.buf.declaration()<cr>",
                    opts
                )
                vim.keymap.set(
                    "n",
                    "gi",
                    "<cmd>lua vim.lsp.buf.implementation()<cr>",
                    opts
                )
                vim.keymap.set(
                    "n",
                    "go",
                    "<cmd>lua vim.lsp.buf.type_definition()<cr>",
                    opts
                )
                vim.keymap.set(
                    "n",
                    "gr",
                    "<cmd>lua vim.lsp.buf.references()<cr>",
                    opts
                )
                vim.keymap.set(
                    "n",
                    "gs",
                    "<cmd>lua vim.lsp.buf.signature_help()<cr>",
                    opts
                )
                vim.keymap.set(
                    "n",
                    "<F2>",
                    "<cmd>lua vim.lsp.buf.rename()<cr>",
                    opts
                )
                vim.keymap.set(
                    { "n", "x" },
                    "<F3>",
                    "<cmd>lua vim.lsp.buf.format({async = true})<cr>",
                    opts
                )
                vim.keymap.set(
                    "n",
                    "<F4>",
                    "<cmd>lua vim.lsp.buf.code_action()<cr>",
                    opts
                )
            end
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
            lsp.extend_lspconfig({
                sign_text = true,
                lsp_attach = lsp_attach,
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
            })

            vim.diagnostic.config({
                virtual_text = true,
            })

            require("mason-lspconfig").setup({
                ensure_installed = _ensure_installed,
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({})
                    end,
                    -- -- See `:h mason-lspconfig.setup_handlers()` to
                    -- overrides for specific servers.
                    ["pyright"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.pyright.setup({
                            settings = {
                                pyright = {
                                    disableOrganizeImports = true,
                                },
                                python = {
                                    analysis = {
                                        useLibraryCodeForTypes = false,
                                        -- Desabilita pyright linter
                                        typeCheckingMode = "basic",
                                    },
                                },
                            },
                        })
                    end,
                },
            })
        end,
    },
}
