return {
    "elentok/format-on-save.nvim",
    config = function()
        local format_on_save = require("format-on-save")
        local formatters = require("format-on-save.formatters")

        format_on_save.setup({
            exclude_path_patterns = {
                "/node_modules/",
                ".local/share/nvim/lazy",
            },
            formatter_by_ft = {
                tsx = formatters.prettierd,
                css = formatters.prettierd,
                html = formatters.lsp,
                java = formatters.lsp,
                javascript = formatters.lsp,
                json = formatters.lsp,
                lua = formatters.lsp,
                markdown = formatters.prettierd,
                openscad = formatters.lsp,
                python = formatters.black,
                rust = formatters.lsp,
                scad = formatters.lsp,
                scss = formatters.lsp,
                sh = formatters.shfmt,
                terraform = formatters.lsp,
                typescript = formatters.prettierd,
                typescriptreact = formatters.prettierd,
                yaml = formatters.lsp,
                -- cs = formatters.csharpier,

                cs = formatters.shell({ cmd = { "/usr/bin/dotnet format" } }),
                c = formatters.shell({ cmd = { "clang-format", "-style=file" } }),
                cpp = formatters.shell({ cmd = { "clang-format", "-style=file" } }),
            }
        })
    end
}
