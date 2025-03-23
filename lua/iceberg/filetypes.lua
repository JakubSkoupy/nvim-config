vim.filetype.add({
    extension = {
        jvson = "jvson",
    },
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.jvson",
    callback = function()
        vim.bo.filetype = "jvson"
    end,
})


