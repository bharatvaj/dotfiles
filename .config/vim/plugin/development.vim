Plug 'editorconfig/editorconfig-vim'
Plug 'cdelledonne/vim-cmake'
Plug 'vim-syntastic/syntastic'
Plug 'rust-lang/rust.vim'
if has('python')
	" Enable if required, manually
    "Plug 'puremourning/vimspector'
endif
"TODO add windows check
if has('win32')
	Plug 'heaths/vim-msbuild'
endif
Plug 'mattn/emmet-vim'
