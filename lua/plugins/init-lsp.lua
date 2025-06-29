return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("plugins.lsp.mason")
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", "hrsh7th/cmp-nvim-lsp", "WhoIsSethDaniel/mason-tool-installer.nvim" },
        config = function()
            require("plugins.lsp.handlers")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function()
            require("plugins.lsp.servers")
        end,
    },
}
