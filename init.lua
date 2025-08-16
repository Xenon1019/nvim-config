require('remaps')
require('config.lazy')
require('config.lsp')
require('config.options')

 -- Telescope Keymaps
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})

--Set Theme: rosepine
vim.cmd("colorscheme rose-pine")

-- Load telescope-ui-select plugin
require("telescope").load_extension("ui-select")
