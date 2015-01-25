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

if !has("ruby")
  echohl ErrorMsg
  echon "Sorry, the 'Open Twt URL' plugin requires Ruby support."
  finish
end

ruby << EOF
  def twt_url
    re = %r{twt(\d+): @(\w+)}

    line = VIM::Buffer.current.line
    urls = line.scan(re).flatten

    if urls.empty?
      VIM::message("No Tweet ID detected to Open")
    else
      url = 'https://twitter.com/' + urls[1] + '/status/' + urls[0]
      system("open", url)
      VIM::message('Opening Tweet: ' + url)
    end
  end
EOF

function! s:OpenTwtURL()
  ruby twt_url
endfunction

command! -range OpenTwtURL execute '<line1>,<line2>call <SID>OpenTwtURL()'

if !hasmapto('OpenTwtURL')
	  map <leader>t :OpenTwtURL<CR>
end

function! MoveSelectedLinesToFile(filename)
	exec ":cd %:p:h"
	exec "'<,'>w! >>" . a:filename
	norm gvd
endfunc

command! -nargs=1 -range Sbak call MoveSelectedLinesToFile(<f-args>)

if !hasmapto('Sbak')
	  map <leader>f :Sbak ../follow_up.twt<CR>
end
