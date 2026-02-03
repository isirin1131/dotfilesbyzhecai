return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("cyberdream").setup({
            variant = "light",
            transparent = true,
            saturation = 1,
            italic_comments = true,
            hide_fillchars = true,
            borderless_pickers = true,
            terminal_colors = true,
            cache = false,

            highlights = {
                -- Highlight groups to override, adding new groups is also possible
                -- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values
                -- 推荐用 #00d7ff (明亮的青蓝色) 或者 #ff5f00 (明亮的橘红)
                Function = { fg = "#00d7ff", bold = true },

                -- Example:
                Comment = { fg = "#fb6d6d", bg = "NONE", italic = true },

                -- More examples can be found in `lua/cyberdream/extensions/*.lua`

                -- 2. 在这里添加 CursorLine (当前行高亮)
                -- 浅色透明背景下，建议用淡淡的灰色，或者只给一个下划线
                CursorLine = { bg = "#6f6969", underline = false }, 

                -- 3. 在这里添加 ColorColumn (第80列竖线)
                -- 用一个稍微明显一点的灰色
                ColorColumn = { bg = "#433d3d" },
                -- 建议改为更明亮的蓝色 (#5ea1ff) 或者稍微暖一点的颜色 (#df8e1d)，这样在浅色背景下对比度更高
                Directory = { fg = "#df8e1d", bold = true },
                Keyword = { fg = "#008787", bold = true }, -- 控制像 def, async, with 的颜色
            },

            -- Override colors
            colors = {
                -- For a list of colors see `lua/cyberdream/colours.lua`

                -- Override colors for both light and dark variants
                bg = "#000000",
                green = "#00ff00",

                -- If you want to override colors for light or dark variants only, use the following format:
                dark = {
                    magenta = "#ff00ff",
                    fg = "#eeeeee",
                },
                light = {
                    red = "#ff5c57",
                    cyan = "#5ef1ff",
                },
            },

            extensions = {
                telescope = true,
                notify = true,
                mini = true,
            },
        })

    end,
}