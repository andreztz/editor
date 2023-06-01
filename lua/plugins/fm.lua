return {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    keys = {
        { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
    config = function(_, opts)
        local fm = require("neo-tree")
        fm.setup(opts)
    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    opts = {
        window = {
            position = "left",
            width = 20,
            mappings = {
                ["<space>"] = "none",
            },
        },
    },
    deactivate = function()
        vim.cmd([[Neotree close]])
    end,
    init = function()
        require("neo-tree")
    end,
}
