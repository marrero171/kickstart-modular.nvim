local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Remap leader key
keymap('n', '<Space>', '', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Yank to system clipboard
keymap({ 'n', 'v' }, '<leader>y', '"+y', opts)

-- Paste from system clipboard
keymap({ 'n', 'v' }, '<leader>p', '"+p', opts)

-- Better indent handling
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move text up and down
keymap('v', 'J', ':m .+1<CR>==', opts)
keymap('v', 'K', ':m .-2<CR>==', opts)
keymap('x', 'J', ":move '>+1<CR>gv-gv", opts)
keymap('x', 'K', ":move '<-2<CR>gv-gv", opts)

-- Paste preserves the original yanked piece
keymap('v', 'p', '"_dP', opts)

-- Remove highlighting after search
keymap('n', '<Esc>', '<Esc>:noh<CR>', opts)

-- Helper function for vscode actions
local function vscmap(mode, lhs, action)
  keymap(mode, lhs, "<cmd>lua require('vscode').action('" .. action .. "')<CR>", opts)
end

-- General keymaps
vscmap({ 'n', 'v' }, '<leader>t', 'workbench.action.terminal.toggleTerminal')
vscmap({ 'n', 'v' }, '<leader>b', 'editor.debug.action.toggleBreakpoint')
vscmap({ 'n', 'v' }, '<leader>q', 'editor.action.quickFix')
vscmap({ 'n', 'v' }, '<leader>sp', 'workbench.actions.view.problems')
vscmap({ 'n', 'v' }, '<leader>cn', 'notifications.clearAll')
vscmap({ 'n', 'v' }, '<leader>cp', 'workbench.action.showCommands')
vscmap({ 'n', 'v' }, '<leader>cb', 'gitlens.toggleFileBlame')
vscmap({ 'n', 'v' }, '<leader>fd', 'editor.action.formatDocument')

vscmap({ 'n', 'v' }, '<leader>ws', 'workbench.action.gotoSymbol')
-- Searching keymaps
vscmap({ 'n', 'v' }, '<leader>sf', 'workbench.action.quickOpen')
vscmap({ 'n', 'v' }, '<leader>sg', 'workbench.action.findInFiles')

-- Debugging
vscmap({ 'n', 'v' }, '<leader>d', 'workbench.debug.action.toggleRepl')
