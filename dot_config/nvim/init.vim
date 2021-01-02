"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Load the vim-plug package manager
" INstall with 
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
call plug#begin(stdpath('data') . '/plugged')
    Plug 'dense-analysis/ale'
    Plug 'chriskempson/base16-vim'
    Plug 'psf/black', { 'branch': 'stable' }
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'davidhalter/jedi-vim'
    Plug 'preservim/nerdtree'
    Plug 'python-rope/ropevim'
    Plug 'preservim/tagbar'
    Plug 'rust-lang/rust.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ludovicchabant/vim-gutentags'

" Initialize plugin system
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use actual tab chars in Makefiles.
autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

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
" Ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'python': ['black']
            \}
let g:ale_linters = {'python': ['flake8']}
let g:ale_fix_on_save = 1
let g:ale_python_black_options = "-l79"




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Base 16
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background = "dark"
colorscheme base16-monokai
let base16colorspace = 256  " Access colors present in 256 colorspace
set termguicolors

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Black
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:black_linelength = 79

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDtree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rust.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rustfmt_autosave = 1
autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs compiler cargo

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='base16_monokai'
let g:airline#extensions#ale#enabled = 1
