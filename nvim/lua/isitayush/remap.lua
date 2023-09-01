vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Window & Terminal Shortcuts: )
vim.keymap.set("n", "<leader>hz", "<cmd>:split<CR>")
vim.keymap.set("n", "<leader>vz", "<cmd>:vsplit<CR>")
vim.keymap.set("n", "<leader>zx", "<cmd>:close<CR>")
vim.keymap.set("n", "<leader>ht", "<cmd>:split | terminal<CR>")
vim.keymap.set("n", "<leader>vt", "<cmd>:vsplit | terminal<CR>")

vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", { noremap = true }) -- remap ESC key in terminal mode.
vim.keymap.set("n", "<leader>bo", "<cmd>%bd|e#<cr>", {desc="Close all buffers but the current one"}) -- https://stackoverflow.com/a/42071865/516188
vim.keymap.set("i", "<C-s>", "<cmd>:w<ESC>", { noremap = true }); -- save file & exit to normal mode.
vim.keymap.set("n", "<leader>gg", "<cmd>:Neogit<cr>"); -- neogit
vim.api.nvim_set_keymap("n", "<C-q>", ":NvimTreeToggle<cr>", {silent = true, noremap = true}); -- dir tree
vim.keymap.set("", "<Leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" }); -- toggle lsp lines.
vim.keymap.set("n", "tt", "<cmd>:TroubleToggle<CR>", { silent = true, desc = "Toggle Trouble" });

-- Thanks prime. :3
vim.keymap.set("n", "Q", "<nop>"); -- nop = do nothing; remap default kep map.
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format); -- format via lsp
vim.keymap.set("n", "<leader>Y", [["+Y]]);
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move selected text up.
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move selected text down.
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- find and replace all wihtin file.
vim.keymap.set("n", "J", "mzJ`z") -- move the next line at the end of current line.
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- go down
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- go up
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- fun : )
vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n", "<leader>bruh", "<cmd>CellularAutomaton game_of_life<CR>")

