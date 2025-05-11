local set_transparency = function()
    vim.cmd [[
        hi Normal guibg=NONE ctermbg=NONE
        hi NormalNC guibg=NONE ctermbg=NONE
        hi EndOfBuffer guibg=NONE ctermbg=NONE
    ]]
end

local set_default_theme = function()
    local theme = vim.g.colors_name
    vim.cmd("colorscheme " .. theme)
end


local set_theme = function(theme, transparency)
    if type(transparency) ~= "boolean" then
        error("The 'transparency' parameter must be boolean type")
    end

    if theme and theme ~= "" then
        vim.cmd("colorscheme " .. theme)
    else
        vim.cmd("colorscheme tokyonight")
    end

    if transparency then
        set_transparency()
    else
        set_default_theme()
    end
end

vim.api.nvim_create_user_command("TransparentEnable", function()
    set_transparency()
end, { desc = "Enable Transparency" })

vim.api.nvim_create_user_command("TransparentDisable", function()
    set_default_theme()
end, { desc = "Disable Transparency" })


return { set = set_theme }
