-- https://github.com/epwalsh/obsidian.nvim
local vault = vim.fn.expand "~" .. "/Sandbox/notebox"


local create_prefix_from_timestamp = function(format)
    local timestamp = os.time()
    return os.date(format, timestamp)
end


local create_note_id = function(title)
    local separator = "-"
    local format = "%d" .. separator .. "%m" .. separator .. "%Y" -- %d-%m-%Y
    local prefix = create_prefix_from_timestamp(format)
    local suffix = ""
    if title ~= nil then
        title = title:gsub(" ", separator):gsub("[^A-Za-z0-9]", "_"):lower()
        else
        for _ = 1,4 do
            title = suffix .. string.char(math.random(65, 90))
        end
    end
    return prefix .. separator .. title
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
