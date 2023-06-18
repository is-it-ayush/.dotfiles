require("isitayush.remap")
require("isitayush.packer")
require("isitayush.set")
require("isitayush.helpers")

local augroup = vim.api.nvim_create_augroup
local isitayush_group = augroup('isitayush', {})
local autocmd = vim.api.nvim_create_autocmd

-- Autoformat on save.
autocmd({"BufWritePre"}, {
    group = isitayush_group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Some netrw settings. (disabled in favor of nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

--
vim.g.termguicolors = true
