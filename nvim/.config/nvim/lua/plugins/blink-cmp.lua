return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = {
        draw = {
          columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 }, { "source_name" } },
        },
      },
      trigger = {
        prefetch_on_insert = false,
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
