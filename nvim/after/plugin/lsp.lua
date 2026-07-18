vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }
    -- these will be buffer-local keybindings
    -- because they only work if you have an active language server
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "g", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "td", function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "gw", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "g0", function() vim.lsp.buf.document_symbol() end, opts)
    vim.keymap.set("n", "ga", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
  end
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- mason setup
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({
        capabilities = lsp_capabilities,
      })
    end,
  },
})


vim.lsp.config('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {
      assist = {
        importGranularity = {
          group = "module"
        },
        importPrefix = "self"
      },
      -- enable proc macro support
      cargo = { loadOutDirsFromCheck = true, buildScripts = { enable = true } },
      procMacro = { enable = true },
    }
  }
})
vim.lsp.config('basedpyright', {
  settings = {
    basedpyright = {
      analysis = {
        diagnosticMode = "openFilesOnly",
        typeCheckingMode = "standard",
        inlayHints = {
          callArgumentNames = true
        }
      }
    }
  }
})

-- tailwindcss setup
vim.lsp.config('tailwindcss', {
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          "tw`([^`]*)", -- tw`...`
          "tw\\.\\w+`([^`]*)", -- tw.xxx`...`
          "tw\\(.*?\\)`([^`]*)", -- tw(...)`...`
          "styled\\(.*?\\)`([^`]*)", -- styled(...)`...`
          "clsx\\(([^)]*)\\)", -- clsx(...)
          "classnames\\(([^)]*)\\)", -- classnames(...)
          "cva\\(([^)]*)\\)", -- cva(...)
        },
      },
    },
  },
})

vim.lsp.config('hdl_checker', {
  cmd = { 'hdl_checker', '--lsp' },
  filetypes = { 'verilog', 'systemverilog', 'vhdl' },
  root_dir = function(fname)
    return vim.fs.dirname(vim.fs.find({ '.hdl_checker.json' }, { upward = true, path = fname })[1])
  end,
  capabilities = lsp_capabilities,
})

vim.lsp.config('texlab', {
  settings = {
    texlab = {
      build = {
        onSave = false,
      },
    },
  },
})

-- completion setup
local cmp = require('cmp')
cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.SelectBehavior.Replace, select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<Tab>'] = nil,
    ['<S-Tab>'] = nil
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

-- add log command to invoke and uninvoke
-- :lua vim.cmd.edit(vim.fn.stdpath("state") .. "/lsp.log")

vim.api.nvim_create_user_command("LspLogClear", function()
  local log_path = vim.fs.joinpath(vim.fn.stdpath("state"), "lsp.log")
  if vim.fn.filereadable(log_path) == 1 then
    vim.fn.writefile({}, log_path)
    print("LSP log cleared.")
  else
    print("LSP log file does not exist.")
  end
end, { desc = "Clear LSP log" })

vim.api.nvim_create_user_command("LspLog", function()
  local log_path = vim.fs.joinpath(vim.fn.stdpath("state"), "lsp.log")
  if vim.fn.filereadable(log_path) == 1 then
    vim.cmd.edit(log_path)
  else
    print("LSP log file does not exist.")
  end
end, { desc = "Toggle LSP log" })

vim.api.nvim_create_user_command("LspRestart", function()
  for _, client in ipairs(vim.lsp.get_clients()) do
    if client.name ~= "copilot" then -- exclude copilot from restart
      client.stop()
    end
  end
  vim.cmd.edit() -- trigger LSP re-attach by reopening the current buffer
end, { desc = "Restart LSP" })
