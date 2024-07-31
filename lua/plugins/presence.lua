local config = {
    logo = "auto", -- "auto" or url
    logo_tooltip = nil, -- nil or string
    main_image = "language", -- "language" or "logo"
    client_id = "1157438221865717891",
    log_level = nil,
    debounce_timeout = 10,
    blacklist = {},
    file_assets = {},
    show_time = true, -- Show the timer
    global_timer = false,

    editing_text = "Editing ...",
    file_explorer_text = "Browsing ...",
    git_commit_text = "Committing changes",
    plugin_manager_text = "Managing plugins",
    reading_text = "Reading ...",
    workspace_text = "Working on ...",
    line_number_text = "Line %s out of %s",
    terminal_text = "Using Terminal",
}

return {
    {
        "IogaMaster/neocord",
        event = "VeryLazy",
        config = function()
            require("neocord").setup(config)
        end,
    },
}
