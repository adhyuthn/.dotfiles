--[[ -- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'

-- Change TABs to Spaces
vim.opt.expandtab = true

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

vim.o.ignovvim.o.ignorim.o.ignorrecase = true
vim.o.smarvvim.o.smartim.o.smarttcase = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.rnu = true
vim.keymap.set('v', 'il', ':<C-U>normal ^vg_<CR>', { noremap = true, desc = 'select inside line'} )

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
vim.opt.modeline = false

require('lazy').setup({
  -- tpope esentials
  'tpope/vim-surround',
}, {}) ]]
