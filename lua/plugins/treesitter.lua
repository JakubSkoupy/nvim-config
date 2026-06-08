return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    branch = 'main',
    config = function()
        require('nvim-treesitter').setup({
            highlight = { enable = true },
            ensure_installed = { 'wgsl', 'typst' },
        })
    end,
}
