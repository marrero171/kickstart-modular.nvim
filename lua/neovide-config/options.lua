vim.o.guifont = 'Mononoki Nerd Font Mono' -- text below applies for VimScript
vim.g.neovide_floating_shadow = true
vim.g.neovide_floating_z_height = 10
vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5

vim.g.neovide_hide_mouse_when_typing = true
vim.g.experimental_layer_grouping = false

vim.g.neovide_refresh_rate = 60
vim.g.neovide_cursor_animation_length = 0.1
vim.g.neovide_cursor_trail_size = 0.85
vim.g.neovide_cursor_smooth_blink = true
vim.g.neovide_cursor_vfx_particle_lifetime = 1 -- Lower value makes it faster
vim.g.neovide_cursor_vfx_particle_density = 30.0 -- Higher value increases particle density
vim.g.neovide_cursor_vfx_particle_speed = 30.0 -- Higher value increases speed
vim.g.neovide_cursor_vfx_mode = 'railgun'
vim.g.neovide_cursor_vfx_particle_curl = 0.2
vim.g.neovide_cursor_vfx_particle_phase = 10
vim.g.neovide_window_blurred = true
-- Helper function for transparency formatting
local alpha = function()
  return string.format('%x', math.floor((255 * vim.g.transparency) or 0.8))
end
-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
vim.g.neovide_transparency = 0.6
vim.g.transparency = 0
vim.g.neovide_background_color = '#0f1117' .. alpha()
