vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- move visual selections
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Down" })

-- diagnostics
vim.keymap.set("n", "<leader>de", vim.diagnostic.setloclist, { desc = "Open diagnostic error list" })
vim.keymap.set("n", "<leader>df", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })

-- yanking
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>yy", '"+yy', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.keymap.set("n", "<leader><CR>", "A<CR><Esc>", { desc = "Insert Line Break", noremap = true, silent = true })

-- surround with parentheses, brackets, ...
vim.keymap.set("v", "<leader>s(", "c(<Esc>pa)<Esc>l", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>s{", "c{<Esc>pa}<Esc>l", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>s[", "c[<Esc>pa]<Esc>l", { noremap = true, silent = true })
vim.keymap.set("v", '<leader>s"', 'c"<Esc>pa"<Esc>l', { noremap = true, silent = true })
vim.keymap.set("v", "<leader>s'", "c'<Esc>pa'<Esc>l", { noremap = true, silent = true })

-- toggle background color
vim.opt.background = "dark"
local function toggle_background()
	if vim.o.background == "dark" then
		vim.cmd("set background=light")
	else
		vim.cmd("set background=dark")
	end
end
vim.api.nvim_create_user_command("ToggleBackground", toggle_background, {})
vim.keymap.set("n", "<leader>bg", toggle_background, { desc = "Toggle [B]ack[G]round", noremap = true, silent = true })

-- quick window switching
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
