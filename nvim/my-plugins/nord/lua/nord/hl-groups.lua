local c = require("nord.colours")
return {
	-- Editor Highlights
	Normal = { fg = c.fg, bg = c.bg },
	ColorColumn = { bg = c.bg_hl },
	Conceal = { fg = c.fg_fade },
	Cursor = { fg = c.bg, bg = c.fg },
	lCursor = { link = "Cursor" },
	CursorIM = { link = "Cursor" },
	CursorColumn = { link = "ColorColumn" },
	CursorLine = { link = "ColorColumn" },
	Directory = { fg = c.green },
	DiffAdd = { bg = c.diff_add },
	DiffChange = { bg = c.diff_change },
	DiffDelete = { bg = c.diff_delete },
	DiffText = { bg = c.diff_text },
	EndOfBuffer = { fg = c.fg_fade },
	TermCursor = { link = "Cursor" },
	TermCursorNC = { link = "Cursor" },
	ErrorMsg = { fg = c.error },
	VertSplit = { fg = c.border },
	Folded = { fg = c.comment, bg = c.bg_float },
	FoldColumn = { fg = c.fg_fade },
	SignColumn = { link = "Normal" },
	IncSearch = { fg = c.bg, bg = c.selection },
	Substitute = { link = "Search" },
	LineNr = { fg = c.fg_fade },
	LineNrAbove = { fg = c.fg_fade },
	LineNrBelow = { fg = c.fg_fade },
	CursorLineNr = { fg = c.border },
	MatchParen = { fg = c.yellow, att = "bold" },
	ModeMsg = { link = "Normal" },
	MsgArea = { link = "Normal" },
	MsgSeparator = { bg = c.visual },
	MoreMsg = { fg = c.yellow },
	NonText = { fg = c.fg_fade },
	NormalFloat = { fg = c.fg, bg = c.bg_float },
	NormalNC = { link = "Normal" },
	Pmenu = { fg = c.border, bg = c.bg_float },
	PmenuSel = { bg = c.selection },
	PmenuSbar = { fg = c.border, bg = c.bg_float },
	PmenuThumb = { fg = c.border, bg = c.border },
	Question = { fg = c.yellow },
	QuickFixLine = { bg = c.bg_float },
	Search = { bg = c.search },
	SpecialKey = { link = "NonText" },
	SpellBad = { sp = c.error, att = "undercurl" },
	SpellCap = { sp = c.warning, att = "undercurl" },
	SpellLocal = { sp = c.hint, att = "undercurl" },
	SpellRare = { sp = c.note, att = "undercurl" },
	StatusLine = { fg = c.fg, bg = c.status },
	StatusLineNC = { fg = c.fg_fade, bg = c.bg_hl },
	TabLine = { fg = c.fg_fade, bg = c.bg_hl },
	TabLineFill = { fg = c.fg, bg = c.bg_hl },
	TabLineSel = { fg = c.fg, bg = c.selection },
	Title = { fg = c.title, att = "bold" },
	Visual = { bg = c.visual },
	VisualNOS = { link = "Visual" },
	WarningMsg = { fg = c.warning },
	WhiteSpace = { link = "NonText" },
	WildMenu = { fg = c.selection, att = "bold" },
	FloatBorder = { fg = c.border, bg = c.bg_float },

	-- Syntax Highlights
	Comment = { fg = c.comment, att = "italic" },
	Constant = { fg = c.fg },
	String = { fg = c.blues[2] },
	Character = { link = "String" },
	Number = { fg = c.green },
	Boolean = { fg = c.green },
	Float = { link = "Number" },
	Identifier = { fg = c.fg },
	Function = { fg = c.blues[3] },
	Statement = { fg = c.blues[1] },
	Conditional = { link = "Statement" },
	Repeat = { link = "Statement" },
	Label = { link = "Statement" },
	Operator = { link = "Statement" },
	Keyword = { link = "Statement" },
	Exception = { link = "Statement" },
	PreProc = { fg = c.blues[4] },
	Include = { link = "PreProc" },
	Define = { link = "PreProc" },
	Macro = { link = "PreProc" },
	PreCondit = { link = "PreProc" },
	Type = { fg = c.purple },
	StorageClass = { link = "Type" },
	Structure = { link = "Type" },
	Typedef = { link = "Type" },
	Special = { fg = c.fg },
	SpecialChar = { link = "Character" },
	Tag = { fg = c.orange },
	Delimiter = { fg = c.comment },
	SpecialComment = { link = "Comment" },
	Debug = { fg = c.yellow },
	Underlined = { att = "underline" },
	Ignore = { fg = c.fg_fade },
	Error = { fg = c.error },
	Todo = { fg = c.todo, att = "bold,italic" },
	helpCommand = { fg = c.blues[3] },
	helpExample = { link = "String" },
	helpHyperTextEntry = { link = "Title" },
	helpHyperTextJump = { link = "Tag" },
	helpOption = { link = "Tag" },
	healthSuccess = { fg = c.green },

	-- TreeSitter Highlights
	TSPunctDelimiter = { link = "Delimiter" },
	TSPunctBracket = { link = "TSPunctDelimiter" },
	TSPunctSpecial = { link = "TSPunctDelimiter" },

	TSConstant = { link = "Constant" },
	TSConstMacro = { link = "Macro" },
	TSConstBuiltin = { link = "TSKeyword" },
	TSString = { link = "String" },
	TSStringRegex = { link = "TSString" },
	TSStringEscape = { fg = c.blues[4] },
	TSStringSpecial = { link = "TSString" },
	TSCharacter = { link = "Character" },
	TSNumber = { link = "Number" },
	TSBoolean = { link = "Boolean" },
	TSFloat = { link = "Float" },

	TSFunction = { link = "Function" },
	TSFuncBuiltin = { link = "TSFunction" },
	TSFuncMacro = { link = "Macro" },
	TSParameter = { fg = c.fg },
	TSParameterReference = { link = "TSParameter" },
	TSMethod = { link = "TSFunction" },
	TSField = { fg = c.fg },
	TSProperty = { fg = c.fg },
	TSConstructor = { link = "TSFunction" },
	TSAnnotation = { fg = c.yellow },
	TSAttribute = { link = "TSAnnotation" },
	TSNamespace = { fg = c.fg },
	TSSymbol = { fg = c.fg },

	TSConditional = { link = "Conditional" },
	TSRepeat = { link = "Repeat" },
	TSLabel = { link = "Label" },
	TSOperator = { link = "Operator" },
	TSKeyword = { link = "Keyword" },
	TSKeywordFunction = { link = "TSKeyword" },
	TSKeywordOperator = { link = "TSOperator" },
	TSKeywordReturn = { link = "TSKeyword" },
	TSException = { link = "Exception" },

	TSType = { link = "Type" },
	TSTypeBuiltin = { link = "TSType" },
	TSInclude = { link = "Include" },

	TSVariable = { link = "Identifier" },
	TSVariableBuiltin = { link = "TSKeyword" },

	TSText = { fg = c.fg },
	TSStrong = { att = "bold" },
	TSEmphasis = { att = "italic" },
	TSUnderline = { att = "undercurl" },
	TSStrike = { att = "strikethrough" },
	TSMath = { link = "Comment" },
	TSTextReference = { fg = c.blues[4] },
	TSEnvironment = { link = "TSText" },
	TSEnvironmentName = { link = "TSType" },
	TSTitle = { link = "Title" },
	TSLiteral = { link = "TSText" },
	TSURI = { link = "Underlined" },

	TSComment = { link = "Comment" },
	TSNote = { fg = c.note },
	TSWarning = { fg = c.warning },
	TSDanger = { fg = c.danger },
	TSError = { sp = c.error, att = "undercurl" },

	TSTag = { link = "TSKeyword" },
	TSTagDelimiter = { link = "TSPunctDelimiter" },
	TSTagAttribute = { link = "TSProperty" },

	-- LSP Highlights
	LspReferenceText = { link = "Visual" },
	LspReferenceRead = { link = "Visual" },
	LspReferenceWrite = { link = "Visual" },

	DiagnosticError = { fg = c.error },
	DiagnosticWarn = { fg = c.warning },
	DiagnosticInfo = { fg = c.info },
	DiagnosticHint = { fg = c.hint },

	DiagnosticVirtualTextError = { link = "DiagnosticError" },
	DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
	DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
	DiagnosticVirtualTextHint = { link = "DiagnosticHint" },

	DiagnosticUnderlineError = { sp = c.error, att = "undercurl" },
	DiagnosticUnderlineWarn = { sp = c.warning, att = "undercurl" },
	DiagnosticUnderlineInfo = { sp = c.info, att = "undercurl" },
	DiagnosticUnderlineHint = { sp = c.hint, att = "undercurl" },

	DiagnosticFloatingError = { link = "DiagnosticError" },
	DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
	DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
	DiagnosticFloatingHint = { link = "DiagnosticHint" },

	DiagnosticSignError = { link = "DiagnosticError" },
	DiagnosticSignWarn = { link = "DiagnosticWarn" },
	DiagnosticSignInfo = { link = "DiagnosticInfo" },
	DiagnosticSignHint = { link = "DiagnosticHint" },

	LspCodeLens = { fg = c.comment },
	LspCodeLensSeparator = { fg = c.fg_fade },

	LspSignatureActiveParameter = { link = "Visual" },
}
