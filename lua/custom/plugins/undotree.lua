return {
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, {
        desc = '[U]ndo Tree Toggle',
      })

      -- Set undotree_DiffCommand to 'FC' only on Windows
      if vim.loop.os_uname().sysname == 'Windows_NT' then
        vim.g.undotree_DiffCommand = 'FC'
      end
    end,
  },
}
