require("isitayush.remap")
require("isitayush.packer")
require("isitayush.set")
require("isitayush.helpers")

local augroup = vim.api.nvim_create_augroup
local isitayush_group = augroup('isitayush', {})
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

-- Highlight yank
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- Autoformat on save.
autocmd({"BufWritePre"}, {
    group = isitayush_group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Some netrw settings.
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
