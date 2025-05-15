local dap = require 'dap'
dap.adapters.godot = {
  type = 'server',
  host = '127.0.0.1',
  port = 6006,
}
dap.configurations.gdscript = {
  {
    type = 'godot',
    request = 'launch',
    name = 'Launch scene',
    project = '${workspaceFolder}',
  },
}

-- All configuration options:
--[[
{
	"name": "Launch",
	"type": "godot",
	"request": "launch",
	"project": "${workspaceFolder}",
	"address": "127.0.0.1",
	"port": 6007,
	"scene": "main|current|pinned|<path>",
	"editor_path": "<path>",
	// engine command line flags
	"profiling": false,
	"single_threaded_scene": false,
	"debug_collisions": false,
	"debug_paths": false,
	"debug_navigation": false,
	"debug_avoidance": false,
	"debug_stringnames": false,
	"frame_delay": 0,
	"time_scale": 1.0,
	"disable_vsync": false,
	"fixed_fps": 60,
	// anything else
	"additional_options": ""
} ]]
