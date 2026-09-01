return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    -- Build parsers from source instead of downloading prebuilt binaries.
    -- Prebuilt macOS binaries from GitHub often have invalid ad-hoc code
    -- signatures on Apple Silicon, causing nvim to be killed with
    -- "Code Signature Invalid" when a parser is loaded.
    prefer_git = true,
  },
}
