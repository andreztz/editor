return {
    "stevearc/conform.nvim",
    init = function()
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function(args)
                require("conform").format({ bufnr = args.buf })
            end,
        })
    end,
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "ruff_fix" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    },
}
