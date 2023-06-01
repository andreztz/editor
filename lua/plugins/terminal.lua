-- TODO:  
-- Fix: mudar de janela usando teclas A-Left, A-Right, A-Up e A-Down
return {
    {
        -- https://github.com/akinsho/toggleterm.nvim
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {
            --[[ things you want to change go here]]
            open_mapping = [[<A-\>]],
            direction = "float",
        },
        keys = {
            {
                "<A-Left>", 
                "<C-w>h", 
                mode={"t"}, desc="Go to left window"
            },
            {
                "<A-Down>",
                "<C-w>j",
                mode={"t"}, desc="Go to lower window"
            },
            {
                "<A-UP>",
                "<C-w>k", 
                mode={"t"}, desc="Go to upper window"
            },
            {
                "<A-Right>",
                "<C-w>l",
                mode={"t"}, desc="Go to right window"
            },
        },
    },
}

