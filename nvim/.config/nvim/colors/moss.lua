-- Moss — Neovim colorscheme matching the Moss kitty theme
-- Dark green background (#0e2009) with warm earth-tone accents

local c = {
	bg = "#0e2009",
	bg_dark = "#0a1606",
	bg_sel = "#1d3a13",
	fg = "#e6e1c5", -- cream
	cursor = "#ae9184", -- tan
	black = "#0a1606",
	gray = "#727359", -- olive
	br_gray = "#4a4b3a",
	maroon = "#754043",
	red = "#cc0000",
	br_red = "#e64545",
	green = "#727359", -- olive
	br_green = "#d4cb92", -- khaki
	yellow = "#8b6220", -- brown
	br_yellow = "#c98f2e", -- amber
	blue = "#598392", -- slate
	br_blue = "#7fa3b2",
	magenta = "#824c71", -- mauve
	br_magenta = "#b07a9d",
	tan = "#ae9184",
	br_tan = "#d9c6b8",
	khaki = "#d4cb92",
	cream = "#e6e1c5",
	fg_bright = "#f2efdd",
}

-- Subtle background blends for diagnostics/diff
local blend = {
	error_bg = "#2e100d",
	warn_bg = "#2a2008",
	info_bg = "#12262e",
	hint_bg = "#14241c",
	add_bg = "#1c2c0e",
	change_bg = "#142528",
	delete_bg = "#30100b",
	text_bg = "#1d3f4a",
}

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.g.colors_name = "moss"

-- Match :terminal to the kitty palette
vim.g.terminal_color_background = c.bg
vim.g.terminal_color_foreground = c.fg
vim.g.terminal_color_0 = c.black
vim.g.terminal_color_1 = c.maroon
vim.g.terminal_color_2 = c.green
vim.g.terminal_color_3 = c.yellow
vim.g.terminal_color_4 = c.blue
vim.g.terminal_color_5 = c.magenta
vim.g.terminal_color_6 = c.tan
vim.g.terminal_color_7 = c.khaki
vim.g.terminal_color_8 = c.br_gray
vim.g.terminal_color_9 = c.red
vim.g.terminal_color_10 = c.br_green
vim.g.terminal_color_11 = c.br_yellow
vim.g.terminal_color_12 = c.br_blue
vim.g.terminal_color_13 = c.br_magenta
vim.g.terminal_color_14 = c.br_tan
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
	CursorLineNr = { fg = c.br_yellow, bold = true },
	SignColumn = { bg = c.bg },
	FoldColumn = { fg = c.gray, bg = c.bg },
	Folded = { fg = c.gray, bg = c.bg_dark },
	CursorLineFold = { link = "FoldColumn" },
	CursorLineSign = { link = "SignColumn" },
	Visual = { bg = c.bg_sel },
	VisualNOS = { bg = c.bg_sel },
	Search = { fg = c.black, bg = c.blue },
	IncSearch = { fg = c.black, bg = c.br_yellow, bold = true },
	CurSearch = { link = "IncSearch" },
	Substitute = { fg = c.black, bg = c.br_green },
	MatchParen = { fg = c.br_yellow, bg = c.bg_sel, bold = true },
	ModeMsg = { fg = c.br_green, bold = true },
	MoreMsg = { fg = c.br_blue },
	Question = { fg = c.br_blue },
	WarningMsg = { fg = c.br_yellow },
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
	WinSeparator = { fg = c.bg_sel },
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
	PmenuKind = { fg = c.br_yellow, bg = c.bg_dark },
	PmenuKindSel = { fg = c.br_yellow, bg = c.bg_sel, bold = true },
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
	SpellRare = { sp = c.br_magenta, undercurl = true },

	-- Syntax
	Comment = { fg = c.gray, italic = true },
	Constant = { fg = c.br_yellow },
	String = { fg = c.khaki },
	Character = { link = "String" },
	Number = { fg = c.br_yellow },
	Boolean = { fg = c.br_yellow },
	Float = { link = "Number" },
	Identifier = { fg = c.fg },
	Function = { fg = c.br_blue },
	Statement = { fg = c.br_magenta },
	Conditional = { link = "Statement" },
	Repeat = { link = "Statement" },
	Label = { link = "Statement" },
	Operator = { fg = c.br_green },
	Keyword = { link = "Statement" },
	Exception = { fg = c.br_red },
	PreProc = { fg = c.red },
	Include = { link = "Keyword" },
	Define = { link = "PreProc" },
	Macro = { link = "PreProc" },
	PreCondit = { link = "PreProc" },
	Type = { fg = c.tan },
	StorageClass = { link = "Keyword" },
	Structure = { link = "Type" },
	Typedef = { link = "Type" },
	Special = { fg = c.magenta },
	SpecialChar = { link = "Special" },
	Tag = { fg = c.br_yellow },
	Delimiter = { fg = c.cursor },
	SpecialComment = { link = "Special" },
	Debug = { fg = c.br_red },
	Underlined = { fg = c.br_blue, underline = true },
	Ignore = { fg = c.gray },
	Error = { fg = c.br_red },
	Todo = { fg = c.black, bg = c.br_yellow, bold = true },
	Added = { fg = c.br_green },
	Changed = { fg = c.br_blue },
	Removed = { fg = c.br_red },

	-- Diagnostics
	DiagnosticError = { fg = c.br_red },
	DiagnosticWarn = { fg = c.br_yellow },
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
	DiagnosticVirtualTextWarn = { fg = c.br_yellow, bg = blend.warn_bg },
	DiagnosticVirtualTextInfo = { fg = c.br_blue, bg = blend.info_bg },
	DiagnosticVirtualTextHint = { fg = c.blue, bg = blend.hint_bg },
	DiagnosticVirtualTextOk = { fg = c.br_green, bg = blend.add_bg },
	DiagnosticUnderlineError = { sp = c.br_red, underline = true },
	DiagnosticUnderlineWarn = { sp = c.br_yellow, underline = true },
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
	diffIndexLine = { fg = c.br_magenta },
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
	["@module"] = { fg = c.tan },
	["@string"] = { link = "String" },
	["@string.escape"] = { fg = c.br_magenta },
	["@string.regexp"] = { fg = c.br_yellow },
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
	["@constructor"] = { fg = c.tan },
	["@keyword"] = { link = "Keyword" },
	["@keyword.function"] = { link = "Keyword" },
	["@keyword.operator"] = { fg = c.br_magenta },
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
	["@type.builtin"] = { fg = c.tan, italic = true },
	["@type.definition"] = { link = "Type" },
	["@attribute"] = { fg = c.red },
	["@tag"] = { link = "Tag" },
	["@tag.attribute"] = { fg = c.blue },
	["@tag.delimiter"] = { link = "Delimiter" },
	["@comment"] = { link = "Comment" },
	["@comment.todo"] = { link = "Todo" },
	["@comment.error"] = { fg = c.br_red, bold = true },
	["@comment.warning"] = { fg = c.br_yellow, bold = true },
	["@comment.note"] = { fg = c.br_blue, bold = true },
	["@markup.heading"] = { link = "Title" },
	["@markup.strong"] = { bold = true },
	["@markup.italic"] = { italic = true },
	["@markup.strikethrough"] = { strikethrough = true },
	["@markup.underline"] = { underline = true },
	["@markup.link"] = { fg = c.br_magenta },
	["@markup.link.url"] = { fg = c.br_blue, underline = true },
	["@markup.raw"] = { fg = c.br_green },
	["@markup.list"] = { fg = c.br_yellow },
	["@diff.plus"] = { link = "Added" },
	["@diff.minus"] = { link = "Removed" },
	["@diff.delta"] = { link = "Changed" },
}

for group, opts in pairs(groups) do
	vim.api.nvim_set_hl(0, group, opts)
end
