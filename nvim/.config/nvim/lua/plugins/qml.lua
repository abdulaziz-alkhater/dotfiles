return {
	-- LSP setup for qmlls

	-- Treesitter parser
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { "qmljs" })
		end,
	},

	-- Formatter: override qmlformat to NOT use stdin
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters = {
				qmlformat = {
					-- qmlformat doesn't support stdin; it needs a file path
					stdin = false,
					-- -i = edit in-place (conform reads the temp file back after)
					args = { "-i", "$FILENAME" },
					-- Preserve the .qml extension in the temp file so qmlformat handles it correctly
					tmpfile_format = ".conform.$RANDOM.$FILENAME",
				},
			},
			formatters_by_ft = {
				qml = { "qmlformat" },
			},
		},
	},
}
