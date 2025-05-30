return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      -- REQUIRED
      harpoon:setup()
      -- REQUIRED

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = '[A]dd to Harpoon' })
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set('n', '<C-h>', function() -- H key in windows
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<C-j>', function() -- J key in windows
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<C-k>', function() -- K key in windows
        harpoon:list():select(3)
      end)
      vim.keymap.set('n', '<C-l>', function() -- L key in windows
        harpoon:list():select(4)
      end)

      -- Toggle previous & next buffers stored within Harpoon list
      -- TODO: These keys are in use by Konsole
      vim.keymap.set('n', '<C-S-P>', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<C-S-N>', function()
        harpoon:list():next()
      end)
    end,
  },
}
