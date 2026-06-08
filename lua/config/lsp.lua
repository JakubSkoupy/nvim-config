vim.lsp.config('*', {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
    callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = 'Show LSP references'
        vim.keymap.set('n', 'gR', '<cmd>Telescope lsp_references<CR>', opts)

        opts.desc = 'Go to declaration'
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

        opts.desc = 'Show LSP definitions'
        vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)

        opts.desc = 'Show LSP implementations'
        vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)

        opts.desc = 'Show LSP type definitions'
        vim.keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts)

        opts.desc = 'See available code actions'
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)

        opts.desc = 'Smart rename'
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

        opts.desc = 'Show buffer diagnostics'
        vim.keymap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts)

        opts.desc = 'Show line diagnostics'
        vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)

        opts.desc = 'Go to previous diagnostic'
        vim.keymap.set('n', '<C-I>', function() vim.diagnostic.jump({ count = -1 }) end, opts)

        opts.desc = 'Go to next diagnostic'
        vim.keymap.set('n', '<C-O>', function() vim.diagnostic.jump({ count = 1 }) end, opts)

        opts.desc = 'Go to previous error'
        vim.keymap.set('n', '<C-S-I>', function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR }) end, opts)

        opts.desc = 'Go to next error'
        vim.keymap.set('n', '<C-S-O>', function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR }) end, opts)

        opts.desc = 'Show documentation for what is under cursor'
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

        opts.desc = 'Restart LSP'
        vim.keymap.set('n', '<leader>rs', '<cmd>lua vim.lsp.stop_client(vim.lsp.get_clients())<CR>', opts)

        vim.keymap.set('n', '<leader>go', '<cmd>Telescope lsp_document_symbols<CR>', opts)
        vim.keymap.set('n', '<leader>gO', '<cmd>Telescope lsp_workspace_symbols<CR>', opts)
    end,
})

vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim' } },
            workspace = { library = vim.api.nvim_get_runtime_file('', true) },
            telemetry = { enable = false },
            completion = { callSnippet = 'Replace' },
        },
    },
})

vim.lsp.config('pyright', {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'pyrightconfig.json', '.git' },
})

vim.lsp.config('kotlin_language_server', {
    cmd = { 'kotlin-language-server' },
    filetypes = { 'kotlin' },
    root_markers = { 'build.gradle', 'build.gradle.kts', 'settings.gradle', '.git' },
    settings = {
        kotlin = {
            compiler = { jvm = { target = '26' } },
        },
    },
})

vim.lsp.config('jvlsp', {
    cmd = {
        '/home/kuba/jetveo/lsp/double_tee.sh',
        '/home/kuba/jetveo/lsp/JVLsp/sample/SampleServer/bin/Debug/net8.0/SampleServer',
        '/home/kuba/jetveo/lsp/pipe1.log',
        '/home/kuba/jetveo/lsp/pipe2.log',
    },
    filetypes = { 'jvson' },
    root_markers = { '.git' },
})

vim.lsp.config('glsl_analyzer', {
    cmd = { '/home/kuba/clones/glsl_analyzer/zig-out/bin/glsl_analyzer' },
    filetypes = { 'glsl' },
    root_markers = { '.git' },
})

vim.lsp.config('tinymist', {
    cmd = { 'tinymist' },
    filetypes = { 'typst' },
    root_markers = { '.git' },
})

vim.lsp.enable({ 'lua_ls', 'pyright', 'kotlin_language_server', 'jvlsp', 'glsl_analyzer', 'tinymist' })
