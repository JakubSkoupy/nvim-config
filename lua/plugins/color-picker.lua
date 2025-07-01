return {
    "ziontee113/color-picker.nvim",
    config = function()
        require("color-picker").setup({ -- for changing icons & mappings
            -- ["icons"] = { "ﱢ", "" },
            -- ["icons"] = { "ﮊ", "" },
            -- ["icons"] = { "", "ﰕ" },
            -- ["icons"] = { "", "" },
            -- ["icons"] = { "", "" },
            ["icons"] = { "ﱢ", "" },
            ["border"] = "rounded", -- none | single | double | rounded | solid | shadow
            ["keymap"] = {          -- mapping example:
                ["j"] = "<Plug>ColorPickerSlider1Decrease",
                [";"] = "<Plug>ColorPickerSlider1Increase",
                ["m"] = "<Plug>ColorPickerChangeColorMode",
                ["k"] = "j",
                ["l"] = "k",
            },
            ["background_highlight_group"] = "Normal",  -- default
            ["border_highlight_group"] = "FloatBorder", -- default
            ["text_highlight_group"] = "Normal",        --default
        })
        -- Map a key to open the picker
        vim.api.nvim_set_keymap(
            "n",
            "<leader>cp",
            "<cmd>PickColor<cr>",
            { noremap = true, silent = true, desc = "Open color picker" }
        )
    end,
}
-- vim.api.nvim_set_keymap('m', ';', '<Plug>ColorPickerSlider1Increase', { noremap = false, silent = true })
