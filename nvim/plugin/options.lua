vim.opt.tabstop = 2
vim.opt.shiftwidth = 0
vim.opt.shiftround = true
vim.opt.cindent = true

vim.opt.foldmethod = 'indent'
vim.opt.foldopen:remove({'block', 'hor', 'percent'})
vim.opt.foldlevel = 99

vim.opt.spelloptions = 'camel'
vim.opt.spellfile = vim.fn.stdpath('config')..'/spell/en.utf-8.add'

vim.opt.sessionoptions:remove('curdir'):append({'skiprtp','terminal'})

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'auto:2'
vim.opt.cursorlineopt = 'number'
vim.opt.cursorline = true
vim.opt.ruler = false

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.breakindentopt = 'min:10,shift:1'

vim.opt.virtualedit = {'onemore', 'block'}
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 3
vim.opt.list = true
vim.opt.listchars = {extends = '»', precedes = '«', eol = '¬', trail = '∙', tab = '  ', nbsp = '␣'}
vim.opt.fillchars = {eob = ' ', fold = ' '}
vim.opt.showmode = false
vim.opt.showmatch = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'split'

vim.opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
vim.opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'

vim.opt.termguicolors = true
vim.opt.mouse = 'a'
vim.opt.shortmess:append('cI')
vim.opt.iskeyword:append('-')
vim.opt.updatetime = 1000
vim.opt.timeout = false
vim.opt.switchbuf = 'usetab'

vim.opt.completeopt = {'menuone', 'noinsert'}
vim.opt.pumheight = math.ceil(vim.go.lines / 2)

vim.opt.undofile = true
vim.opt.backup = true
vim.opt.backupdir = vim.env.XDG_DATA_HOME..'/nvim/backup//'
