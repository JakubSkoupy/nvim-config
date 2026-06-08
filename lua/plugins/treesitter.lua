return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    opts = {
        highlight = { enable = true },
        ensure_installed = {
            "wgsl",
        },
    },

    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)

        -- Optional but often needed for WGSL
        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

        parser_config.wgsl = {
            install_info = {
                url = "https://github.com/szebniok/tree-sitter-wgsl",
                files = { "src/parser.c" },
                branch = "main",
            },
            filetype = "wgsl",
        }
    end,
}
