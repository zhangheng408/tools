set nocompatible
set autoindent
set number
set showcmd
set ruler
set hlsearch
set incsearch
"set ic
set smartindent  
set tabstop=4
set shiftwidth=4  
set expandtab  
"set softtabstop=4  
"set nonu
filetype plugin indent on
nnoremap <silent> <F10> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1
let Tlist_Auto_Open = 1
let Tlist_WinWidth = 40

colorscheme desert
"color evening

"for Chinese
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
