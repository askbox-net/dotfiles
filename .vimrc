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
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic.git'

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


" Disable AutoComplPop.
" let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
	\ 'default' : ''
	\ }

highlight Pmenu     guibg=#666666
highlight PmenuSel  guibg=#8cd0d3 guifg=#666666
highlight PmenuSbar guibg=#333333
highlight Pmenu     ctermbg=4
highlight PmenuSel  ctermbg=0
highlight PmenuSbar ctermbg=4

if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.go = '\h\w*\.\?'
" let g:neocomplcache_omni_patterns.go = '\h\w*\%.'
