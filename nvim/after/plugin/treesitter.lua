require 'nvim-treesitter'.setup {
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,
}

vim.api.nvim_create_autocmd('VimEnter', {
  once = true,
  callback = function()
    local want = {
      'lua', 'python', 'typescript', 'c', 'rust',
      'json', 'html', 'css', 'javascript', 'tsx'
    }
    local installed = require('nvim-treesitter.config').get_installed()
    local missing = vim.iter(want)
        :filter(function(p) return not vim.tbl_contains(installed, p) end)
        :totable()
    if #missing > 0 then
      require('nvim-treesitter').install(missing)
    end
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    if ft == '' then return end

    local ok = pcall(vim.treesitter.start, args.buf)
    if not ok then return end

    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'
    vim.wo[0][0].foldlevel = 99
  end,
})
