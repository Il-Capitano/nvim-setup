let g:polyglot_disabled = ['sensible']

" Specify a directory for plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'windwp/nvim-autopairs'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'mhinz/vim-startify'
Plug 'sheerun/vim-polyglot'
Plug 'christoomey/vim-tmux-navigator'
Plug 'joshdick/onedark.vim'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'frazrepo/vim-rainbow'

call plug#end()

exe 'source '.(stdpath('config').'\rainbow.vim')
exe 'source '.(stdpath('config').'\nerdtree.vim')
exe 'source '.(stdpath('config').'\lightline.vim')
lua require('lsp')
lua require('nvim-cmp')
lua require('nvim-autopairs').setup {}

colorscheme codedark

highlight Keyword guifg=s:yellow
highlight PreProc guifg=Grey
highlight Include guifg=Grey
highlight Define guifg=Grey
highlight PreCondit guifg=Grey
highlight @namespace guifg=Grey
highlight @parameter guifg=Grey
highlight @property guifg=LightGrey
highlight link @class Type
highlight link @struct Type
highlight link @enum Type
highlight link @enumMember Number

highlight! link Keyword Structure
highlight! link Statement Keyword
highlight! link Conditional Keyword
highlight! link Repeat Keyword
highlight! link Label Keyword
highlight! link Operator Keyword
highlight! link Exception Keyword
highlight! link SpecialChar Special

highlight BzAttribute guifg=Grey
highlight BzNamespace guifg=Grey

set number
set relativenumber
set tabstop=4
set shiftwidth=4
set noshowmode
set signcolumn=yes

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
