-- https://github.com/0x00-ketsu/maximizer.nvim
return {
    "andreztz/maximizer.nvim",
    keys = {
        {
            "<A-\\>",
            "<cmd>lua require('maximizer').toggle()<cr>",
            mode = { "n" },
            desc = "",
        },
    },
}
