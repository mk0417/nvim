--[[ init.lua ]]

-- Leader
vim.g.mapleader = " "

-- Plugins
require('plugins')

-- Better defaults
require('defaults')

-- Keybindings
require('keybindings')

print('Hello Peng')

if vim.g.neovide then
    vim.o.guifont = "Iosevka Comfy:h12"

    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0

    vim.g.neovide_cursor_animation_length = 0
    vim.g.neovide_cursor_vfx_mode = ""
    vim.g.neovide_cursor_antialiasing = false
    vim.g.neovide_cursor_animate_command_line = false
end
