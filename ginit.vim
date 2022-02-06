set mouse=a

let s:fontsize = 12
function! AdjustFontSize(amount)
	let s:fontsize = s:fontsize + a:amount
	exec "set guifont=Consolas:h" . s:fontsize
endfunction

call AdjustFontSize(0)

nnoremap <C-kPlus> :call AdjustFontSize(1)<CR>
nnoremap <C-kMinus> :call AdjustFontSize(-1)<CR>
inoremap <C-kPlus> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-kMinus> <Esc>:call AdjustFontSize(-1)<CR>a
vnoremap <C-kPlus> :call AdjustFontSize(1)<CR>gv
vnoremap <C-kMinus> :call AdjustFontSize(-1)<CR>gv
