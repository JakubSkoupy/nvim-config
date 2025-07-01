return {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = { -- set to setup table

    },
    config = function()
        require("colorizer").setup({
            filetypes = { "*" },          -- Filetype options.  Accepts table like `user_default_options`
            buftypes = {},                -- Buftype options.  Accepts table like `user_default_options`
            -- Boolean | List of usercommands to enable.  See User commands section.
            user_commands = true,         -- Enable all or some usercommands
            lazy_load = false,            -- Lazily schedule buffer highlighting setup function
            user_default_options = {
                names = true,             -- "Name" codes like Blue or red.  Added from `vim.api.nvim_get_color_map()`
                names_opts = {            -- options for mutating/filtering names.
                    lowercase = true,     -- name:lower(), highlight `blue` and `red`
                    camelcase = true,     -- name, highlight `Blue` and `Red`
                    uppercase = false,    -- name:upper(), highlight `BLUE` and `RED`
                    strip_digits = false, -- ignore names with digits,
                    -- highlight `blue` and `red`, but not `blue3` and `red4`
                },
                -- Expects a table of color name to #RRGGBB value pairs.  # is optional
                -- Example: { cool = "#107dac", ["notcool"] = "ee9240" }
                -- Set to false to disable, for example when setting filetype options
                names_custom = false,     -- Custom names to be highlighted: table|function|false
                RGB = true,               -- #RGB hex codes
                RGBA = true,              -- #RGBA hex codes
                RRGGBB = true,            -- #RRGGBB hex codes
                RRGGBBAA = false,         -- #RRGGBBAA hex codes
                AARRGGBB = false,         -- 0xAARRGGBB hex codes
                rgb_fn = false,           -- CSS rgb() and rgba() functions
                hsl_fn = false,           -- CSS hsl() and hsla() functions
                css = false,              -- Enable all CSS *features*:
                -- names, RGB, RGBA, RRGGBB, RRGGBBAA, AARRGGBB, rgb_fn, hsl_fn
                css_fn = false,           -- Enable all CSS *functions*: rgb_fn, hsl_fn
                -- Tailwind colors.  boolean|'normal'|'lsp'|'both'.  True sets to 'normal'
                tailwind = false,         -- Enable tailwind colors
                tailwind_opts = {         -- Options for highlighting tailwind names
                    update_names = false, -- When using tailwind = 'both', update tailwind names from LSP results.  See tailwind section
                },
                -- parsers can contain values used in `user_default_options`
                sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
                -- Highlighting mode.  'background'|'foreground'|'virtualtext'
                mode = "background",                            -- Set the display mode
                -- Virtualtext character to use
                virtualtext = "■",
                -- Display virtualtext inline with color.  boolean|'before'|'after'.  True sets to 'after'
                virtualtext_inline = false,
                -- Virtualtext highlight mode: 'background'|'foreground'
                virtualtext_mode = "foreground",
                -- update color values even if buffer is not focused
                -- example use: cmp_menu, cmp_docs
                always_update = false,
                -- hooks to invert control of colorizer
                hooks = {
                    -- called before line parsing.  Accepts boolean or function that returns boolean
                    -- see hooks section below
                    disable_line_highlight = false,
                },
            },
        })
    end
}

--[[ return {
    "brenoprata10/nvim-highlight-colors",
    config = function()
        require('nvim-highlight-colors').setup({
            ---Render stylecolorcolor
            ---@usage 'background'|'foreground'|'virtual'
            render = 'background',

            ---Set virtual symbol (requires render to be set to 'virtual')
            virtual_symbol = '■',

            ---Set virtual symbol suffix (defaults to '')
            virtual_symbol_prefix = '',

            ---Set virtual symbol suffix (defaults to ' ')
            virtual_symbol_suffix = ' ',

            ---Set virtual symbol position()
            ---@usage 'inline'|'eol'|'eow'
            ---inline mimics VS Code style
            ---eol stands for `end of column` - Recommended to set `virtual_symbol_suffix = ''` when used.
            ---eow stands for `end of word` - Recommended to set `virtual_symbol_prefix = ' ' and virtual_symbol_suffix = ''` when used.
            virtual_symbol_position = 'inline',

            ---Highlight hex colors, e.g. '#FFFFFF'
            enable_hex = true,

            ---Highlight short hex colors e.g. '#fff'
            enable_short_hex = true,

            ---Highlight rgb colors, e.g. 'rgb(0 0 0)'
            enable_rgb = true,

            ---Highlight hsl colors, e.g. 'hsl(150deg 30% 40%)'
            enable_hsl = true,

            ---Highlight ansi colors, e.g '\033[0;34m'
            enable_ansi = true,

            -- Highlight hsl colors without function, e.g. '--foreground: 0 69% 69%;'
            enable_hsl_without_function = true,

            ---Highlight CSS variables, e.g. 'var(--testing-color)'
            enable_var_usage = true,

            ---Highlight named colors, e.g. 'green'
            enable_named_colors = true,

            ---Highlight tailwind colors, e.g. 'bg-blue-500'
            enable_tailwind = false,

            ---Set custom colors
            ---Label must be properly escaped with '%' to adhere to `string.gmatch`
            --- :help string.gmatch
            custom_colors = {
                { label = '%-%-theme%-primary%-color',   color = '#0f1219' },
                { label = '%-%-theme%-secondary%-color', color = '#5a5d64' },
            },

            -- Exclude filetypes or buftypes from highlighting e.g. 'exclude_buftypes = {'text'}'
            exclude_filetypes = {},
            exclude_buftypes = {},
            -- Exclude buffer from highlighting e.g. 'exclude_buffer = function(bufnr) return vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr)) > 1000000 end'
            exclude_buffer = function(bufnr) end
        })
    end
} ]]
