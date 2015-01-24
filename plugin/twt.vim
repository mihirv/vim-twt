" " Load this module only once.
if exists('g:loaded_twt')
	finish
endif
let g:loaded_twitvim = '0.0.2 2015-01-26'

" Check Vim version
if v:version < 703
	echohl WarningMsg
	echomsg 'You need Vim 7.3 or later for this version of TwitVim'
	echohl None 
	finish
endif

function! MoveSelectedLinesToFile(filename)
	exec ":cd %:p:h"
	exec "'<,'>w! >>" . a:filename
	norm gvd
endfunc

command! -nargs=1 -range Sbak call MoveSelectedLinesToFile(<f-args>)

if !hasmapto('Sbak')
	  map <leader>f :Sbak ../follow_up.twt<CR>
end
