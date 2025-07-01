return {
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
        require('bufferline').setup({
            options = {
                height = 1,
                always_show_bufferline = false,

                style_preset = {
                    require('bufferline').style_preset.no_italic,
                    require('bufferline').style_preset.no_bold
                },
                -- Don't show close buttons
                show_close_icon = false,
                show_buffer_close_icons = false,

                -- Disable mouse clicks
                -- This disables clickable tabs completely
                clickable = true,

                -- Keep the offset to 0 (e.g. if using a sidebar)
                offsets = {},

                -- Numbers for buffers (optional)
                numbers = "ordinal", -- or "none", "buffer_id"

                -- Separator style (cleaner look)
                separator_style = "thin",

                enforce_regular_tabs = false,
                tabpages = true,

                persist_buffer_sort = true, -- keep buffer order across sessions (optional)
            }
        })

        -- Jump binds
        for i = 1, 9 do
            vim.keymap.set("n", "<leader>" .. i, function()
                require("bufferline").go_to_buffer(i, true)
            end, { noremap = true, silent = true })
        end

        -- Delete binds
        for i = 1, 9 do
            vim.keymap.set("n", "<leader>d" .. i, function()
                require("bufferline.commands").close_buffer(nil, i)
            end, { noremap = true, silent = true })
        end

        vim.keymap.set("n", "<leader>bb", "<cmd>BufferLinePick<CR>", { desc = "Pick buffer by letter" })
        vim.keymap.set('n', '<leader>pp', ':BufferLineTogglePin<CR>', { desc = 'Toggle pin buffer' })

        vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true })
    end
}
