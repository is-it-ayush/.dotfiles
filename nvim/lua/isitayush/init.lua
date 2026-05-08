require("isitayush.remap")
require("isitayush.packer")
require("isitayush.set")
require("isitayush.helpers")

local isitayush_group = vim.api.nvim_create_augroup('isitayush', {})

-- fold
-- vim.wo.foldmethod = "indent"
-- vim.o.foldlevelstart = 99


-- autoformat on save
vim.api.nvim_create_autocmd({"BufWritePre"}, {
    group = isitayush_group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- netrw settings. (disabled in favor of nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

--
vim.g.termguicolors = true

vim.diagnostic.config({
  virtual_text = true,
  virtual_lines = false,
})

-- tell copilot to not use tab keymap
-- vim.g.copilot_no_tab_map = true

