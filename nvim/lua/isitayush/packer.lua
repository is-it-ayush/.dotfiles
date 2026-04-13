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

ensure_packer()

return require("packer").startup(function(use)
  -- core
  use("wbthomason/packer.nvim")

  -- ui
  use({ "rose-pine/neovim", as = "rose-pine" })
  use("nvim-tree/nvim-tree.lua")
  use({
    "catgoose/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  })
  use({
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup({})
    end,
  })

  -- navigation
  use("nvim-telescope/telescope.nvim")
  use({
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        show_hidden = true,
        detection_methods = { "pattern" },
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile" },
      })
    end,
  })

  -- tree
  use({
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    run = ":TSUpdate",
  })

  -- lsp + completion
  use({
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- completion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",

      -- snippets
      "L3MON4D3/LuaSnip",
    },
  })

  use({
    "pmizio/typescript-tools.nvim",
    requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("typescript-tools").setup({
        server = {
          on_attach = function(client, bufnr)
          end,
        },
      })
    end,
  })

  -- edit
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })
  use("mbbill/undotree")

  -- git
  use({
    "TimUntersberger/neogit",
    requires = "nvim-lua/plenary.nvim",
  })

  -- latex
  use({
    "lervag/vimtex",
    config = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        options = {
          "-interaction=nonstopmode",
          "-synctex=1",
        },
      }
    end,
  })

  -- utils
  use("laytan/cloak.nvim")
  use("wakatime/vim-wakatime")
  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  })

  -- fun
  use("github/copilot.vim")
  use("eandrju/cellular-automaton.nvim")

  use({ "L3MON4D3/LuaSnip", run = "make install_jsregexp" })
end)
