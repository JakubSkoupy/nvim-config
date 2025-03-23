return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim",                   opts = {} },
    },
    config = function()
        -- import lspconfig plugin
        local lspconfig = require("lspconfig")

        -- import mason_lspconfig plugin
        local mason_lspconfig = require("mason-lspconfig")

        -- import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap -- for conciseness

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }

                -- set keybinds
                opts.desc = "Show LSP references"
                keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

                opts.desc = "Go to declaration"
                keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

                opts.desc = "Show LSP definitions"
                keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

                opts.desc = "Show LSP implementations"
                keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

                opts.desc = "Show LSP type definitions"
                keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

                opts.desc = "See available code actions"
                keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

                opts.desc = "Smart rename"
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

                opts.desc = "Show buffer diagnostics"
                keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

                opts.desc = "Show line diagnostics"
                keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

                opts.desc = "Go to previous diagnostic"
                keymap.set("n", "<C-I>", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

                opts.desc = "Go to next diagnostic"
                keymap.set("n", "<C-O>", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

                opts.desc = "Show documentation for what is under cursor"
                keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

                keymap.set("n", "<leader>go", "<cmd>Telescope lsp_document_symbols<cr>")
            end,
        })



        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end



        --- MASON -----------------------------------------------------------

        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({ capabilities = capabilities, })
            end,

            ["lua_ls"] = function()
                -- configure lua server (with special settings)
                lspconfig["lua_ls"].setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            -- make the language server recognize "vim" global
                            diagnostics = {
                                globals = { "vim" },
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                })
            end,
        })

        --- MANUAL CONFIGS ---------------------------------------------------

        local configs = require("lspconfig.configs")

        configs.jvlsp = {
            default_config = {
                filetypes = { "jvson", }, -- Filetypes for the custom LSP
                root_dir = lspconfig.util.root_pattern(".git", "."),
                cmd = { "/home/kuba/jetveo/lsp/double_tee.sh", "/home/kuba/jetveo/lsp/JVLsp/sample/SampleServer/bin/Debug/net8.0/SampleServer", "/home/kuba/jetveo/lsp/pipe1.log", "/home/kuba/jetveo/lsp/pipe2.log" },
            },
        }


        lspconfig.jvlsp.setup({
            -- cmd = { "/home/kuba/jetveo/lsp/double_tee.sh", "/home/kuba/jetveo/lsp/JVLsp/bin/Debug/net8.0/JVLsp", "/home/kuba/jetveo/lsp/pipe1.log", "/home/kuba/jetveo/lsp/pipe2.log" },
            -- cmd = { "/home/kuba/jetveo/lsp/double_tee.sh", "/home/kuba/clones/csharp-language-server-protocol/sample/SampleServer/bin/Debug/net8.0/SampleServer", "/home/kuba/jetveo/lsp/pipe1.log", "/home/kuba/jetveo/lsp/pipe2.log" },
            cmd = { "/home/kuba/jetveo/lsp/double_tee.sh", "/home/kuba/jetveo/lsp/JVLsp/sample/SampleServer/bin/Debug/net8.0/SampleServer", "/home/kuba/jetveo/lsp/pipe1.log", "/home/kuba/jetveo/lsp/pipe2.log" },
            -- cmd = { "/home/kuba/clones/csharp-language-server-protocol/sample/SampleServer/bin/Debug/net8.0/SampleServer" },
            filetypes = { "jvson" },                     -- Ensure `jvson` and `csv` are recognized
            root_dir = lspconfig.util.root_pattern("."), -- Define how to find the project root
            capabilities = capabilities,
            on_attach = function(client, bufnr)
                -- Custom on_attach logic
                local opts = { buffer = bufnr, silent = true }
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            end,
        })

        --[[ require'lspconfig'.omnisharp.setup {
            cmd = { "/home/kuba/jetveo/lsp/subserver_tee.sh", "/home/kuba/jetveo/lsp/omnisharp_1.log", "/home/kuba/jetveo/lsp/omnisharp_2.log"},

            settings = {
              FormattingOptions = {
                -- Enables support for reading code style, naming convention and analyzer
                -- settings from .editorconfig.
                EnableEditorConfigSupport = true,
                -- Specifies whether 'using' directives should be grouped and sorted during
                -- document formatting.
                OrganizeImports = nil,
              },
              MsBuild = {
                -- If true, MSBuild project system will only load projects for files that
                -- were opened in the editor. This setting is useful for big C# codebases
                -- and allows for faster initialization of code navigation features only
                -- for projects that are relevant to code that is being edited. With this
                -- setting enabled OmniSharp may load fewer projects and may thus display
                -- incomplete reference lists for symbols.
                LoadProjectsOnDemand = nil,
              },
              RoslynExtensionsOptions = {
                -- Enables support for roslyn analyzers, code fixes and rulesets.
                EnableAnalyzersSupport = nil,
                -- Enables support for showing unimported types and unimported extension
                -- methods in completion lists. When committed, the appropriate using
                -- directive will be added at the top of the current file. This option can
                -- have a negative impact on initial completion responsiveness,
                -- particularly for the first few completion sessions after opening a
                -- solution.
                EnableImportCompletion = nil,
                -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
                -- true
                AnalyzeOpenDocumentsOnly = nil,
              },
              Sdk = {
                -- Specifies whether to include preview versions of the .NET SDK when
                -- determining which version to use for project loading.
                IncludePrereleases = true,
              },
            }
        } ]]

        require 'lspconfig'.csharp_ls.setup {
            cmd = { "/home/kuba/jetveo/lsp/subserver_tee.sh", "/home/kuba/jetveo/lsp/omnisharp_1.log", "/home/kuba/jetveo/lsp/omnisharp_2.log" },
            filetypes = { "cs" }
        }
    end,
}
