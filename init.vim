let g:polyglot_disabled = ['sensible']
exe 'source '.(stdpath('config').'\rainbow.vim')

" Specify a directory for plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim'
" Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'mhinz/vim-startify'
Plug 'sheerun/vim-polyglot'
Plug 'christoomey/vim-tmux-navigator'
Plug 'joshdick/onedark.vim'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'tomasiser/vim-code-dark'
" Plug 'frazrepo/vim-rainbow'

call plug#end()

exe 'source '.(stdpath('config').'\nerdtree.vim')
exe 'source '.(stdpath('config').'\coc.vim')
exe 'source '.(stdpath('config').'\lightline.vim')

colorscheme codedark

highlight PreProc guifg=Grey
highlight Include guifg=Grey
highlight Define guifg=Grey
highlight PreCondit guifg=Grey
highlight CocSem_namespace guifg=Grey
highlight CocSem_parameter guifg=Grey
highlight CocSem_property guifg=LightGrey
highlight link CocSem_class CocSem_type
highlight link CocSem_enumMember Number

highlight BzAttribute guifg=Grey
highlight BzNamespace guifg=Grey

set number
set relativenumber
set tabstop=4
set shiftwidth=4
set noshowmode

set listchars=tab:→\ ,space:·,trail:·,extends:>,precedes:<
set list
highlight Whitespace guifg=#3F3F46

fun! <SID>StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	keepp %s/\s\+$//e
	call cursor(l, c)
endfun

augroup filetype
	au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END

augroup filetype
	au! BufRead,BufNewFile *.bz     set filetype=bozon
augroup END

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
set laststatus=2

" set shell=pwsh.exe
" tnoremap <Esc> <C-\><C-n>
