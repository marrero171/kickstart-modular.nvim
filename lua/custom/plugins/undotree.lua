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

      if vim.fn.has 'persistent_undo' == 1 then
        -- Create the directory if it does not exist
        if vim.fn.isdirectory(target_path) == 0 then
          vim.fn.mkdir(target_path, 'p', 0700)
        end

        -- Set the undo directory and enable persistent undo
        vim.opt.undodir = target_path
        vim.opt.undofile = true
      end
    end,
  },
}
