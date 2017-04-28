set encoding=utf8
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin("~/.vim/plugged")

Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'alvan/vim-closetag'
Plug 'ARM9/arm-syntax-vim'
Plug 'chrisbra/Colorizer'
Plug 'davinche/godown-vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular'
Plug 'iCyMind/NeoSolarized'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'matze/vim-move'
Plug 'mhartington/oceanic-next'
Plug 'mhinz/vim-startify'
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neomake/neomake'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'Valloric/MatchTagAlways'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'vim-scripts/utl.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yggdroot/indentLine'

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype on
filetype plugin on           " required
filetype indent on

" System Settings--------------------------------------------------{{{
" Neovim Settings
set rtp+=~/.fzf/
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set termguicolors
set shell=bash
set showcmd
set path+=**
set noshowmode
set noswapfile
filetype on
set conceallevel=0
set wildmenu
set wildmode=full
set laststatus=2
set wrap linebreak list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
"set colorcolumn=100
let mapleader = "\<Space>"
set undofile
set undodir="~/.VIM_UNDO_FILES"
" Remember cursor postion between vim sessions
autocmd BufReadPost *
     \ if line("'\"") > 0 && line ("'\"") <= line("$") |
     \   exe "normal! g'\"" |
     \ endif
" Center buffer around cursor when opening files
autocmd BufRead * normal zz
set updatetime=500
set complete=.,w,b,u,t,i

"let g:indentLine_char='|'
let g:indentLine_color_gui="#74818b"
let g:table_mode_corner="|"

set formatoptions+=t
set inccommand=nosplit
set shortmess=atI

nnoremap j gj
nnoremap k gk
nnoremap gp `[v`]

" Mappings

" General mappings
imap jk <ESC>
map  ff :bd<CR>
map  <TAB> :bn<CR>
map  <S-TAB> :bp<CR>
nmap <silent> <leader>/ :noh<CR>
nmap <silent> <leader>sv :so $HOME/.vimrc<CR>
nmap ttq :bp<bar>sp<bar>bn<bar>bd<CR>
nmap <leader>t :term fish<CR>
vmap < <gv
vmap > >gv

let g:deoplete#enable_at_startup=1

" HTML mappings
nnoremap <leader>html :setf html<CR>:-1read $HOME/.vim/.skeleton.html<CR>3jwf>a
autocmd FileType html :inoremap x<Tab> <Esc>/<++><CR>:noh<CR>ciw

inoremap <C-L> <ESC>[s1z=`]a

" Disable horizontal scrolling
nmap <ScrollWheelLeft> <nop>
nmap <S-ScrollWheelLeft> <nop>
nmap <C-ScrollWheelLeft> <nop>
nmap <ScrollWheelRight> <nop>
nmap <S-ScrollWheelRight> <nop>
nmap <C-ScrollWheelRight> <nop>
imap <ScrollWheelLeft> <nop>
imap <S-ScrollWheelLeft> <nop>
imap <C-ScrollWheelLeft> <nop>
imap <ScrollWheelRight> <nop>
imap <S-ScrollWheelRight> <nop>
imap <C-ScrollWheelRight> <nop>
vmap <ScrollWheelLeft> <nop>
vmap <S-ScrollWheelLeft> <nop>
vmap <C-ScrollWheelLeft> <nop>
vmap <ScrollWheelRight> <nop>
vmap <S-ScrollWheelRight> <nop>
vmap <C-ScrollWheelRight> <nop>

" Navigate Windows
nnoremap tt <C-w>
tnoremap <Esc> <C-\><C-n>

au BufEnter * if &buftype == "terminal" | :startinsert | endif
autocmd BufEnter term://* startinsert
autocmd TermOpen * set bufhidden=hide

au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7

inoreabbrev lorem Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.

" NERDTree config
let NERDTreeShowLineNumbers = 1
let NERDTreeQuitOnOpen = 1
nnoremap <leader>d :NERDTreeToggle<CR>

" You Complete Me config
let g:ycm_register_as_syntastic_checker=1
let g:ycm_server_python_interpreter = "/usr/local/bin/python2.7"
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:godown_port = 8090
let g:godown_autorun = 1

let g:colorizer_auto_filetype='css,html'

" Airline config
let g:airline_powerline_fonts = 1
"let g:airline_theme='powerlineish'
let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_left_sep = "\uE0B8"
let g:airline_left_alt_sep = "\uE0B9"
let g:airline_right_sep = "\uE0BA"
let g:airline_right_alt_sep = "\uE0BB"
let g:airline#extensions#tabline#left_sep = "\uE0B8"
let g:airline#extensions#tabline#left_alt_sep = "\uE0B9"
let g:airline#extensions#tabline#right_sep = "\uE0BA"
let g:airline#extensions#tabline#right_alt_sep = "\uE0BB"

function! AirlineInit()
    let g:airline_section_a = airline#section#create(["mode", " ", "branch"])
    let g:airline_section_b = airline#section#create_left(["hunks", "%f"])
    let g:airline_section_c = airline#section#create(["filetype"])
    let g:airline_section_x = airline#section#create(["%P"])
    let g:airline_section_y = airline#section#create(["%B"])
    let g:airline_section_z = airline#section#create_right(["%l", "%c"])
endfunction
autocmd VimEnter * call AirlineInit()

let g:airline#extensions#default#section_truncate_width = {
      \ 'b': 60,
      \ 'c': 90,
      \ 'x': 70,
      \ 'y': 88,
      \ 'z': 45,
      \ 'warning': 80,
      \ 'error': 80,
      \ }

let g:move_key_modifier = 'C'

let g:neomake_javascript_enabled_marker = ["eslint"]
let g:neomake_python_enabled_marker     = ["pylintrc"]
let g:syntastic_cpp_enabled_marker      = ["ycm"]
let g:syntastic_html_enabled_marker     = ["tidy"]
autocmd! BufWritePost * Neomake
autocmd! BufEnter * Neomake

let g:AutoPairsFlyMode = 0

" Tweaks for browsing folders
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_liststyle = 3
let g:netrw_list_hide = netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'


"colorscheme Tomorrow-Night
"colorscheme NeoSolarized
"color molokai
"let g:molokai_original = 1
"color solarized

syntax on
colorscheme OceanicNext
""set background=dark

set number
set nospell
set hidden
set smartindent
set smartcase
set hlsearch
set incsearch
set ignorecase
hi Search guifg=#222222 guibg=#107fce
hi SpecialKey ctermfg=66 guifg=#00cc00

set mouse=a

nnoremap <silent> <Plug>(noh) :noh<CR>

function! WriteAll()
  wa
  call feedkeys("\<Plug>(noh)")
endfunction

nnoremap ss :call WriteAll()<CR>

set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

"autocmd BufDelete * if len(filter(range(1, bufnr('$')), '! empty(bufname(v:val)) && buflisted(v:val)')) == 1 | quit | endif
nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>

autocmd FileType markdown,text,html setlocal spell complete+=kspell
hi SpellBad guibg=#ff2929 guifg=#ffffff ctermbg=244

set backspace=indent,eol,start
