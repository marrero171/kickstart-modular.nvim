-- GDscript stuff
-- GDscript LSP setup for Godot
if vim.loop.os_uname().sysname == 'Windows_NT' then
  -- Windows-specific setup
  local port = os.getenv 'GDScript_Port' or 6005
  local cmd = { 'ncat', '127.0.0.1', port }
  local pipe = [[\\.\pipe\godot.pipe]]

  -- Function to start the Godot LSP
  local function start_godot_lsp()
    vim.lsp.start {
      name = 'Godot',
      cmd = cmd,
      root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
      on_attach = function(client, bufnr)
        vim.api.nvim_command([[echo serverstart(']] .. pipe .. [[')]])
      end,
    }
  end

  -- Set up an autocommand for GDScript file type
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'gdscript',
    callback = function()
      start_godot_lsp()
    end,
  })
else
  -- Non-Windows setup
  local port = os.getenv 'GDScript_Port' or 6005
  local cmd = vim.lsp.rpc.connect('127.0.0.1', port)

  -- Function to start the Godot LSP
  local function start_godot_lsp()
    vim.lsp.start {
      name = 'Godot',
      cmd = cmd,
      root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
      on_attach = function(client, bufnr) end,
    }
  end

  -- Set up an autocommand for GDScript file type
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'gdscript',
    callback = function()
      start_godot_lsp()
    end,
  })
end
