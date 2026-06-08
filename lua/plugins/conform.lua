return {
	"stevearc/conform.nvim",

	event = { "BufWritePre" },

	opts = {
		notify_on_error = true,

		format_on_save = {
			timeout_ms = 1000,
			lsp_fallback = false,
		},

		formatters = {
			csharpier = {
				command = "csharpier", -- or "dotnet"
				stdin = true,
			},

			-- If using local dotnet tool instead:
			-- csharpier = {
			--   command = "dotnet",
			--   args = { "csharpier", "--write-stdout" },
			--   stdin = true,
			-- },
		},

		formatters_by_ft = {
			lua = { "stylua" },
			cs = { "csharpier" },
			py = { "black" },
			haskell = { "ormolu" },
			typst = { "typstyle" },
		},
	},
}
