return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            render_modes = { 'n', 'c', 't' },
            code = {
                enabled = true,
                render_modes = false,
                sign = true,
                style = 'block',
                position = 'left',
                language_pad = 0,
                language_icon = true,
                language_name = true,
                disable_background = { 'diff' },
                width = 'full',
                left_margin = 0,
                left_pad = 0,
                right_pad = 0,
                min_width = 0,
                border = 'hide',
                above = '▄',
                below = '▀',
                inline_left = '',
                inline_right = '',
                inline_pad = 0,
                highlight = 'RenderMarkdownCode',
                highlight_language = nil,
                highlight_border = 'RenderMarkdownCodeBorder',
                highlight_fallback = 'RenderMarkdownCodeFallback',
                highlight_inline = 'RenderMarkdownCodeInline',
            },
        },
    }
}
