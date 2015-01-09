" Vim syntax file
" " Language: Twitter feeds
" " Maintainer: Mihir Vakharia
" " Latest Revision: 10 Jan 2015

if exists("b:current_syntax")
	finish
endif

" Keywords
syn keyword twtType contained TYP



" Matches
syn match twtUrl 	"http\S\+"
syn match twtUsr 	"@\S\+"
syn match twtHash 	"#\S\+"
syn match twtMatchType 	"\[.*\]"
syn match twtLine 	".*$" contains=twtType,twtMatchType,twtUrl,twtUsr,twtHash


" Highlights
hi def link twtType 		Title
hi def link twtMatchType 	Title
hi def link twtLine 		Type
hi def link twtUrl 		NonText
hi def link twtUsr 		String
hi def link twtHash		LineNr

