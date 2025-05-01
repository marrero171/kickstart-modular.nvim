-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'tveskag/nvim-blame-line',
    config = function()
      vim.keymap.set('n', '<leader>cb', '<cmd>:ToggleBlameLine<CR>', {
        desc = 'Toggle [B]lame Line',
      })
    end,
  },
  {
    'phelipetls/vim-hugo',
  },
  {
    'robertbasic/vim-hugo-helper',
    config = function() end,
  },
}
