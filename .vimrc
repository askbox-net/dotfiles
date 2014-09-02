set nocompatible
syntax enable
filetype indent plugin on
colorscheme darkblue

runtime! ftplugin/man.vim

" Fold {{{"
set foldmethod=marker
set foldlevel=2
set foldcolumn=3
" }}}

" NeoBundle {{{
" mkdir -p ~/.vim/bundle
" git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
" }}}

" NeoBundle Plugins {{{
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'yuratomo/w3m.vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'Blackrush/vim-gocode'
NeoBundle 'koron/dicwin-vim'

NeoBundle "Shougo/vimproc", {
    \ "build": {
    \   "windows"   : "make -f make_mingw32.mak",
    \   "cygwin"    : "make -f make_cygwin.mak",
    \   "mac"       : "make -f make_mac.mak",
    \   "unix"      : "make -f make_unix.mak",
    \ }}

NeoBundleCheck
" }}}

let g:jedi#auto_initialization = 1
let g:jedi#rename_command = "<leader>R"
let g:jedi#popup_on_dot = 1

