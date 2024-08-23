"(ChatGPT made this) expl.vim - Syntax highlighting for the Expl language

if exists("b:current_syntax")
  finish
endif

" Define comment highlighting (both single-line and multi-line comments)
syntax match explComment "//.*$"
syntax region explComment start="/\*" end="\*/"

" Define keywords
syntax keyword explKeyword main AND OR NOT read write if else then endif while do endwhile begin end decl enddecl return null int str type endtype breakpoint break continue exposcall initialize alloc free

" Define operators
syntax match explOperator "=="
syntax match explOperator "!="
syntax match explOperator "<="
syntax match explOperator ">="
syntax match explOperator "<"
syntax match explOperator ">"
syntax match explOperator "="
syntax match explOperator "-"
syntax match explOperator "+"
syntax match explOperator "*"
syntax match explOperator "/"
syntax match explOperator "%"

" Define number highlighting (integers only)
syntax match explNumber "\<[0-9]\+\>"

" Define string highlighting
syntax region explString start=/"/ end=/"/ contains=explEscape
syntax match explEscape "\\."

" Define identifier (variable) highlighting
syntax match explIdentifier "\<[a-zA-Z_][a-zA-Z0-9_]*\>"

" Define special characters (brackets, parentheses, etc.)
syntax match explSpecialChar "[{}[\]()\.;,]"

" Define error handling for unknown characters
syntax match explError "[^\x00-\x7F]"

" Define highlight groups
highlight link explComment Comment
highlight link explKeyword Keyword
highlight link explOperator Operator
highlight link explNumber Number
highlight link explString String
highlight link explEscape SpecialChar
highlight link explIdentifier Identifier
highlight link explSpecialChar Special
highlight link explError Error

let b:current_syntax = "expl"
