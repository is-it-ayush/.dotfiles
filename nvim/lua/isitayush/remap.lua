vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Window & Terminal Shortcuts: )
vim.keymap.set("n", "ss", "<cmd>:split<CR>", { desc = "new horizontal window" })                             -- horizontal window
vim.keymap.set("n", "sv", "<cmd>:vsplit<CR>", { desc = "new vertical window" })                              -- vertical window
vim.keymap.set("n", "sx", "<cmd>:close<CR>", { desc = "close window" })                                      -- close window
vim.keymap.set("n", "te", ":tabedit<Return>", { desc = "new tab" })                                          -- new tab
vim.keymap.set("n", "<tab>", ":tabnext<Return>", { noremap = true, silent = true, desc = "next tab" })       -- next tab
vim.keymap.set("n", "<s-tab>", ":tabprev<Return>", { noremap = true, silent = true, desc = "previous tab" }) -- prev tab
vim.keymap.set("n", "ht", "<cmd>:split | terminal<CR>", { desc = "new horizontal terminal" })                -- new horizontal terminal
vim.keymap.set("n", "vt", "<cmd>:vsplit | terminal<CR>", { desc = "new vertical terminal" })                 -- new vertical terminal

-- Other shortcuts.
vim.keymap.set("n", "Q", "<nop>")                                                                                      -- nop = do nothing; remap default kep map.
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", { noremap = true })                                                        -- remap ESC key in terminal mode.
vim.keymap.set("n", "<leader>bo", "<cmd>%bd|e#<cr>", { desc = "close all buffers except current one" })                -- close all buffers except current one: https://stackoverflow.com/a/42071865/516188
vim.keymap.set("n", "<leader>gg", "<cmd>:Neogit<cr>", { desc = "open neogit" })                                        -- neogit
vim.keymap.set("n", "<leader>lg", "<cmd>:LazyGit<cr>", { desc = "open lazygit" })                                      -- lazygit
vim.keymap.set("n", "<C-q>", ":NvimTreeToggle<cr>", { silent = true, noremap = true, desc = "toggle directory tree" }) -- dir tree

-- toggle things
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "toggle undo tree" })                  -- toggle undo tree
vim.keymap.set("", "<leader>l", require("lsp_lines").toggle, { desc = "toggle lsp lines" })              -- toggle lsp lines.
vim.keymap.set("n", "<leader>tt", "<cmd>:Trouble diagnostics<CR>", { silent = true, desc = "toggle trouble" }) -- toogle trouble

-- lsp
vim.keymap.set("n", "<C-j>", function() -- jump to next problem
  vim.diagnostic.goto_next()
end, { desc = "jump to next diagnostic" })
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
end, { desc = "format buffer" }) -- format via lsp

-- text stuff
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move selected text up" })   -- move selected text up.
vim.keymap.set("n", "y", [["+Y]], { desc = "copy current line" })                  -- copy current line.
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move selected text down" }) -- move selected text down.
vim.keymap.set(
  "n",
  "fr",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "find and replace all within buffer" }
)                                                                                                   -- find and replace all wihtin file.
vim.keymap.set("n", "J", "mzJ`z", { desc = "fold next line to current line" })                      -- move the next line at the end of current line.
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "go down" })                                       -- go down
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "go up" })                                         -- go up
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "select all" })                                   -- select all
vim.keymap.set("n", "n", "nzzzv", { desc = "next search word" })                                    -- next search word
vim.keymap.set("n", "N", "Nzzzv", { desc = "prev search word" })                                    -- prev search word
vim.keymap.set("n", "<C-[>", "<C-T>", { noremap = true, silent = true, desc = "prev tag" })         -- prev tag
vim.keymap.set("n", "fe", "za", { noremap = true, desc = "toggle text fold" })                      -- fold
vim.keymap.set("n", "fv", "<C-v>", { noremap = true, silent = true, desc = "vim motion ctrl + v" }) -- does some stuff
vim.keymap.set(
  "i",
  "fh",
  'copilot#Accept("\\<CR>")',
  { expr = true, replace_keycodes = false, desc = "accept copilot remap" }
) -- copilot tab remap

-- fun : )
vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "meme: gravity mod" })
vim.keymap.set("n", "<leader>bruh", "<cmd>CellularAutomaton game_of_life<CR>", { desc = "meme: convey's game of life" })

