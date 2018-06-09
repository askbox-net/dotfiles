" set background=dark
" colorscheme darkblue
" colorscheme elflord
" colorscheme desert
" colorscheme industry
colorscheme koehler
" colorscheme evening
" colorscheme murphy
" colorscheme solarized

set number
set hlsearch

set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8


if has('mac')
  let g:imeoff = 'osascript -e "tell application \"System Events\" to key code 102"'
  augroup MyIMEGroup
    autocmd!
    autocmd InsertLeave * :call system(g:imeoff)
    inoremap <silent> <C-c>:call system(g:imeoff)
  augroup END
endif
