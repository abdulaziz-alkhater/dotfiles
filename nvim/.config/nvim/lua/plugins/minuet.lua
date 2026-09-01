return {
  "milanglacier/minuet-ai.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = function()
    return {
      provider = "openai_fim_compatible",
      request_timeout = 5,
      throttle = 1500,
      debounce = 600,
      provider_options = {
        openai_fim_compatible = {
          api_key = "DEEPSEEK_API_KEY",
          name = "deepseek",
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
