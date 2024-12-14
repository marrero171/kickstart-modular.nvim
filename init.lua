--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

What is Kickstart?

  Kickstart.nvim is *not* a distribution.

  Kickstart.nvim is a starting point for your own configuration.
    The goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    Once you've done that, you can start exploring, configuring and tinkering to
    make Neovim your own! That might mean leaving Kickstart just the way it is for a while
    or immediately breaking it into modular pieces. It's up to you!

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know the Neovim basics, you can skip this step.)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua.

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite Neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or Neovim features used in Kickstart.

   NOTE: Look for lines like this

    Throughout the file. These are for you, the reader, to help you understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your Neovim config.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Check if the system is Windows, then use powershell if it is
-- if vim.loop.os_uname().sysname == 'Windows_NT' then
--   -- Set up PowerShell as the default shell in Neovim
--   vim.opt.shell = vim.fn.executable 'pwsh' == 1 and 'pwsh' or 'powershell'
--   vim.opt.shellcmdflag =
--     "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';Remove-Alias -Force -ErrorAction SilentlyContinue tee;"
--   vim.opt.shellredir = "2>&1 | %%{ '$_' } | Out-File %s; exit $LastExitCode"
--   vim.opt.shellpipe = "2>&1 | %%{ '$_' } | tee %s; exit $LastExitCode"
--   vim.opt.shellquote = ''
--   vim.opt.shellxquote = ''
-- end
if vim.g.vscode then
  -- VSCode extension
  require 'vscode-config.keymaps'
else
  -- ordinary Neovim
  -- [[ Setting options ]]
  require 'options'

  -- [[ Basic Keymaps ]]
  require 'keymaps'

  -- [[ Install `lazy.nvim` plugin manager ]]
  require 'lazy-bootstrap'

  -- [[ Configure and install plugins ]]
  require 'lazy-plugins'

  -- The line beneath this is called `modeline`. See `:help modeline`
  -- vim: ts=2 sts=2 sw=2 et

  require 'godotlsp'
end
if vim.g.neovide == true then
  vim.api.nvim_set_keymap('n', '<C-+>', ':lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>', { silent = true })
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

  vim.o.guifont = 'Mononoki Nerd Font Mono:h14' -- text below applies for VimScript
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5

  vim.g.neovide_hide_mouse_when_typing = true

  vim.g.neovide_cursor_animation_length = 0.08
  vim.g.neovide_cursor_trail_size = 0.8
  vim.g.neovide_cursor_smooth_blink = false
  vim.g.neovide_cursor_vfx_mode = 'ripple'
end
