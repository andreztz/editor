-- https://github.com/epwalsh/obsidian.nvim
local vault = vim.fn.expand "~" .. "/Workspace/wiki"
local separator = "-"
local format = "%d" .. separator .. "%m" .. separator .. "%Y" -- %d-%m-%Y
-- define se o titulo de uma nota deve ser prefixida com a data 
local prefix = false


local create_prefix_from_timestamp = function(format)
    local timestamp = os.time()
    return os.date(format, timestamp)
end


local create_default_title = function()
    local title = ""
    for _ = 1,5 do
        title = title .. string.char(math.random(65, 90))
    end
    return title
end


local sanitize_user_title = function(title)
    title = title:gsub(" ", separator):gsub("[^A-Za-z0-9]", "_"):lower()
    return title
end


local create_note_id = function(title)

    local date = create_prefix_from_timestamp(format)

    if title ~= nil then
        title = sanitize_user_title(title)
    else
        title = create_default_title()
    end

    if prefix then
        return date .. separator .. title
    end
    return title .. separator .. date
end


return {
    "epwalsh/obsidian.nvim",
    lazy = true,
    -- event = { "BufReadPre " .. vault .. "/**.md" },
    event = { "BufEnter " .. vault },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        dir = vault,
        -- notes_subdir = "notes",
        daily_notes = {
            folder = "notes/dailies",
            date_format = "%d-%m-%Y"
        },
        note_id_func = create_note_id,
        templates = {
            subdir = "templates",
            date_format = "%d-%m-%Y-%a",
            time_format = "%H:%M"
        },
    },
    config = function(_, opts)
        require("obsidian").setup(opts)
        vim.keymap.set("n", "gf", function()
            if require("obsidian").util.cursor_on_markdown_link() then
                return "<cmd>ObsidianFollowLink<CR>"
            else
                return "gf"
            end
        end, { noremap = false, expr = true })
    end,
}
