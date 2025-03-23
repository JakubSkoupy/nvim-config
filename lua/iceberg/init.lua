require("iceberg.remap")
require("iceberg.set")

function OpenMarkdownPreview(url)
    vim.fn.execute('silent !firefox --new-window ' .. url)
end

vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
