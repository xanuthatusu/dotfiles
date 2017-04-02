set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'alvan/vim-closetag'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'jceb/vim-orgmode'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mhinz/vim-startify'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/utl.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype on
filetype plugin on           " required
filetype indent on

set shell=bash
set path+=**

let mapleader = "\<Space>"
let maplocalleader = "\\"

:imap jk <ESC>
:imap JK <ESC>
:map ff :x<CR>
:map ss :w<CR>
:map tt <C-W>
:map <TAB> :bn<CR>
:map <S-TAB> :bp<CR>

" Disable horizontal scrolling
:nmap <ScrollWheelLeft> <nop>
:nmap <S-ScrollWheelLeft> <nop>
:nmap <C-ScrollWheelLeft> <nop>
:nmap <ScrollWheelRight> <nop>
:nmap <S-ScrollWheelRight> <nop>
:nmap <C-ScrollWheelRight> <nop>
:imap <ScrollWheelLeft> <nop>
:imap <S-ScrollWheelLeft> <nop>
:imap <C-ScrollWheelLeft> <nop>
:imap <ScrollWheelRight> <nop>
:imap <S-ScrollWheelRight> <nop>
:imap <C-ScrollWheelRight> <nop>
:vmap <ScrollWheelLeft> <nop>
:vmap <S-ScrollWheelLeft> <nop>
:vmap <C-ScrollWheelLeft> <nop>
:vmap <ScrollWheelRight> <nop>
:vmap <S-ScrollWheelRight> <nop>
:vmap <C-ScrollWheelRight> <nop>

nnoremap <leader>html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a
set showcmd

nmap <silent> <leader>sv :so $HOME/.vimrc<CR>
nmap <silent> <leader>/ :noh<CR>

" Clipboard stuff
vmap <D-c> "+y
vmap <D-x> "+d
vmap <D-v> "+p
nmap <D-v> "+p

let NERDTreeShowLineNumbers = 1
let NERDTreeQuitOnOpen = 1

let g:ycm_register_as_syntastic_checker=1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
set completeopt-=preview

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = "<leader>p"
let g:ctrlp_max_depth = 100
let g:ctrlp_max_files = 20000

let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

function! AirlineInit()
    let g:airline_section_a = airline#section#create(["mode", " ", "branch"])
    let g:airline_section_b = airline#section#create_left(["ffenc", "hunks", "%f"])
    let g:airline_section_c = airline#section#create(["filetype"])
    let g:airline_section_x = airline#section#create(["%P"])
    let g:airline_section_y = airline#section#create(["%B"])
    let g:airline_section_z = airline#section#create_right(["%l", "%c"])
    let g:airline_section_error = airline#section#create(["syntastic"])
endfunction
autocmd VimEnter * call AirlineInit()

let vim_markdown_preview_github=1

let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_cpp_checkers = ["ycm"]
let g:syntastic_html_checkers = ["tidy"]

let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": ["javascript"],
    \ "passive_filetypes": [""] }

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '}}'

" Tweaks for browsing folders
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_liststyle = 3
let g:netrw_list_hide = netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

colorscheme Tomorrow-Night
"color molokai
"let g:molokai_original = 1
set background=dark
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
set shortmess+=c
set number
set hidden
set smartindent
set smartcase
set hlsearch
set incsearch
set ignorecase
"set listchars=tab:>-,trail:~,extends:>,precedes:<
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set complete=.,w,b,u,t,i
set list
set nowrap
syntax on
hi Search guibg=#f48341
hi SpecialKey ctermfg=66 guifg=#00cc00
hi Visual ctermbg=130
hi Visual ctermfg=0

set laststatus=2
set mouse=a

autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

set backspace=indent,eol,start

