return {
  "folke/snacks.nvim",
  keys = {
    {
      "<C-n>",
      function()
        local buf = vim.api.nvim_buf_get_name(0)
        local cwd = vim.fn.fnamemodify(buf, ":p:h")
        if buf == "" or vim.fn.isdirectory(cwd) == 0 then
          cwd = vim.fn.getcwd()
        end
        Snacks.explorer({ cwd = cwd })
      end,
      desc = "Toggle snacks explorer",
    },
  },
  opts = {
    picker = {
      sources = {
        explorer = {
          auto_close = true,
          layout = {
            preview = true,
          },
        },
      },
    },
  },
}
