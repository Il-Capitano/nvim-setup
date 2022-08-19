" exit if a syntax is already set
if exists("b:current_syntax")
	finish
endif

" keywords
syn keyword bozonKeywords function operator struct import export return type let extern static_assert in break continue __default__ __delete__
syn keyword bozonOperatorKeywords const consteval typeof sizeof move as __forward
syn keyword bozonConditionalKeywords if else switch
syn keyword bozonRepeatKeywords for while
syn keyword bozonLiteralKeywords false true null unreachable
syn keyword bozonTypeKeywords auto void typename int8 int16 int32 int64 uint8 uint16 uint32 uint64 float32 float64 char str bool usize isize

syn match bozonLineComment "//.*$"
syn region bozonBlockComment start="/\*" end="\*/" contains=bozonBlockComment

syn match bozonEscapeSequenceInvalid /\v\\(x\x{0,2}|u\x{0,4}|U\x{0,8}|\_.)/ contained
syn match bozonEscapeSequence /\v\\(\\|'|"|n|t|r|a|b|x[0-7]\x|u[0-9a-cA-C]\x\x\x|u[dD][0-7]\x\x|u[e-fE-F]\x\x\x|U0000[0-9a-cA-C]\x\x\x|U0000[dD][0-7]\x\x|U0000[e-fE-F]\x\x\x|U000[1-9a-fA-F]\x\x\x\x|U0010\x\x\x\x)/ contained
syn region bozonString    start=/"/ end=/\v"(\h\w*)?/ contains=bozonEscapeSequence,bozonEscapeSequenceInvalid
syn region bozonCharacter start=/'/ end=/\v'(\h\w*)?/ contains=bozonEscapeSequence,bozonEscapeSequenceInvalid
syn region bozonRawString start=/"""/ end=/\v"""(\h\w*)?/

syn match bozonNumber /\v<[0-9']+(\.[0-9']+)?([eE][+-]?[0-9]+)?(\h\w*)?>/
syn match bozonNumber /\v0[xX][0-9a-fA-F']+(\h\w*)?/
syn match bozonNumber /\v0[oO][0-7']+(\h\w*)?/
syn match bozonNumber /\v0[bB][01']+(\h\w*)?/

syn match bozonFunction /\v\h\w*((\s|\n)*\()@=/

syn match bozonAttribute /\v\@(\s|\n)*\h\w*/

syn match bozonNamespace /\v\h\w*((\s|\n)*::)@=/

let b:current_syntax = "bozon"
hi def link bozonKeywords Keyword
hi def link bozonOperatorKeywords Keyword
hi def link bozonConditionalKeywords Conditional
hi def link bozonRepeatKeywords Repeat
hi def link bozonLiteralKeywords Boolean
hi def link bozonTypeKeywords Type
hi def link bozonFunction Function

hi def link bozonLineComment Comment
hi def link bozonBlockComment Comment

hi def link bozonEscapeSequence SpecialChar
hi def link bozonEscapeSequenceInvalid Error
hi def link bozonRawString String
hi def link bozonString String
hi def link bozonCharacter String
hi def link bozonNumber Number

hi def link bozonAttribute BzAttribute
hi def link bozonNamespace BzNamespace
