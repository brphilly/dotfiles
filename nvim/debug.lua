-- Taken from lewis6991/gitsigns.nvim
vim.cmd [[set runtimepath=$VIMRUNTIME]]
vim.cmd [[set packpath=/tmp/nvim/site]]

-- install packer
local package_root = '/tmp/nvim/site/pack'
local install_path = package_root .. '/packer/start/packer.nvim'
if vim.fn.isdirectory(install_path) == 0 then
	print("Installing plugins and dependencies.")
	vim.fn.system { 'git', 'clone', '--depth=1', 'https://github.com/wbthomason/packer.nvim', install_path }
end

-- create function to run after installing plugins
_G.load_config = function()
	vim.cmd [[
	runtime! plugin/**/*.vim
	runtime! plugin/**/*.lua
	]]
end

-- set load_config to run after installing plugins
vim.cmd [[autocmd User PackerComplete ++once echo "Ready!" | lua load_config()]]

-- Install plugins
require('packer').startup {
	{
		'wbthomason/packer.nvim',
		-- 'example/example.nvim',
	},
	config = {
		package_root = package_root,
		compile_path = install_path .. '/plugin/packer_compiled.lua',
		display = { non_interactive = true },
	},
}
require('packer').sync()
