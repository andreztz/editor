local HOME = vim.fn.expand("~/Notebooks")
-- https://github.com/renerocksai/telekasten.nvim/wiki/Configuration

return {
    'renerocksai/telekasten.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    opts = {
        home              = HOME,
        take_over_my_home = true,
        dailies           = HOME .. '/' .. 'daily',
        weeklies          = HOME .. '/' .. 'weekly',
        templates         = HOME .. '/' .. 'templates',
        image_subdir      = "img",
    },
    keys = {
        {
            "<leader>z",
            "<cmd>lua require('telekasten').panel()<cr>",
            mode = { "n" },
            desc = "Telekasten command pallet"
        },
        {
            "<leader>zn",
            "<cmd>lua require('telekasten').new_note()<cr>",
            mode = { "n" },
            desc = "Telekasten create new note"
        },
        {
            "<leader>zt",
            "<cmd>lua require('telekasten').toggle_todo()<cr>",
            mode = { "n" },
            desc = "Telekasten toggle todo"
        },


    }
}
