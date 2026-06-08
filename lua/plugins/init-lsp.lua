return {
    {
        'williamboman/mason.nvim',
        build = ':MasonUpdate',
        opts = {
            ui = {
                icons = {
                    package_installed = '✓',
                    package_pending = '➜',
                    package_uninstalled = '✗',
                },
            },
        },
    },
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        dependencies = { 'williamboman/mason.nvim' },
        opts = {
            ensure_installed = {
                'prettier', 'stylua', 'isort', 'black', 'pylint', 'eslint_d',
                'lua-language-server', 'pyright', 'kotlin-language-server',
            },
        },
    },
    {
        'hrsh7th/cmp-nvim-lsp',
        lazy = false,
    },
}
