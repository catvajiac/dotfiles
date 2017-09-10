" Vim syntax file
" Language: c
" Maintainer: Catalina Vajiac

"syn keyword bool true false
"syn keyword conditional if then else switch case
"syn keyword repeats while for do
"syn keyword nums NULL
"syn keyword types const int double float bool void char struct FILE
"syn keyword tdefs typedef return continue break assert goto
"syn keyword Todo TODO contained
"
"syn match commentMatch '//[^\r\n]*' contains=Todo
"syn match types '[A-Za-z]\+_t '
"syn match includes '#[A-Za-z]\+'
"syn match package '<.*.h>'
"syn match macros '#*_*[A-Z]\+_*[A-Z]\+_*'
"syn match nums '\d+'
"
"syn region c_comments start='/\*' end='\*/'
"syn region str_err start='"' end="\n" oneline
"syn region char_err start="'" end="\n" oneline
"syn region str start='"' end='"' oneline
"syn region char start="'" end="'" oneline
"
"let b:current_syntax = "c"
"
"hi def link bool Boolean
"hi def link conditional Conditional
"hi def link repeats Repeat
"hi def link nums Number
"hi def link Todo Todo
"hi def link types Type
"hi def link tdefs TypeDef
"
"hi def link commentMatch Comment
"hi def link includes TypeDef
"hi def link macros Boolean
"hi def link package String
"hi def link types Type
"
"hi def link c_comments Comment
"hi def link str_err Error
"hi def link char_err Error
"hi def link char Character
"hi def link str String
