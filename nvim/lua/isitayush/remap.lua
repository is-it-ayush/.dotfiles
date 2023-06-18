vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- This is the shortcuts for opening & closing split window. : )
vim.keymap.set("n", "<leader>zz", "<cmd>:split<CR>")
vim.keymap.set("n", "<leader>zzv", "<cmd>:vsplit<CR>")

-- Closing the window.
vim.keymap.set("n", "<leader>zx", "<cmd>:close<CR>")

-- This for the terminal.
vim.keymap.set("n", "<leader>zt", "<cmd>:split | terminal<CR>")
vim.keymap.set("n", "<leader>ztv", "<cmd>:vsplit | terminal<CR>")

-- This is for the terminal normal mode fix. Ref :help terminal
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", { noremap = true })

-- Cool Things! : D
vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n", "<leader>bruh", "<cmd>CellularAutomaton game_of_life<CR>")

-- Clear buffers in case nvim slow's down.
vim.keymap.set("n", "<leader>bo", "<cmd>%bd|e#<cr>", {desc="Close all buffers but the current one"}) -- https://stackoverflow.com/a/42071865/516188

-- Bind Ctrl + s to Save the file & switch to normal mode.
vim.keymap.set("i", "<C-s>", "<cmd>:w<CR><ESC>", { noremap = true });

-- Bind ~ to Neogit.
vim.keymap.set("n", "<leader>gg", "<cmd>:Neogit<cr>");


-- Dir Tree.
vim.api.nvim_set_keymap("n", "<C-q>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})
