vim.api.nvim_set_keymap('n', '<C-=>', ':lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-->', ':lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-0>', ':lua vim.g.neovide_scale_factor = 1<CR>', { silent = true })

-- Paste with Ctrl+Shift+V
vim.keymap.set('n', '<C-S-v>', '"+P', { noremap = true, silent = true }) -- Paste in normal mode
vim.keymap.set('v', '<C-S-v>', '"+P', { noremap = true, silent = true }) -- Paste in visual mode
vim.keymap.set('c', '<C-S-v>', '<C-R>+', { noremap = true, silent = true }) -- Paste in command mode
vim.keymap.set('i', '<C-S-v>', '<ESC>l"+Pli', { noremap = true, silent = true }) -- Paste in insert mode

-- Allow clipboard copy-paste globally with Ctrl+Shift+V
vim.api.nvim_set_keymap('', '<C-S-v>', '"+p<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('!', '<C-S-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-S-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-S-v>', '"+P', { noremap = true, silent = true })
