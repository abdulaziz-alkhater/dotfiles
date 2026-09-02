-- Ciapre — Neovim colorscheme matching the Ciapre kitty theme
-- Palette from ~/.config/kitty/dark-theme.auto.conf (kitty-themes/Ciapre.conf)

local c = {
  bg = "#181c27",
  bg_dark = "#13161f", -- inactive_tab_background
  bg_sel = "#172539", -- selection_background
  fg = "#ada37a",
  cursor = "#91805a",
  black = "#181818", -- color0
  gray = "#555555", -- color8
  red = "#800009", -- color1
  br_red = "#ab3834", -- color9
  green = "#48513b", -- color2
  br_green = "#a6a65d", -- color10
  yellow = "#cc8a3e", -- color3
  br_yellow = "#dcde7b", -- color11
  blue = "#566d8c", -- color4
  br_blue = "#2f97c6", -- color12
  magenta = "#724c7c", -- color5
  br_magenta = "#d33060", -- color13
  brown = "#5b4f4a", -- color6
  cream = "#f3dab1", -- color14
  white = "#ada37e", -- color7
  fg_bright = "#f3f3f3", -- color15
}

-- Subtle background blends (palette color ~15% over bg) for diagnostics/diff
local blend = {
  error_bg = "#2c1f29",
  warn_bg = "#322c2c",
  info_bg = "#1b2e3e",
  hint_bg = "#212834",
  add_bg = "#242e24",
  change_bg = "#21293a",
  delete_bg = "#331f1f",
  text_bg = "#1f4157",
}

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.g.colors_name = "ciapre"

-- Match :terminal to the kitty palette
vim.g.terminal_color_background = c.bg
vim.g.terminal_color_foreground = c.fg
vim.g.terminal_color_0 = c.black
vim.g.terminal_color_1 = c.red
vim.g.terminal_color_2 = c.green
vim.g.terminal_color_3 = c.yellow
vim.g.terminal_color_4 = c.blue
vim.g.terminal_color_5 = c.magenta
vim.g.terminal_color_6 = c.brown
vim.g.terminal_color_7 = c.white
vim.g.terminal_color_8 = c.gray
vim.g.terminal_color_9 = c.br_red
vim.g.terminal_color_10 = c.br_green
vim.g.terminal_color_11 = c.br_yellow
vim.g.terminal_color_12 = c.br_blue
vim.g.terminal_color_13 = c.br_magenta
vim.g.terminal_color_14 = c.cream
vim.g.terminal_color_15 = c.fg_bright

local groups = {
  -- Editor UI
  Normal = { fg = c.fg, bg = c.bg },
  NormalNC = { fg = c.fg, bg = c.bg },
  NormalFloat = { fg = c.fg, bg = c.bg_dark },
  FloatBorder = { fg = c.gray, bg = c.bg_dark },
  FloatTitle = { fg = c.br_yellow, bg = c.bg_dark, bold = true },
  FloatFooter = { fg = c.gray, bg = c.bg_dark },
  Cursor = { fg = c.bg, bg = c.cursor },
  lCursor = { fg = c.bg, bg = c.cursor },
  CursorIM = { fg = c.bg, bg = c.cursor },
  TermCursor = { fg = c.bg, bg = c.cursor },
  TermCursorNC = { fg = c.bg, bg = c.gray },
  CursorLine = { bg = c.bg_sel },
  CursorColumn = { bg = c.bg_sel },
  ColorColumn = { bg = c.bg_dark },
  LineNr = { fg = c.gray },
  LineNrAbove = { fg = c.gray },
  LineNrBelow = { fg = c.gray },
  CursorLineNr = { fg = c.yellow, bold = true },
  SignColumn = { bg = c.bg },
  FoldColumn = { fg = c.gray, bg = c.bg },
  Folded = { fg = c.gray, bg = c.bg_dark },
  CursorLineFold = { link = "FoldColumn" },
  CursorLineSign = { link = "SignColumn" },
  Visual = { bg = c.bg_sel },
  VisualNOS = { bg = c.bg_sel },
  Search = { fg = c.black, bg = c.blue },
  IncSearch = { fg = c.black, bg = c.yellow, bold = true },
  CurSearch = { link = "IncSearch" },
  Substitute = { fg = c.black, bg = c.br_green },
  MatchParen = { fg = c.br_yellow, bg = c.gray, bold = true },
  ModeMsg = { fg = c.br_green, bold = true },
  MoreMsg = { fg = c.br_blue },
  Question = { fg = c.br_blue },
  WarningMsg = { fg = c.yellow },
  ErrorMsg = { fg = c.br_red },
  MsgArea = { fg = c.fg },
  MsgSeparator = { fg = c.gray },
  NonText = { fg = c.gray },
  EndOfBuffer = { fg = c.bg },
  Whitespace = { fg = c.gray },
  SpecialKey = { fg = c.gray },
  Conceal = { fg = c.blue },
  Directory = { fg = c.br_blue },
  Title = { fg = c.br_yellow, bold = true },
  WinSeparator = { fg = c.gray },
  VertSplit = { link = "WinSeparator" },
  StatusLine = { fg = c.fg, bg = c.bg_sel },
  StatusLineNC = { fg = c.gray, bg = c.bg_dark },
  StatusLineTerm = { link = "StatusLine" },
  StatusLineTermNC = { link = "StatusLineNC" },
  TabLine = { fg = c.fg, bg = c.bg_dark },
  TabLineSel = { fg = c.fg_bright, bg = c.bg_sel },
  TabLineFill = { bg = c.bg_dark },
  WinBar = { fg = c.fg, bg = c.bg },
  WinBarNC = { fg = c.gray, bg = c.bg },
  Pmenu = { fg = c.fg, bg = c.bg_dark },
  PmenuSel = { fg = c.fg_bright, bg = c.bg_sel },
  PmenuKind = { fg = c.yellow, bg = c.bg_dark },
  PmenuKindSel = { fg = c.yellow, bg = c.bg_sel, bold = true },
  PmenuExtra = { fg = c.gray, bg = c.bg_dark },
  PmenuExtraSel = { fg = c.gray, bg = c.bg_sel },
  PmenuSbar = { bg = c.bg_sel },
  PmenuThumb = { bg = c.gray },
  PmenuMatch = { fg = c.br_blue, bg = c.bg_dark, bold = true },
  PmenuMatchSel = { fg = c.br_blue, bg = c.bg_sel, bold = true },
  WildMenu = { link = "PmenuSel" },
  QuickFixLine = { bg = c.bg_sel, bold = true },
  SpellBad = { sp = c.br_red, undercurl = true },
  SpellCap = { sp = c.br_blue, undercurl = true },
  SpellLocal = { sp = c.br_green, undercurl = true },
  SpellRare = { sp = c.magenta, undercurl = true },

  -- Syntax
  Comment = { fg = c.gray, italic = true },
  Constant = { fg = c.cream },
  String = { fg = c.br_green },
  Character = { link = "String" },
  Number = { fg = c.br_yellow },
  Boolean = { fg = c.br_yellow },
  Float = { link = "Number" },
  Identifier = { fg = c.fg },
  Function = { fg = c.br_blue },
  Statement = { fg = c.yellow },
  Conditional = { link = "Statement" },
  Repeat = { link = "Statement" },
  Label = { link = "Statement" },
  Operator = { fg = c.cursor },
  Keyword = { link = "Statement" },
  Exception = { fg = c.br_red },
  PreProc = { fg = c.br_red },
  Include = { link = "Keyword" },
  Define = { link = "PreProc" },
  Macro = { link = "PreProc" },
  PreCondit = { link = "PreProc" },
  Type = { fg = c.cream },
  StorageClass = { link = "Keyword" },
  Structure = { link = "Type" },
  Typedef = { link = "Type" },
  Special = { fg = c.br_magenta },
  SpecialChar = { link = "Special" },
  Tag = { fg = c.yellow },
  Delimiter = { fg = c.cursor },
  SpecialComment = { link = "Special" },
  Debug = { fg = c.br_red },
  Underlined = { fg = c.br_blue, underline = true },
  Ignore = { fg = c.gray },
  Error = { fg = c.br_red },
  Todo = { fg = c.black, bg = c.yellow, bold = true },
  Added = { fg = c.br_green },
  Changed = { fg = c.br_blue },
  Removed = { fg = c.br_red },

  -- Diagnostics
  DiagnosticError = { fg = c.br_red },
  DiagnosticWarn = { fg = c.yellow },
  DiagnosticInfo = { fg = c.br_blue },
  DiagnosticHint = { fg = c.blue },
  DiagnosticOk = { fg = c.br_green },
  DiagnosticSignError = { link = "DiagnosticError" },
  DiagnosticSignWarn = { link = "DiagnosticWarn" },
  DiagnosticSignInfo = { link = "DiagnosticInfo" },
  DiagnosticSignHint = { link = "DiagnosticHint" },
  DiagnosticSignOk = { link = "DiagnosticOk" },
  DiagnosticFloatingError = { link = "DiagnosticError" },
  DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
  DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
  DiagnosticFloatingHint = { link = "DiagnosticHint" },
  DiagnosticFloatingOk = { link = "DiagnosticOk" },
  DiagnosticVirtualTextError = { fg = c.br_red, bg = blend.error_bg },
  DiagnosticVirtualTextWarn = { fg = c.yellow, bg = blend.warn_bg },
  DiagnosticVirtualTextInfo = { fg = c.br_blue, bg = blend.info_bg },
  DiagnosticVirtualTextHint = { fg = c.blue, bg = blend.hint_bg },
  DiagnosticVirtualTextOk = { fg = c.br_green, bg = blend.add_bg },
  DiagnosticUnderlineError = { sp = c.br_red, underline = true },
  DiagnosticUnderlineWarn = { sp = c.yellow, underline = true },
  DiagnosticUnderlineInfo = { sp = c.br_blue, underline = true },
  DiagnosticUnderlineHint = { sp = c.blue, underline = true },
  DiagnosticUnderlineOk = { sp = c.br_green, underline = true },

  -- Diff / Git
  DiffAdd = { bg = blend.add_bg },
  DiffChange = { bg = blend.change_bg },
  DiffDelete = { fg = c.br_red, bg = blend.delete_bg },
  DiffText = { bg = blend.text_bg },
  diffAdded = { link = "Added" },
  diffRemoved = { link = "Removed" },
  diffChanged = { link = "Changed" },
  diffOldFile = { fg = c.br_red },
  diffNewFile = { fg = c.br_green },
  diffFile = { fg = c.br_blue },
  diffLine = { fg = c.gray },
  diffIndexLine = { fg = c.magenta },
  GitSignsAdd = { fg = c.br_green },
  GitSignsChange = { fg = c.br_blue },
  GitSignsDelete = { fg = c.br_red },

  -- LSP
  LspReferenceText = { bg = c.bg_sel },
  LspReferenceRead = { bg = c.bg_sel },
  LspReferenceWrite = { bg = c.bg_sel },
  LspInlayHint = { fg = c.gray, bg = c.bg_dark },
  LspCodeLens = { fg = c.gray },

  -- Treesitter
  ["@variable"] = { fg = c.fg },
  ["@variable.builtin"] = { fg = c.br_magenta, italic = true },
  ["@variable.member"] = { fg = c.blue },
  ["@property"] = { fg = c.blue },
  ["@constant"] = { link = "Constant" },
  ["@constant.builtin"] = { fg = c.br_yellow },
  ["@module"] = { fg = c.cream },
  ["@string"] = { link = "String" },
  ["@string.escape"] = { fg = c.br_magenta },
  ["@string.regexp"] = { fg = c.yellow },
  ["@string.special"] = { link = "Special" },
  ["@character"] = { link = "Character" },
  ["@character.special"] = { link = "SpecialChar" },
  ["@boolean"] = { link = "Boolean" },
  ["@number"] = { link = "Number" },
  ["@number.float"] = { link = "Float" },
  ["@function"] = { link = "Function" },
  ["@function.builtin"] = { fg = c.blue },
  ["@function.call"] = { link = "Function" },
  ["@function.macro"] = { link = "Macro" },
  ["@constructor"] = { fg = c.cream },
  ["@keyword"] = { link = "Keyword" },
  ["@keyword.function"] = { link = "Keyword" },
  ["@keyword.operator"] = { fg = c.yellow },
  ["@keyword.return"] = { link = "Keyword" },
  ["@keyword.conditional"] = { link = "Conditional" },
  ["@keyword.repeat"] = { link = "Repeat" },
  ["@keyword.exception"] = { link = "Exception" },
  ["@keyword.import"] = { link = "Include" },
  ["@operator"] = { link = "Operator" },
  ["@punctuation.delimiter"] = { link = "Delimiter" },
  ["@punctuation.bracket"] = { link = "Delimiter" },
  ["@punctuation.special"] = { link = "Special" },
  ["@type"] = { link = "Type" },
  ["@type.builtin"] = { fg = c.cream, italic = true },
  ["@type.definition"] = { link = "Type" },
  ["@attribute"] = { fg = c.br_red },
  ["@tag"] = { link = "Tag" },
  ["@tag.attribute"] = { fg = c.blue },
  ["@tag.delimiter"] = { link = "Delimiter" },
  ["@comment"] = { link = "Comment" },
  ["@comment.todo"] = { link = "Todo" },
  ["@comment.error"] = { fg = c.br_red, bold = true },
  ["@comment.warning"] = { fg = c.yellow, bold = true },
  ["@comment.note"] = { fg = c.br_blue, bold = true },
  ["@markup.heading"] = { link = "Title" },
  ["@markup.strong"] = { bold = true },
  ["@markup.italic"] = { italic = true },
  ["@markup.strikethrough"] = { strikethrough = true },
  ["@markup.underline"] = { underline = true },
  ["@markup.link"] = { fg = c.br_magenta },
  ["@markup.link.url"] = { fg = c.br_blue, underline = true },
  ["@markup.raw"] = { fg = c.br_green },
  ["@markup.list"] = { fg = c.yellow },
  ["@diff.plus"] = { link = "Added" },
  ["@diff.minus"] = { link = "Removed" },
  ["@diff.delta"] = { link = "Changed" },
}

for group, opts in pairs(groups) do
  vim.api.nvim_set_hl(0, group, opts)
end
