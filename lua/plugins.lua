-- [[ plugins.lua ]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    require("config.theme"),
    require('config.whichkey'),
    require("config.telescope").config,
    require('config.programming'),
    require('config.editing'),
    require('config.project'),
    require('config.completion'),
    require('config.ui'),
    require('config.latex'),
    require('config.lsp'),
})
