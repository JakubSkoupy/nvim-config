return {
    "EdenEast/nightfox.nvim",
    config = function()
        require("nightfox").setup({
            palettes = {
                nordfox = {
                    bg1 = "#1e2127",
                },
            },
        })

        vim.cmd.colorscheme("nordfox")
    end,
}
