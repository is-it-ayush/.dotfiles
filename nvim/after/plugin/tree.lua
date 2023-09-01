local function override_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

require("nvim-tree").setup({
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
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
          unstaged = "US",
          staged = "S",
          unmerged = "UM",
          renamed = "R",
          untracked = "UT",
          deleted = "D",
          ignored = "I",
        },
      },
    },
  },
  on_attach = override_on_attach,
})
