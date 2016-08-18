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
NeoBundle 'scrooloose/nerdtree'
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

" 引数なしで起動した場合、nerdtreeを起動.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" nerdtree起動ショートカット.
map <C-z> :NERDTreeToggle<CR>

" ctrl+spaceでc++整形.
map <Nul> <Plug>(operator-clang-format)

" 構文チェック.
let g:clang_user_options='-std=c++11'
let g:syntastic_cpp_compiler='clang++'
let g:syntastic_cpp_compiler_options='-std=c++11'
let g:syntastic_check_on_open=1
let g:syntastic_cpp_check_header=1
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

" shift-oの速度を上げる。
set ttimeoutlen=75
