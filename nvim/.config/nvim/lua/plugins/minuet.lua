return {
  "milanglacier/minuet-ai.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = function()
    return {
      provider = "openai_fim_compatible",
      request_timeout = 5,
      throttle = 1500,
      debounce = 600,
      -- Trim completion text that duplicates what is already around the cursor
      -- (e.g. an extra `}` or `;`). Defaults are 0 for FIM providers, which
      -- disables this filtering entirely.
      after_cursor_filter_length = 0,
      before_cursor_filter_length = 0,
      provider_options = {
        openai_fim_compatible = {
          -- Set DEEPSEEK_API_KEY in your environment.
          api_key = "DEEPSEEK_API_KEY",
          name = "deepseek",
          end_point = "https://api.deepseek.com/beta/completions",
          model = "deepseek-chat",
          optional = {
            max_tokens = 256,
            top_p = 0.9,
          },
        },
      },
      -- Use Minuet through blink.cmp instead of inline virtual text.
      -- virtualtext = {
      --   auto_trigger_ft = {},
      -- },
    }
  end,
}
