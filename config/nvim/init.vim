set encoding=utf8
set nocompatible
filetype off

call plug#begin("$HOME/.config/nvim/plugged")

Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'chrisbra/colorizer'
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'jelera/vim-javascript-syntax', {'autoload': {'filetypes': ['javascript']}}
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'matze/vim-move'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neomake/neomake'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'ying17zi/vim-live-latex-preview'

call plug#end()    " Required
filetype on        " Required
filetype plugin on " Required
filetype indent on " Required

" Options
let mapleader="\<Space>"
set background=dark
set gdefault
set hidden
set inccommand=nosplit
set incsearch
set linebreak
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set mouse=a
set noswapfile
set number
set path+=**
set scrolloff=5
set shell=bash
set showcmd
set wrap

" Tab stuff
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4

" Remember cursor postion between sessions
autocmd BufReadPost *
     \ if line("'\"") > 0 && line ("'\"") <= line("$") |
     \   exe "normal! g'\"" |
     \ endif

" Center Buffer around cursor when opening files
autocmd BufRead * normal zz

" Colors
colorscheme gruvbox
"colorscheme onedark
"set colorcolumn=100
call matchadd('ColorColumn', '\%100v', 100)
hi SpecialKey ctermfg=66 guifg=#00cc00
" hi Normal guibg=NONE ctermbg=NONE " Transparency

" Custom keymaps
" Ease of Use
nnoremap j gj
nnoremap k gk
inoremap jk <ESC>
nnoremap ss :wa<CR>
vmap < <gv
vmap > >gv

" Functionality
nnoremap gp `[v`]
nnoremap gb :ls<CR>:b<space>
nnoremap tt <C-w>
nmap <silent> <leader>/ :noh<CR>
nnoremap <F9> :Goyo<CR>

" Autocmds
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" Plugin Options

" Deoplete
let g:deoplete#enable_at_startup=1

" Colorizer
let g:colorizer_auto_filetype='css,html'

" Airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_theme='powerlineish'

function! AirlineInit()
     let g:airline_section_a = airline#section#create(["mode", " ", "branch"])
     let g:airline_section_b = airline#section#create_left(["hunks", "%f"])
     let g:airline_section_c = airline#section#create(["filetype"])
     let g:airline_section_x = airline#section#create(["%P"])
     let g:airline_section_y = airline#section#create(["%B"])
     let g:airline_section_z = airline#section#create_right(["%l", "%c"])
endfunction
autocmd VimEnter * call AirlineInit()

" Neomake
autocmd! BufWritePost * Neomake
autocmd! BufEnter * Neomake
let g:neomake_javascript_enabled_marker = ["eslint"]
let g:neomake_python_enabled_marker     = ["pylintrc"]

" Fuzzy File Finder
set rtp+=$HOME/.fzf
nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>b :Buffer<CR>

" Vim move
let g:move_key_modifier='C'

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardsTrigger="<S-tab>"
