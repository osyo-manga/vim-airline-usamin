scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim


let s:count = 0
let s:last_time = 0

function! airline#extensions#usamin#update()
	let time = str2float(reltimestr(reltime()))
	let usamin =[
	\		"(*ﾟ∀ﾟ)o彡ﾟﾐﾐﾐﾝ！",
	\		"(*ﾟ∀ﾟ)o彡ﾟﾐﾐﾐﾝ！ﾐﾐﾐﾝ！",
	\		"(*ﾟ∀ﾟ)o彡ﾟﾐﾐﾐﾝ！ﾐﾐﾐﾝ！ｳｰ",
	\		"(*ﾟ∀ﾟ)o彡ﾟﾐﾐﾐﾝ！ﾐﾐﾐﾝ！ｳｰｻﾐﾝ!!",
	\]
	if (time - s:last_time) > 0.45
		let s:count += 1
		let s:last_time = time
	endif
	return usamin[ s:count % len(usamin) ]
endfunction


function! airline#extensions#usamin#init(...)
	let g:airline_section_c = g:airline_section_c .  ' %{airline#extensions#usamin#update()}'
endfunction


augroup airline-usamin
	autocmd!
	autocmd CursorHold  * call feedkeys("g\<ESC>", 'n')
	autocmd CursorHoldI  * call feedkeys("\<C-g>\<ESC>", 'n')
augroup END


let &cpo = s:save_cpo
unlet s:save_cpo
