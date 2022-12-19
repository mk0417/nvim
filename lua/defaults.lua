--[[ defaults.lua ]]
local g = vim.g
local wo = vim.wo
local opt = vim.opt
local cmd = vim.cmd

g.t_co = 256
g.background = "dark"

wo.signcolumn = 'yes'

-- Show col for max line length
opt.colorcolumn = '80'
-- Show line numbers
opt.number = true
-- Show relative line numbers
opt.relativenumber = true
-- Min num lines of context
opt.scrolloff = 4
-- Show the sign column
opt.signcolumn = 'yes'
-- String encoding to use
opt.encoding = 'utf8'
-- File encoding to use
opt.fileencoding = 'utf8'
-- Allow syntax highlighting
opt.syntax = 'ON'
-- If term supports ui color then enable
opt.termguicolors = true
-- Ignore case in search patterns
opt.ignorecase = true
-- Override ignorecase if search contains capitals
opt.smartcase = true
-- Use incremental search
opt.incsearch = true
-- Highlight search matches
opt.hlsearch = false
-- Use spaces instead of tabs
opt.expandtab = true
-- Size of an indent
opt.shiftwidth = 4
-- Number of spaces tabs count for in insert mode
opt.softtabstop = 4
--  Number of spaces tabs count for
opt.tabstop = 4
-- Place new window to right of current one
opt.splitright = true
-- Place new window below the current one
opt.splitbelow = true
-- CMD
opt.showcmd = true
-- CMD height
opt.cmdheight = 1
-- Disable backup
opt.backup = false
-- Autoindent
opt.autoindent = true
-- Backspace
opt.backspace = 'start,eol,indent'
opt.laststatus = 2
-- Highlight line
opt.cursorline = true
-- Enable yank
opt.clipboard:append {'unnamedplus'}
-- Popup
opt.wildoptions = 'pum'
opt.pumblend = 5
opt.pumheight = 10
opt.pumwidth = 10

-- Highlight yanked text 
cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=300})
  augroup END
]]
