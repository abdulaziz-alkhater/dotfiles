return {
	"saghen/blink.cmp",
	dependencies = {
		"giuxtaposition/blink-cmp-copilot",
	},
	opts = {
		completion = {
			menu = {
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind", gap = 1 },
						{ "source_name" },
					},
				},
			},
		},
		sources = {
			default = { "copilot", "lsp", "path", "snippets", "buffer" },
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-cmp-copilot",
					score_offset = 100,
					async = true,
				},
			},
		},
		keymap = {
			preset = "default",
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<Enter>"] = { "select_and_accept", "fallback" },
			["<C-h>"] = { "hide" },
			["<C-g>"] = { "show", "fallback" },
		},
	},
}
