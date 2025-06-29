local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local handlers = require("plugins.lsp.handlers")

-- Setup mason-lspconfig to ensure the servers are installed
mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",
    "pyright",
    -- add more servers here if needed
  },
})

-- Get all installed servers from mason-lspconfig
local installed_servers = mason_lspconfig.get_installed_servers()

-- Setup each installed server with default handlers
for _, server_name in ipairs(installed_servers) do
  lspconfig[server_name].setup({
    capabilities = handlers.capabilities,
  })
end

-- Override for lua_ls with custom settings
lspconfig.lua_ls.setup({
  capabilities = handlers.capabilities,
  on_attach = handlers.on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }, -- recognize `vim` global
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
      completion = {
        callSnippet = "Replace",
      },
    },
  },
})

-- Custom LSP config for jvlsp (not managed by Mason)
local configs = require("lspconfig.configs")
if not configs.jvlsp then
  configs.jvlsp = {
    default_config = {
      cmd = {
        "/home/kuba/jetveo/lsp/double_tee.sh",
        "/home/kuba/jetveo/lsp/JVLsp/sample/SampleServer/bin/Debug/net8.0/SampleServer",
        "/home/kuba/jetveo/lsp/pipe1.log",
        "/home/kuba/jetveo/lsp/pipe2.log",
      },
      filetypes = { "jvson" },
      root_dir = lspconfig.util.root_pattern(".git", "."),
    },
  }
end

lspconfig.jvlsp.setup({
  capabilities = handlers.capabilities,
  on_attach = handlers.on_attach,
})

-- Custom setup for csharp_ls
lspconfig.csharp_ls.setup({
  capabilities = handlers.capabilities,
  on_attach = handlers.on_attach,
  cmd = {
    "/home/kuba/jetveo/lsp/subserver_tee.sh",
    "/home/kuba/jetveo/lsp/omnisharp_1.log",
    "/home/kuba/jetveo/lsp/omnisharp_2.log",
  },
  filetypes = { "cs" },
})

