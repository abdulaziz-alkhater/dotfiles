return {
  "saghen/blink.cmp",
  dependencies = {
    "milanglacier/minuet-ai.nvim",
  },
  opts = {
    completion = {
      menu = {
        draw = {
          columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 }, { "source_name" } },
        },
      },
    },
    sources = {
      default = { "minuet", "lsp", "path", "snippets", "buffer" },
      providers = {
        minuet = {
          name = "minuet",
          module = "minuet.blink",
          score_offset = 100,
        },
      },
    },
    keymap = {
      preset = "default",
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<Enter>"] = { "select_and_accept", "fallback" },
      ["<C-h>"] = { "hide" },
    },
  },
}
