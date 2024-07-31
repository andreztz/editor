-- lista arquivos e buffers no projeto
return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            -- 'nvim-telescope/telescope-ui-select.nvim',
            -- "nvim-lua/plenary.nvim",
            -- build = "make",
            -- config = function()
            --     require("telescope").load_extension("fzf")
            --     require("telescope").load_extension("ui-select")
            -- end,
            { "nvim-lua/plenary.nvim" },
            -- {"BurntSushi/ripgrep"},
            { "nvim-telescope/telescope-fzf-native.nvim" },
            { "nvim-telescope/telescope-ui-select.nvim" },
        },
        cmd = "Telescope",
        version = false, -- usando HEAD
        keys = {
            {
                "<leader>b",
                "<cmd>Telescope buffers show_all_buffers=true<cr>",
                desc = "Switch Buffer",
            },
            {
                "<leader>f",
                "<cmd>Telescope find_files<cr>",
                desc = "Find Files",
            },
            {
                "<leader>F",
                "<cmd>Telescope live_grep<cr>",
                desc = "Live Grep",
            },
        },
    },
}
