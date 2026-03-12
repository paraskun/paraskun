vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set({"n", "v"}, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>sv", ":vsplit<CR><C-w>w")
vim.keymap.set("n", "<leader>sh", ":split<CR><C-w>w")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.encoding = "UTF-8"
vim.opt.termguicolors = true

require("paraskun.lazy")
