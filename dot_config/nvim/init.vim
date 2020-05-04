"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/killruana/.local/share/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/killruana/.local/share/dein')
  call dein#begin('/home/killruana/.local/share/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/killruana/.local/share/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('autozimu/LanguageClient-neovim', {
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
    \ })
  call dein#add('deoplete-plugins/deoplete-jedi')
  call dein#add('majutsushi/tagbar')
  call dein#add('preservim/nerdtree')
  call dein#add('Shougo/deol.nvim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neoinclude.vim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('rust-lang/rust.vim')
  call dein#add('tbodt/deoplete-tabnine', { 'build': './install.sh' })  
  call dein#add('vim-syntastic/syntastic')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

" Global settings
" Use actual tab chars in Makefiles.
autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

" For everything else, use a tab width of 4 space chars.
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.

set mouse=a         " Enable mouse stroll
set number          " Enable line numbering
set colorcolumn=80  " Add a ruler

" LanguageClient
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['/usr/bin/rls'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Tagbar settings
nmap <F8> :TagbarToggle<CR>

" Rustfmt
let g:rustfmt_autosave = 1

" Deoplete
let g:deoplete#enable_at_startup = 1

" Deoplete rust
let g:deoplete#sources#rust#racer_binary='/usr/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/killruana/projects/rust/src'

" NERDtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
map <C-n> :NERDTreeToggle<CR>
