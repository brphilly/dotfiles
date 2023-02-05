local c = require("nord.colours")
return function()
	-- Editor Highlights
	vim.api.nvim_set_hl(0, "Normal", {fg = c.fg, bg = c.bg})
	vim.api.nvim_set_hl(0, "ColorColumn", {bg = c.bg_hl})
	vim.api.nvim_set_hl(0, "Conceal", {fg = c.fg_fade})
	vim.api.nvim_set_hl(0, "Cursor", {fg = c.bg, bg = c.fg})
	vim.api.nvim_set_hl(0, "lCursor", {link = "Cursor"})
	vim.api.nvim_set_hl(0, "CursorIM", {link = "Cursor"})
	vim.api.nvim_set_hl(0, "CursorColumn", {link = "ColorColumn"})
	vim.api.nvim_set_hl(0, "CursorLine", {link = "ColorColumn"})
	vim.api.nvim_set_hl(0, "Directory", {fg = c.directory})
	vim.api.nvim_set_hl(0, "DiffAdd", {bg = c.diff_add_fade})
	vim.api.nvim_set_hl(0, "DiffChange", {bg = c.diff_change_fade})
	vim.api.nvim_set_hl(0, "DiffDelete", {bg = c.diff_delete_fade})
	vim.api.nvim_set_hl(0, "DiffText", {bg = c.diff_text_fade})
	vim.api.nvim_set_hl(0, "EndOfBuffer", {fg = c.fg_fade})
	vim.api.nvim_set_hl(0, "TermCursor", {link = "Cursor"})
	vim.api.nvim_set_hl(0, "TermCursorNC", {link = "Cursor"})
	vim.api.nvim_set_hl(0, "ErrorMsg", {fg = c.error})
	vim.api.nvim_set_hl(0, "VertSplit", {fg = c.border})
	vim.api.nvim_set_hl(0, "Folded", {fg = c.comment, bg = c.bg_float})
	vim.api.nvim_set_hl(0, "FoldColumn", {fg = c.fg_fade})
	vim.api.nvim_set_hl(0, "SignColumn", {link = "Normal"})
	vim.api.nvim_set_hl(0, "IncSearch", {fg = c.bg, bg = c.incsearch})
	vim.api.nvim_set_hl(0, "Substitute", {link = "Search"})
	vim.api.nvim_set_hl(0, "LineNr", {fg = c.fg_fade})
	vim.api.nvim_set_hl(0, "LineNrAbove", {fg = c.fg_fade})
	vim.api.nvim_set_hl(0, "LineNrBelow", {fg = c.fg_fade})
	vim.api.nvim_set_hl(0, "CursorLineNr", {fg = c.border})
	vim.api.nvim_set_hl(0, "MatchParen", {bg = c.fg_fade})
	vim.api.nvim_set_hl(0, "ModeMsg", {link = "Normal"})
	vim.api.nvim_set_hl(0, "MsgArea", {link = "Normal"})
	vim.api.nvim_set_hl(0, "MsgSeparator", {bg = c.visual})
	vim.api.nvim_set_hl(0, "MoreMsg", {fg = c.attention})
	vim.api.nvim_set_hl(0, "NonText", {fg = c.fg_fade})
	vim.api.nvim_set_hl(0, "NormalFloat", {fg = c.fg, bg = c.bg_float})
	vim.api.nvim_set_hl(0, "NormalNC", {link = "Normal"})
	vim.api.nvim_set_hl(0, "Pmenu", {fg = c.border, bg = c.bg_float})
	vim.api.nvim_set_hl(0, "PmenuSel", {bg = c.selection})
	vim.api.nvim_set_hl(0, "PmenuSbar", {fg = c.border, bg = c.bg_float})
	vim.api.nvim_set_hl(0, "PmenuThumb", {fg = c.border, bg = c.border})
	vim.api.nvim_set_hl(0, "Question", {fg = c.attention})
	vim.api.nvim_set_hl(0, "QuickFixLine", {bg = c.visual})
	vim.api.nvim_set_hl(0, "Search", {bg = c.search})
	vim.api.nvim_set_hl(0, "SpecialKey", {link = "NonText"})
	vim.api.nvim_set_hl(0, "SpellBad", {sp = c.error, undercurl = true})
	vim.api.nvim_set_hl(0, "SpellCap", {sp = c.warning, undercurl = true})
	vim.api.nvim_set_hl(0, "SpellLocal", {sp = c.hint, undercurl = true})
	vim.api.nvim_set_hl(0, "SpellRare", {sp = c.note, undercurl = true})
	vim.api.nvim_set_hl(0, "StatusLine", {fg = c.fg, bg = c.status})
	vim.api.nvim_set_hl(0, "StatusLineNC", {fg = c.fg_fade, bg = c.bg_hl})
	vim.api.nvim_set_hl(0, "TabLine", {fg = c.fg_fade, bg = c.bg_hl})
	vim.api.nvim_set_hl(0, "TabLineFill", {fg = c.fg, bg = c.bg_hl})
	vim.api.nvim_set_hl(0, "TabLineSel", {fg = c.fg, bg = c.selection})
	vim.api.nvim_set_hl(0, "Title", {fg = c.title, bold = true})
	vim.api.nvim_set_hl(0, "Visual", {bg = c.visual})
	vim.api.nvim_set_hl(0, "VisualNOS", {link = "Visual"})
	vim.api.nvim_set_hl(0, "WarningMsg", {fg = c.warning})
	vim.api.nvim_set_hl(0, "WhiteSpace", {link = "NonText"})
	vim.api.nvim_set_hl(0, "WildMenu", {fg = c.selection, bold = true})
	vim.api.nvim_set_hl(0, "FloatBorder", {fg = c.border, bg = c.bg_float})

	-- Syntax Highlights
	vim.api.nvim_set_hl(0, "Comment", {fg = c.comment, italic = true})
	vim.api.nvim_set_hl(0, "Constant", {fg = c.fg, bold = true})
	vim.api.nvim_set_hl(0, "String", {fg = c.string})
	vim.api.nvim_set_hl(0, "Character", {link = "String"})
	vim.api.nvim_set_hl(0, "Number", {fg = c.number})
	vim.api.nvim_set_hl(0, "Boolean", {fg = c.number})
	vim.api.nvim_set_hl(0, "Float", {link = "Number"})
	vim.api.nvim_set_hl(0, "Identifier", {fg = c.fg})
	vim.api.nvim_set_hl(0, "Function", {fg = c.func})
	vim.api.nvim_set_hl(0, "Statement", {link = "Keyword"})
	vim.api.nvim_set_hl(0, "Conditional", {link = "Keyword"})
	vim.api.nvim_set_hl(0, "Repeat", {link = "Keyword"})
	vim.api.nvim_set_hl(0, "Label", {link = "Keyword"})
	vim.api.nvim_set_hl(0, "Operator", {fg = c.comment})
	vim.api.nvim_set_hl(0, "Keyword", {fg = c.keyword})
	vim.api.nvim_set_hl(0, "Exception", {link = "Keyword"})
	vim.api.nvim_set_hl(0, "PreProc", {link = "Macro"})
	vim.api.nvim_set_hl(0, "Include", {link = "Macro"})
	vim.api.nvim_set_hl(0, "Define", {link = "Macro"})
	vim.api.nvim_set_hl(0, "Macro", {fg = c.macro})
	vim.api.nvim_set_hl(0, "PreCondit", {link = "Macro"})
	vim.api.nvim_set_hl(0, "Type", {fg = c.type})
	vim.api.nvim_set_hl(0, "StorageClass", {link = "Type"})
	vim.api.nvim_set_hl(0, "Structure", {link = "Type"})
	vim.api.nvim_set_hl(0, "Typedef", {link = "Type"})
	vim.api.nvim_set_hl(0, "Special", {fg = c.fg})
	vim.api.nvim_set_hl(0, "SpecialChar", {link = "Character"})
	vim.api.nvim_set_hl(0, "Tag", {fg = c.tag})
	vim.api.nvim_set_hl(0, "Delimiter", {fg = c.comment})
	vim.api.nvim_set_hl(0, "SpecialComment", {link = "Comment"})
	vim.api.nvim_set_hl(0, "Debug", {fg = c.attention})
	vim.api.nvim_set_hl(0, "Underlined", {underline = true})
	vim.api.nvim_set_hl(0, "Ignore", {fg = c.fg_fade})
	vim.api.nvim_set_hl(0, "Error", {fg = c.error})
	vim.api.nvim_set_hl(0, "Todo", {fg = c.todo, bold = true, italic = true})
	vim.api.nvim_set_hl(0, "helpCommand", {fg = c.func})
	vim.api.nvim_set_hl(0, "helpExample", {link = "String"})
	vim.api.nvim_set_hl(0, "helpHyperTextEntry", {link = "Title"})
	vim.api.nvim_set_hl(0, "helpHyperTextJump", {link = "Tag"})
	vim.api.nvim_set_hl(0, "helpOption", {link = "Tag"})
	vim.api.nvim_set_hl(0, "healthSuccess", {fg = c.success})

	-- TreeSitter Highlights
	vim.api.nvim_set_hl(0, "@punctuation", {link = "Delimiter"})

	vim.api.nvim_set_hl(0, "@constant", {link = "Constant"})
	vim.api.nvim_set_hl(0, "@constant.macro", {fg = c.macro, bold = true})
	vim.api.nvim_set_hl(0, "@constant.builtin", {fg = c.keyword, bold = true})
	vim.api.nvim_set_hl(0, "@string", {link = "String"})
	vim.api.nvim_set_hl(0, "@string.escape", {fg = c.escape})
	vim.api.nvim_set_hl(0, "@character", {link = "Character"})
	vim.api.nvim_set_hl(0, "@number", {link = "Number"})
	vim.api.nvim_set_hl(0, "@boolean", {link = "Boolean"})
	vim.api.nvim_set_hl(0, "@float", {link = "Float"})

	vim.api.nvim_set_hl(0, "@function", {link = "Function"})
	vim.api.nvim_set_hl(0, "@function.macro", {link = "Macro"})
	vim.api.nvim_set_hl(0, "@parameter", {fg = c.fg})
	vim.api.nvim_set_hl(0, "@method", {link = "@function"})
	vim.api.nvim_set_hl(0, "@field", {fg = c.fg})
	vim.api.nvim_set_hl(0, "@property", {fg = c.fg})
	vim.api.nvim_set_hl(0, "@constructor", {link = "@function"})
	vim.api.nvim_set_hl(0, "@annotation", {fg = c.attention})
	vim.api.nvim_set_hl(0, "@attribute", {link = "@annotation"})
	vim.api.nvim_set_hl(0, "@namespace", {fg = c.fg})
	vim.api.nvim_set_hl(0, "@symbol", {fg = c.fg})

	vim.api.nvim_set_hl(0, "@conditional", {link = "Conditional"})
	vim.api.nvim_set_hl(0, "@repeat", {link = "Repeat"})
	vim.api.nvim_set_hl(0, "@label", {link = "Label"})
	vim.api.nvim_set_hl(0, "@operator", {link = "Operator"})
	vim.api.nvim_set_hl(0, "@keyword", {link = "Keyword"})
	vim.api.nvim_set_hl(0, "@exception", {link = "Exception"})

	vim.api.nvim_set_hl(0, "@type", {link = "Type"})
	vim.api.nvim_set_hl(0, "@include", {link = "Include"})

	vim.api.nvim_set_hl(0, "@variable", {link = "Identifier"})
	vim.api.nvim_set_hl(0, "@variable.builtin", {link = "@keyword"})

	vim.api.nvim_set_hl(0, "@text", {fg = c.fg})
	vim.api.nvim_set_hl(0, "@text.strong", {bold = true})
	vim.api.nvim_set_hl(0, "@text.emphasis", {italic = true})
	vim.api.nvim_set_hl(0, "@text.underline", {undercurl = true})
	vim.api.nvim_set_hl(0, "@text.strike", {strikethrough = true})
	vim.api.nvim_set_hl(0, "@text.math", {link = "Comment"})
	vim.api.nvim_set_hl(0, "@text.reference", {fg = c.info})
	vim.api.nvim_set_hl(0, "@text.environment", {link = "@text"})
	vim.api.nvim_set_hl(0, "@text.environment.name", {link = "@type"})
	vim.api.nvim_set_hl(0, "@text.title", {link = "Title"})
	vim.api.nvim_set_hl(0, "@text.literal", {link = "@text"})
	vim.api.nvim_set_hl(0, "@text.uri", {link = "Underlined"})

	vim.api.nvim_set_hl(0, "@comment", {link = "Comment"})
	vim.api.nvim_set_hl(0, "@text.note", {fg = c.note})
	vim.api.nvim_set_hl(0, "@text.warning", {fg = c.warning})
	vim.api.nvim_set_hl(0, "@text.danger", {fg = c.danger})
	vim.api.nvim_set_hl(0, "@error", {sp = c.error, undercurl = true})

	vim.api.nvim_set_hl(0, "@tag", {link = "@keyword"})
	vim.api.nvim_set_hl(0, "@tag.delimiter", {link = "@punctuation.delimiter"})
	vim.api.nvim_set_hl(0, "@tag.attribute", {link = "@property"})

	-- LSP Highlights
	vim.api.nvim_set_hl(0, "LspReferenceText", {bg = c.visual_fade})
	vim.api.nvim_set_hl(0, "LspReferenceRead", {bg = c.visual_fade})
	vim.api.nvim_set_hl(0, "LspReferenceWrite", {bg = c.visual_fade})

	vim.api.nvim_set_hl(0, "DiagnosticError", {fg = c.error})
	vim.api.nvim_set_hl(0, "DiagnosticWarn", {fg = c.warning})
	vim.api.nvim_set_hl(0, "DiagnosticInfo", {fg = c.info})
	vim.api.nvim_set_hl(0, "DiagnosticHint", {fg = c.hint})

	vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", {link = "DiagnosticError"})
	vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", {link = "DiagnosticWarn"})
	vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", {link = "DiagnosticInfo"})
	vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", {link = "DiagnosticHint"})

	vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {sp = c.error, undercurl = true})
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {sp = c.warning, undercurl = true})
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", {sp = c.info, undercurl = true})
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", {sp = c.hint, undercurl = true})

	vim.api.nvim_set_hl(0, "DiagnosticFloatingError", {link = "DiagnosticError"})
	vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", {link = "DiagnosticWarn"})
	vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo", {link = "DiagnosticInfo"})
	vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", {link = "DiagnosticHint"})

	vim.api.nvim_set_hl(0, "DiagnosticSignError", {link = "DiagnosticError"})
	vim.api.nvim_set_hl(0, "DiagnosticSignWarn", {link = "DiagnosticWarn"})
	vim.api.nvim_set_hl(0, "DiagnosticSignInfo", {link = "DiagnosticInfo"})
	vim.api.nvim_set_hl(0, "DiagnosticSignHint", {link = "DiagnosticHint"})

	vim.api.nvim_set_hl(0, "LspCodeLens", {fg = c.comment, bg = c.bg_float})
	vim.api.nvim_set_hl(0, "LspCodeLensSeparator", {fg = c.fg, bg = c.bg_float})

	vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", {link = "Visual"})
end