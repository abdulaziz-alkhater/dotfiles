return {
  "yetone/avante.nvim",
  opts = {
    provider = "lmstudio_qwen",
    providers = {
      lmstudio_qwen = {
        __inherited_from = "openai",
        api_key_name = "LM_STUDIO_API_KEY",
        endpoint = "http://192.168.1.212:1234/v1",
        model = "nqwen/qwen3-coder-30b",
        timeout = 30000,
        extra_request_body = {
          temperature = 0.7,
          max_tokens = 8192,
        },
      },
      lmstudio_nematron = {
        __inherited_from = "openai",
        api_key_name = "LM_STUDIO_API_KEY",
        endpoint = "http://192.168.1.212:1234/v1",
        model = "nvidia/nemotron-3-nano",
        timeout = 30000,
        extra_request_body = {
          temperature = 0.7,
          max_tokens = 8192,
        },
      },
      deepseek = {
        __inherited_from = "openai",
        api_key_name = "DEEPSEEK_API_KEY",
        endpoint = "https://api.deepseek.com",
        model = "deepseek-coder",
        timeout = 30000,
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 8192,
        },
      },
    },
  },
}
