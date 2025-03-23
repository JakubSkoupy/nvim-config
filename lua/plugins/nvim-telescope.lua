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

        telescope.setup({
            defaults = {
                mappings = {
                    n = {
                        ["<C-l"] = actions.move_selection_previous,
                        ["<C-k"] = actions.move_selection_next,

                    }
                }
            }
        })

        telescope.load_extension("fzf")
    end
}
