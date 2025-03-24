vim.cmd([[
augroup _xsm
autocmd!
autocmd BufRead,BufEnter *.xsm set syntax=xsm
augroup end
]])

require("cmp_dictionary").setup({
  paths = { "/home/evoprime/.config/nvim/snippets/xsm.snippets" },
  exact_length = 2,
})

