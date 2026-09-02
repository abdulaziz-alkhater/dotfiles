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
      after_cursor_filter_length = 1,
      before_cursor_filter_length = 1,
      provider_options = {
        openai_fim_compatible = {
          -- Local server on the LAN; no real API key required.
          api_key = function()
            return "dummy"
          end,
          name = "codestral",
          end_point = "http://dagobah.bbk:1234/v1/completions",
          model = "mistralai/codestral-22b-v0.1",
          optional = {
            max_tokens = 256,
            top_p = 0.9,
          },
        },
      },
      -- Use Minuet through blink.cmp instead of inline virtual text.
      virtualtext = {
        auto_trigger_ft = {},
      },
    }
  end,
}
