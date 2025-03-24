vim.cmd([[
augroup _spl
autocmd!
autocmd BufRead,BufEnter *.spl set syntax=spl
augroup end
]])

require("cmp_dictionary").setup({
  paths = { "/home/evoprime/.config/nvim/snippets/spl.snippets" },
  exact_length = 2,
})

