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

local plugins = {}
local opts = {}

require("tandang.core")
require("lazy").setup({ import = "tandang.plugins"}, opts)

-- Add the highlight definitions here to make them default
-- Make the remaining parts of Telescope and floating windows transparent
vim.cmd([[ highlight TelescopeBorder guibg=NONE ]])
vim.cmd([[ highlight TelescopePromptNormal guibg=NONE ]])
vim.cmd([[ highlight TelescopePromptBorder guibg=NONE ]])
vim.cmd([[ highlight TelescopeResultsNormal guibg=NONE ]])
vim.cmd([[ highlight TelescopePreviewNormal guibg=NONE ]])
vim.cmd([[ highlight TelescopePromptTitle guibg=NONE ]])
vim.cmd([[ highlight TelescopeResultsTitle guibg=NONE ]])
vim.cmd([[ highlight TelescopePreviewTitle guibg=NONE ]])

vim.cmd([[ highlight FloatBorder guibg=NONE ]])     -- Transparent border for floating windows
vim.cmd([[ highlight NormalNC guibg=NONE ]])
vim.cmd([[ highlight NormalFloat guibg=NONE ]])     -- Transparent floating window background

vim.cmd([[ highlight NeoTreeNormal guibg=NONE ]])   -- Transparent background for Neo-tree floating window

vim.cmd([[ highlight WhichKeyFloat guibg=NONE ]])
vim.cmd([[ highlight WhichKeyNormal guibg=NONE ]])
