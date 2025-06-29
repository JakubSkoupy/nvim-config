return {
    'nvim-telescope/telescope.nvim',
    -- tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
        'nvim-telescope/telescope-fzf-native.nvim',
        'nvim-tree/nvim-web-devicons',
    },

    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        -- Jump back
        vim.api.nvim_set_keymap('n', 'b','<Cmd>normal! <C-o><CR>', { noremap = true, silent = true })

        -- Jump forward
        vim.api.nvim_set_keymap('n', 'B', '<Cmd>normal! <C-i><CR>', { noremap = true, silent = true })

        -- Jump list
        vim.api.nvim_set_keymap('n', '<Leader>jh', ":Telescope jumplist<CR>", { noremap = true, silent = true })

        telescope.setup({
            defaults = {
                mappings = {
                    n = {
                        ["<C-l"] = actions.move_selection_previous,
                        ["<C-k"] = actions.move_selection_next,

                    }
                },
                pickers = {
                    jumplist = {
                        theme = "dropdown", -- Or "ivy" or "cursor"
                        previewer = false,  -- Disable preview (you might want it enabled)
                    }
                },
            }
        })

        telescope.load_extension("fzf")
    end
}
