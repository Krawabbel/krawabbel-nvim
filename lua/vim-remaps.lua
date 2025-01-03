vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", ":Q", ":q")
vim.keymap.set("n", "<leader>w", ':write<CR>', {noremap = true})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set('n', '<leader>de', vim.diagnostic.setloclist, { desc = 'Open diagnostic error list' })
vim.keymap.set('n', '<leader>df', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix list' })
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("v", "<leader>y", '"+y', {desc = 'Yank to system clipboard'})
vim.keymap.set("n", "<leader>yy", '"+yy', {desc = 'Yank to system clipboard'})
vim.keymap.set("n", "<leader>p", '"+p', {desc = 'Paste from system clipboard'})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

