hi clear
syntax reset
let g:colors_name = "evo"
set background=dark
set t_Co=256

hi Pmenu guifg=#b6a0ff guibg=#2f2548
hi SignColumn guibg=#1a1425
hi Title guifg=#b6a0ff
hi NonText guifg=#cdd6f4 guibg=#1a1425
hi Comment guifg=#a7a7a7 gui=italic
hi SpecialComment guifg=#a7a7a7 gui=italic guibg=NONE
hi CursorLine guibg=NONE
hi TabLineFill gui=NONE guibg=#b6a0ff
hi TabLine guifg=#1a1425 guibg=#b6a0ff gui=NONE
hi StatusLine gui=bold guibg=#2f2548 guifg=#b6a0ff
hi StatusLineNC gui=NONE guibg=#1a1425 guifg=#b6a0ff
hi Search guibg=#b6a0ff guifg=#1a1425
hi VertSplit gui=NONE guifg=#2f2548 guibg=NONE
hi Visual gui=NONE guibg=#42335E
hi IndentLineCurrent guifg=#b6a0ff
hi IndentLine guifg=#504670

" Define basic colors for common syntax groups
highlight Comment         guifg=#6c7086    ctermfg=243
highlight Punctuation     guifg=#9399b2    ctermfg=145
highlight String          guifg=#89b4fa    ctermfg=108
highlight Keyword         guifg=#a6e3a1    ctermfg=177
highlight Constant        guifg=#eba0ac    ctermfg=174
highlight DocString       guifg=#7f849c    ctermfg=245
highlight Type            guifg=#b4befe    ctermfg=153
highlight Function        guifg=#cba6f7    ctermfg=75
highlight Identifier      guifg=#cdd6f4    ctermfg=81
highlight Decorator       guifg=#94e2d5    ctermfg=116
highlight Parameter       guifg=#f2cdcd    ctermfg=217
highlight Special         guifg=#fab387    ctermfg=215
highlight Text            guifg=#cdd6f4    ctermfg=188

" Numbers, Booleans, and Other Constants
highlight Number          guifg=#f9e2af    ctermfg=223
highlight Boolean         guifg=#f9e2af    ctermfg=223
highlight Float           guifg=#f9e2af    ctermfg=223
highlight ConstantOther   guifg=#f9e2af    ctermfg=223

" Specific cases for styling
highlight KeywordBold     gui=bold         guifg=#cba6f7    ctermfg=177
highlight ItalicBold      gui=italic,bold  guifg=#89b4fa    ctermfg=75
highlight Italic          gui=italic       guifg=#6c7086    ctermfg=243
highlight Normal          guifg=#b6a0ff    guibg=#1a1425
highlight Bold            gui=bold         guifg=#cdd6f4    ctermfg=188

" Special Characters and Brackets
highlight SpecialChar     guifg=#eba0ac    ctermfg=174
highlight Delimiter       guifg=#9399b2    ctermfg=145
highlight MatchParen      guibg=#494d64    guifg=#ffff00    ctermbg=236 ctermfg=188
highlight SpecialKey      guifg=#74c7ec    ctermfg=81

" Links for semantic tokens
highlight link TypeBuiltIn          Type
highlight link FunctionBuiltin      Special
highlight link Decorator            Decorator
highlight link SelfParameter        Special
highlight link EnumDeclaration      Special
highlight link Enum                 Identifier
highlight link Class                Identifier
highlight link ClassDeclaration     Special

" Additional links for other commonly used groups
highlight link Number               Constant
highlight link Boolean              Constant
highlight link Float                Constant
highlight link SpecialChar          Special

" Enable bold, italic styles where applicable
highlight ParameterBold     gui=bold guifg=#f5e0dc ctermfg=188
highlight SelfParameterItalic guifg=#fab387 gui=italic ctermfg=215

" Git integration coloring 
highlight DiffAdd        ctermbg=4 guifg=#a6e3a1 guibg=#1a1425
highlight DiffChange     ctermbg=5 guifg=#fab387 guibg=#1a1425
highlight DiffDelete     ctermfg=12 ctermbg=6 gui=bold guifg=#eba0ac guibg=#1a1425
highlight DiffText       cterm=bold ctermbg=9 gui=bold guifg=#cdd6f4 guibg=#1a1425

hi EndOfBuffer guifg=bg   
hi LineNr guifg=#7760c3
