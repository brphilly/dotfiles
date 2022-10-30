vim.keymap.set("n", "m'", function() require("harpoon.mark").add_file() end)
vim.keymap.set("n", "['", function() require("harpoon.ui").nav_prev() end)
vim.keymap.set("n", "]'", function() require("harpoon.ui").nav_next() end)
vim.keymap.set("n", "<leader>'", function() require("harpoon.ui").toggle_quick_menu() end)
for i = 1,5 do
	vim.keymap.set("n", "'"..i, function() require("harpoon.ui").nav_file(i) end)
end
for i = 1,4 do
	vim.keymap.set("n", "'"..((i+6)%10), function() require("harpoon.term").gotoTerminal(i) end)
end
