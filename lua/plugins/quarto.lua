-- plugins/quarto.lua
return {
	{
		"quarto-dev/quarto-nvim",
		dependencies = {
			"jmbuhr/otter.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("otter").setup({
				handle_leading_whitespace = true,
			})

			require("quarto").setup({
				lspFeatures = {
					enabled = true,
					languages = { "r" },
					chunks = "curly",
					diagnostics = {
						enabled = true,
						triggers = { "BufWritePost" },
					},
					completion = {
						enabled = true,
					},
				},
			})
		end,
	},
}
