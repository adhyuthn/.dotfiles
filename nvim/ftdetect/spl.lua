vim.cmd([[
augroup _spl
autocmd!
autocmd BufRead,BufEnter *.spl set syntax=asm
augroup end
]]) 
