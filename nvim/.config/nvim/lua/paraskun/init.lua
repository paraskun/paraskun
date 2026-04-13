vim.g.mapleader = " "
vim.g.clipboard = "osc52"

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set({"n", "v"}, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>sv", ":vsplit<CR><C-w>w")
vim.keymap.set("n", "<leader>sh", ":split<CR><C-w>w")
vim.keymap.set("n", "r", "<C-r>")
vim.keymap.set("n", "<A-i>", "<C-i>")
vim.keymap.set("n", "<A-o>", "<C-o>")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.encoding = "UTF-8"
vim.opt.termguicolors = true

vim.g.python_host_prog = vim.fn.expand("~/.venv/nvim/bin/python3")
vim.g.python3_host_prog = vim.fn.expand("~/.venv/nvim/bin/python3")
vim.env.PATH = vim.fn.expand("~/.venv/nvim/bin") .. ":" .. vim.env.PATH

require("paraskun.lazy")
