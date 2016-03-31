if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Rip-Rip/clang_complete'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'rhysd/vim-clang-format'
NeoBundle 'scrooloose/syntastic'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" カラースチーム設定.
set t_Co=256
colorscheme jellybeans

" ctrl+spaceでcpp整形.
map <Nul> <Plug>(operator-clang-format)

" 構文チェック.
let g:clang_user_options='-std=c++11'
let g:syntastic_cpp_compiler='clang++'
let g:syntastic_cpp_compiler_options='-std=c++11'
let g:syntastic_check_on_open=1
let g:syntastic_cpp_no_default_include_dirs=1

" 全角スペース可視化.
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

set number
set ambiwidth=double
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=0
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set nrformats-=octal
set history=50
set virtualedit=block
