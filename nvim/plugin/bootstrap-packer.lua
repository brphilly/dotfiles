local download_packer = function(install_path)
	if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
		return false
	end

	vim.fn.mkdir(install_path, "p")

	print("Downloading packer.nvim...")
	local out = vim.fn.system(string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim", install_path .. "/packer.nvim"))
	print(out)

	vim.cmd("packadd packer.nvim")
	require("bp.plugins.packer")
	vim.cmd("PackerSync")
	return true
end

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt"
return vim.fn.empty(vim.fn.glob(install_path .. "/packer.nvim")) == 0 or download_packer(install_path)
