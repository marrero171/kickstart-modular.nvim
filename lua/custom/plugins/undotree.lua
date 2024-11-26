local target_path

return {
  {
    'mbbill/undotree',
    config = function()
      -- Set a keybinding for UndoTreeToggle
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, {
        desc = '[U]ndo Tree Toggle',
      })

      -- Determine the target path for the undo directory based on the OS
      if vim.loop.os_uname().sysname == 'Windows_NT' then
        vim.g.undotree_DiffCommand = 'FC'
        target_path = vim.fn.expand '~\\AppData\\Local\\nvim\\undodir'
      else
        target_path = vim.fn.expand '~/.undodir'
      end

      -- Create the directory if it doesn't exist
      if vim.fn.isdirectory(target_path) == 0 then
        vim.fn.mkdir(target_path, 'p')
      end

      -- Set undo directory and enable persistent undo
      vim.opt.undodir = target_path
      vim.opt.undofile = true
    end,
  },
}
