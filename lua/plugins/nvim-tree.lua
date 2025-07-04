return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {}
        vim.keymap.set("n", "<leader>tr", vim.cmd.NvimTreeToggle)
        vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeFocus)
    end
}