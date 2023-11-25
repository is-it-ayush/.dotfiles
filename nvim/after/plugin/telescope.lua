local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {}, { desc = "open file finder" })
vim.keymap.set('n', '<leader>fg', builtin.git_files, {}, { desc = "open git files" })
vim.keymap.set('n', '<leader>fs', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = "grep the whole project" })
vim.keymap.set('n', '<leader>sw', ':Telescope projects<CR>', { desc = "switch projects" });
vim.keymap.set('n', '<leader>vh', ':Telescope keymaps<CR>', { desc = "open keymap help" });
vim.keymap.set('n', '<leader>man', ':Telescope man_pages<CR>', { desc = "open manual pages" });

require('telescope').load_extension('projects')
