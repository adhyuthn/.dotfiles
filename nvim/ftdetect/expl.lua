vim.cmd([[
augroup _expl
autocmd!
autocmd BufRead,BufEnter *.expl set syntax=expl
augroup end
]])

require("cmp_dictionary").setup({
  paths = { "/home/evoprime/.config/nvim/snippets/expl.snippets" },
  exact_length = 2,
})

