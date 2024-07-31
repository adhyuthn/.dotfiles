vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Lazy package Manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	{'mg979/vim-visual-multi', branch = 'master'},
}, {})


-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'

-- Change TABs to Spaces
vim.opt.expandtab = true

vim.o.list = true
local space = "·"
vim.opt.listchars:append {
	multispace = space,
	lead = space,
	trail = space,
	nbsp = space
}

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.termguicolors = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.rnu = true

-- Mappings
vim.keymap.set('v', 'il', ':<C-U>normal ^vg_<CR>', { noremap = true, desc = 'select inside line'} )

