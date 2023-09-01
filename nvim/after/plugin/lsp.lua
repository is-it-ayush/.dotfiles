local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
  ['<Tab>'] = nil,
  ['<S-Tab>'] = nil
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})


lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  -- cod nav
  vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)

  -- docs & info
  vim.keymap.set("n", "g", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "td", function() vim.lsp.buf.type_defination() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

  vim.keymap.set("n", "gw", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "g0", function() vim.lsp.buf.document_symbol() end, opts)

  -- actions
	vim.keymap.set("n", "ga", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
end)

require('lspconfig').rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
        importPrefix = "by_self"
      },
      -- enable proc macro support
      cargo = {loadOutDirsFromCheck = true},
      procMacro = {enable = true}
    }
  }
});

lsp.setup()
