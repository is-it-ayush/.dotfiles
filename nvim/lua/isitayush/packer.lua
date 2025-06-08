-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

-- Ensure that packer is installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  -- core plugins
  use("wbthomason/packer.nvim")                                 -- load packer
  use("nvim-telescope/telescope.nvim", { tag = "0.1.4" })       -- fuzzy finder for files, buffers, etc.
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" }) -- syntax highlighting & stuff
  use({
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/mason.nvim",           -- manage lsp servers
      "williamboman/mason-lspconfig.nvim", -- lsp server config
      "hrsh7th/nvim-cmp",                  -- completion engine
      "hrsh7th/cmp-nvim-lsp",              -- lsp completion source
      "hrsh7th/cmp-buffer",                -- buffer completion
      "hrsh7th/cmp-path",                  -- path completion
      "L3MON4D3/LuaSnip",                  -- snippet engine
    },
  })
  use({
    "pmizio/typescript-tools.nvim",
    requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("typescript-tools").setup({})
    end,
  }) -- replacement for typescript-language-server
  use({
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup({
        icon = false,
      })
    end,
  })                                                                    -- pretty diagnostics list
  use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" }) -- git in nvim
  use("mbbill/undotree")                                                -- helps u go back in time
  use("nvim-tree/nvim-tree.lua")                                        -- file tree
  use({ "L3MON4D3/LuaSnip", run = "make install_jsregexp" })            -- snippets

  -- theme plugin
  use({ "rose-pine/neovim", as = "rose-pine" }) -- nvim theme

  -- other plugins
  use("laytan/cloak.nvim")               -- stuff in env files
  use("github/copilot.vim")              -- ai suggestions
  use("eandrju/cellular-automaton.nvim") -- fun stuff
  use({
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        show_hidden = true,
        detection_methods = { "pattern" },
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile" },
      })
    end,
  }) -- switch between git projects
  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  }) -- use diagnostic lines to show errors
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })                           -- comment stuff
  use("wakatime/vim-wakatime") -- track time spent in nvim
end)
