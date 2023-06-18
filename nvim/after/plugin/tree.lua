local function override_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

require("nvim-tree").setup({
  renderer = {
    icons = {
      webdev_colors = false,
      padding = " ",
      git_placement = "before",
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = true,
        modified = true,
      },
      glyphs = {
       git = {
          unstaged = "NS",
          staged = "S",
          unmerged = "NU",
          renamed = "R",
          untracked = "T",
          deleted = "D",
          ignored = "I",
        },
      },
    },
  },
  on_attach = override_on_attach,
})
