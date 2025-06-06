vim.o.winborder = "rounded"

-- 2 Moving, Searching and Patters
vim.opt.cdhome = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- 4 Displaying Text
vim.opt.virtualedit = { "onemore", "block" }
vim.opt.smoothscroll = true
vim.opt.scrolloff = 5
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.sidescrolloff = 3
vim.opt.fillchars = { eob = " ", fold = " ", foldopen = "", foldclose = "", foldsep = " ", diff = "╱" }
vim.opt.list = true
vim.opt.listchars = { extends = "»", precedes = "«", eol = "↲", trail = "∙", tab = "⇥ ", nbsp = "␣" }
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 1

-- 5 Syntax, Highlighting and Spelling
vim.opt.cursorline = true
vim.opt.colorcolumn = "121"
vim.opt.cursorlineopt = "number"
vim.opt.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
vim.opt.spelloptions = "camel"

-- 6 Multiple Windows
vim.opt.laststatus = 3
vim.opt.switchbuf = "usetab"
vim.opt.splitbelow = true
vim.opt.splitright = true

-- 10 Messages and Info
vim.opt.shortmess:append("cI")
vim.opt.showmode = false
vim.opt.ruler = false

-- 12 Editing Text
vim.opt.undofile = true
vim.opt.completeopt = { "menuone", "noinsert" }
vim.opt.pumheight = math.ceil(vim.go.lines / 2)
vim.opt.tildeop = true
vim.opt.showmatch = true
vim.opt.nrformats:append("alpha")

-- 13 Tabs and Indenting
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.shiftround = true
vim.opt.cindent = true

-- 14 Folding
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldcolumn = "auto:1"
vim.opt.foldopen:remove({ "block", "hor" })

-- 15 Diff Mode
vim.opt.diffopt:append("linematch:60")

-- 16 Mapping
vim.opt.timeoutlen = 3000

-- 17 Reading and Writing Files
vim.opt.backup = true
vim.opt.backupdir = vim.env.XDG_DATA_HOME .. "/nvim/backup//"

-- 18 Swap File
vim.opt.updatetime = 250

-- 21 Make and Errors
vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"

-- 24 Various
vim.opt.virtualedit = { "onemore", "block" }
vim.opt.sessionoptions:append({ "skiprtp", "terminal" })
vim.opt.inccommand = "split"
vim.opt.shadafile = vim.fn.stdpath("state")
	.. "/shada/"
	.. vim.fs.normalize(vim.fn.getcwd()):gsub("/", "%%")
	.. ".shada"

vim.g.neovide_cursor_animation_length = 0.05
vim.g.neovide_scroll_animation_length = 0.05
