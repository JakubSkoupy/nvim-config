return {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        { "kevinhwang91/promise-async" },
        { "neovim/nvim-lspconfig" },
    },
    config = function()
        vim.o.foldcolumn = '1' -- '0' is not bad
        vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        -- Ensure `ufo` is available
        local ufo = require('ufo')
        vim.keymap.set('n', 'zR', ufo.openAllFolds)
        vim.keymap.set('n', 'zM', ufo.closeAllFolds)
        vim.keymap.set('n', 'L', ufo.peekFoldedLinesUnderCursor)

        local function foldToggle()
            -- Check if the current line is folded
            if vim.fn.foldclosed('.') ~= -1 then
                -- If the line is folded, open it
                vim.cmd('foldopen')
            else
                -- If the line is not folded, close it
                vim.cmd('foldclose')
            end
        end

        -- Map the function to a keybinding, for example, `zz`
        vim.keymap.set('n', 'ZZ', foldToggle, { desc = 'Toggle fold under cursor' })

        -- Add foldingRange to LSP capabilities
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        }

        -- Ensure `lspconfig` is available
        local lspconfig = require('lspconfig')
        local language_servers = lspconfig.util.available_servers()
        for _, ls in ipairs(language_servers) do
            lspconfig[ls].setup({
                capabilities = capabilities,
                -- Add other configurations as needed
            })
        end

        -- Final setup for ufo
        ufo.setup()
    end,
}
