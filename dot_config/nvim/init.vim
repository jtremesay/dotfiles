"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Load the vim-plug package manager
" Install with 
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
call plug#begin(stdpath('data') . '/plugged')
    Plug 'chriskempson/base16-vim'
    Plug 'preservim/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use actual tab chars in Makefiles.
autocmd FileType make set tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab

" Indent size 2 for YAML
autocmd FileType yaml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" For everything else, use a tab width of 4 space chars.
set tabstop=4      " The width of a TAB is set to 4.
                   " Still it is a \t. It is just that
                   " Vim will interpret it to be having
                   " a width of 4.
set shiftwidth=4   " Indents will have a width of 4.
set softtabstop=4  " Sets the number of columns for a TAB.
set expandtab      " Expand TABs to spaces.

set mouse=a        " Enable mouse stroll
set number         " Enable line numbering
set colorcolumn=80 " Add a ruler

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Base 16
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background = "dark"
colorscheme base16-monokai
let base16colorspace = 256  " Access colors present in 256 colorspace
set termguicolors

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDtree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='base16_monokai'
let g:airline#extensions#ale#enabled = 1
