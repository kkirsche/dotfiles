" ====================
" Plugins
" ====================
" Make sure we have Plug installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
" Plug Package Manager
call plug#begin('~/.local/share/nvim/plugged')
" Manage itself
Plug 'junegunn/vim-plug'
" Utility
Plug 'benmills/vimux'
if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin\n"
    Plug 'rizzatti/dash.vim'
  endif
endif
" Layout
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
" Themes / Visual
Plug 'phanviet/vim-monokai-pro'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" General programming
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-go', { 'do': 'make'}
" Golang support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" HTML
Plug 'mattn/emmet-vim'
" YANG Data Model
Plug 'nathanalderson/yang.vim'
call plug#end()

" =====================
" Neovim Configuration
" =====================
set nocompatible
syntax on
set nowrap
set encoding=utf8
set number
" Spacing
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent
set autoindent
" Shift to the next shift location based on shiftwidth rather than just
" indenting by  the width
set shiftround
" Directory Behavior
set autochdir
" Split Behavior
set splitright
set splitbelow
" Search Highlighting
set hlsearch
" Autocomplete scratch window
set completeopt-=preview
set ruler
" Colors
set background=dark
set t_Co=256
if (has("termguicolors"))
  set termguicolors
endif
let base16colorspace = 256
colorscheme monokai_pro
" Learn neovim
noremap <Left> :echo "h is left"<CR>
noremap <Down> :echo "j is down"<CR>
noremap <Up> :echo "k is up"<CR>
noremap <Right> :echo "l is right"<CR>

" =====================
" Filetype Overrides
" =====================
" Make sure assembly is syntax highlighted
au BufRead,BufNewFile *.nasm set filetype=nasm
au BufRead,BufNewFile *.asm set filetype=asm
" =====================
" Plugin Configuration
" =====================
" Airline
let g:airline#exensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'base16_monokai'
let g:airline_powerline_fonts = 1
" Deoplete
let g:deoplete#enable_at_startup = 1
" NOTE: Ctrl+n is the "next" autocomplete entry
" NOTE: Ctrl+p is the "previous" autocomplete entry
" NERDtree
map <C-n> :NERDTreeToggle<CR>
" Tagbar
map <C-m> :TagbarToggle<CR>
" ALE - Asynchronous Lint Engine
let g:ale_list_window_size = 7
let g:ale_fixers = {
\     '*': ['remove_trailing_lines', 'trim_whitespace'],
\     'asm': ['gcc'],
\     'python': ['isort', 'autopep8'],
\     'javascript': ['eslint', 'prettier'],
\     'json': ['fixjson', 'jq', 'prettier'],
\     'c': ['clang-format'],
\     'c++': ['clang-format']
\   }
let g:ale_fix_on_save = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
