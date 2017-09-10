" Vim syntax file
" Language: cminor
" Maintainer: Catalina Vajiac

syn keyword lug_steeve while for if else
syn keyword function function
syn keyword lug_doog print return
syn keyword lug_8bit integer boolean string void char
syn keyword momo true
syn keyword mome false
syn keyword Todo TODO contained

syn match commentMatch '//[^\r\n]* ' contains=Todo
syn match asdf '\d+'

syn region c_comments start='/\*' end='\*/'
syn region str start='"' end ='"' oneline

let b:current_syntax = "cminor"

hi def link lug_steeve Repeat
hi def link function Function
hi def link lug_doog Conditional
hi def link lug_8bit Type
hi def link momo Float
hi def link mome Boolean
hi def link asdf Number
hi def link commentMatch Comment
hi def link c_comments Comment
hi def link str String
