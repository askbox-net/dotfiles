call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'thinca/vim-quickrun', { 'for': ['python', 'go', 'cpp', 'c', 'php', 'sh' ] }
Plug 'rking/ag.vim', { 'on': ['Ag'] }
Plug 'vim-utils/vim-man', { 'on': [ 'Man' ] }
Plug 'Valloric/YouCompleteMe'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/MultipleSearch'
" Plug 'thinca/vim-ref'
" Plug 'vim-jp/vim-go-extra'
" Plug 'google/vim-ft-go'
Plug 'fatih/vim-go'
Plug 'lervag/vimtex'
Plug 'easymotion/vim-easymotion'
Plug 'vim-syntastic/syntastic'
Plug 'koron/dicwin-vim'
Plug 'yuratomo/w3m.vim'
" Plug 'jacobsimpson/nvim-example-python-plugin'

call plug#end()

set number
set hlsearch
set incsearch

set background=dark
colorscheme darkblue
" colorscheme elflord
" colorscheme desert
" colorscheme industry
" colorscheme koehler
" colorscheme evening
" colorscheme murphy
" colorscheme solarized

set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

nnoremap <silent> <C-p> :ProjectFiles<CR>
nnoremap <silent> <M-p> :History<CR>

set clipboard+=unnamedplus

let g:ycm_global_ycm_extra_conf = '~/.local/share/nvim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

set dictionary=/usr/share/dict/words

"nnoremap <silent> <C-k> :SaveWord()<CR>
map <silent> <C-k><C-s> :SaveWord()<CR>

let g:w3m#disable_vimproc = 1
let g:w3m#hover_delay_time = 100
let g:w3m#lang = 'en_US'

set runtimepath+=/Users/h-bounnong/.config/nvim/vimdoc-ja
set helplang=ja,en
" helptags

if has('mac')
  let g:imeoff = 'osascript -e "tell application \"System Events\" to key code 102"'
  augroup MyIMEGroup
    autocmd!
    autocmd InsertLeave * :call system(g:imeoff)
    inoremap <silent> <C-c>:call system(g:imeoff)
  augroup END
endif
