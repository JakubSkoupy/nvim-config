require("mason-nvim-dap").setup({
    ensure_installed = {
        "codelldb", -- C, C++
        "python", -- Python
        "node2", -- JavaScript, TypeScript
        -- add others as needed
    },
    automatic_installation = true,
})

