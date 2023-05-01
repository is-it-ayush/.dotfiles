vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- This is the shortcuts for opening & closing split window. : )
vim.keymap.set("n", "<leader>zz", ":split<CR>")
vim.keymap.set("n", "<leader>zzv", ":vsplit<CR>")

-- Closing the window.
vim.keymap.set("n", "<leader>zx", ":close<CR>")

-- This for the terminal.
vim.keymap.set("n", "<leader>zt", ":split | terminal<CR>")
vim.keymap.set("n", "<leader>ztv", ":vsplit | terminal<CR>")

-- This is for the terminal normal mode fix. Ref :help terminal
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", { noremap = true })

