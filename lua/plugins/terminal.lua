-- https://github.com/akinsho/toggleterm.nvim
return {
    {
        -- https://github.com/akinsho/toggleterm.nvim
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {
            open_mapping = [[<C-_>]],
            direction = "horizontal",
        },
        keys = {
            {
                "<esc>",
                "<C-\\><C-n>",
                mode = { "t" },
                desc = ""
            },
            {
                "<A-\\>",
                "<C-\\><C-n>",
                mode = { "t" },
                desc = ""
            },
            {
                "<A-Left>",
                "<C-w>h",
                mode = { "t" },
                desc = "Go to left window"
            },
            {
                "<A-Down>",
                "<C-w>j",
                mode = { "t" },
                desc = "Go to lower window"
            },
            {
                "<A-UP>",
                "<C-w>k",
                mode = { "t" },
                desc = "Go to upper window"
            },
            {
                "<A-Right>",
                "<C-w>l",
                mode = { "t" },
                desc = "Go to right window"
            },
        },
    },
}
