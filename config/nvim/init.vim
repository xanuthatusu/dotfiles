set encoding=utf8
set nocompatible
filetype off

call plug#begin("$HOME/.config/nvim/plugged")

Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'chrisbra/colorizer'
Plug 'digitaltoad/vim-pug'
Plug 'fatih/vim-go'
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/tabular'
Plug 'gregsexton/MatchTag'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'jelera/vim-javascript-syntax', {'autoload': {'filetypes': ['javascript']}}
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'
Plug 'matze/vim-move'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'unblevable/quick-scope'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'

call plug#end()    " Required
filetype on        " Required
filetype plugin on " Required
filetype indent on " Required
filetype plugin indent on " Required

" Options
let mapleader="\<Space>"
let s:maxoff = 5000
set background=dark
set conceallevel=2
set gdefault
set hidden
set ignorecase
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
set showbreak=>\ 
set showcmd
set smartcase
set wrap

" Tab stuff
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

"" Folding
"set debug=msg
"set foldmethod=syntax
"set foldlevelstart=20

" Persistent undo
try
  set undodir=~/.vim_runtime/temp_dirs/undodir
  set undofile
catch
endtry

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
"hi Normal guibg=NONE ctermbg=NONE " Transparency

" Custom keymaps
" Ease of Use
nnoremap j gj
nnoremap k gk
"inoremap jk <ESC>
nnoremap ss :wa<CR>
vmap < <gv
vmap > >gv

" Functionality
nnoremap gp `[v`]
nnoremap gb :ls<CR>:b<space>
nnoremap tt <C-w>
nmap <silent> <leader>/ :noh<CR>
nnoremap <F9> :Goyo<CR>
nnoremap <silent> <F7> :bp<CR>
nnoremap <silent> <F8> :bn<CR>

" Autocmds
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
cmap w!! w !sudo tee % > /dev/null

au BufNewFile,BufRead config setf config

" Conceal
"au VimEnter * syntax keyword Statement lambda conceal cchar=λ
"au VimEnter * syntax keyword Statement >= conceal cchar=≥
"au VimEnter * syntax keyword Statement <= conceal cchar=≤
"au VimEnter * hi! link Conceal Statement
"au VimEnter * set conceallevel=2

" Plugin Options

" Auto Pairs
let g:AutoPairsFlyMode = 1

" Deoplete
call deoplete#custom#option({'auto_complete_start_length': 3})
call deoplete#custom#option({'enable_smart_case': 1})
let g:deoplete#enable_at_startup=1
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'

" Neosnippets
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
function! CompletionTab()
  if neosnippet#expandable_or_jumpable()
    return "\<Plug>(neosnippet_expand_or_jump)"
  elseif pumvisible()
    return "\<C-n>"
  elseif getline('.')[col('.') - 1] =~# '["\]'')}]'
    return "\<Right>"
  else
    return "\<TAB>"
  endif
endfunction

imap <expr><Tab> CompletionTab()

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Colorizer
let g:colorizer_auto_filetype='css,html'

" Airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts=1
"let g:airline_theme='base16_spacemacs'
"let g:airline_theme='hybridline'
let g:airline_theme='gruvbox'

function! AirlineInit()
     let g:airline_section_a = airline#section#create(["mode", " ", "branch"])
     let g:airline_section_b = airline#section#create_left(["hunks", "%f"])
     let g:airline_section_c = airline#section#create(["filetype"])
     let g:airline_section_x = airline#section#create(["%P"])
     let g:airline_section_y = airline#section#create(["%B"])
     let g:airline_section_z = airline#section#create_right(["%l", "%c"])
endfunction
autocmd VimEnter * call AirlineInit()

" Fuzzy File Finder
set rtp+=$HOME/.fzf
nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>b :Buffer<CR>

" Vim move
let g:move_key_modifier='C'

" SuperTab
"let g:SuperTabDefaultCompletionType = "<c-n>"

" Indent Guides
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_exclude_filetypes=['help', 'diff']

" Markdown Preview
"let vim_markdown_preview_toggle=2
let vim_markdown_preview_browser="Chromium"
let vim_markdown_preview_use_xdg_open=1
let vim_markdown_preview_github=1

" Ale
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_javascript_eslint_use_global = 1
"let g:ale_cpp_clangtidy_options = '-x c++'
"let g:ale_cpp_clangtidy_checks = ['modernize-use-trailing-return-type']
let g:ale_linters = {
\   'typescript': ['eslint', 'tsserver'],
\   'cpp': ['clang'],
\}
" Disable linting on old, terrible javascript files
let g:ale_pattern_options = {
\   '.*assets-checkout/.*\.js': {'ale_enabled': 0},
\}

" Nerd Tree
"map <leader>d :NERDTreeToggle<CR>

"" NERDTress File highlighting
"function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 "exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 "exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
"endfunction

"call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
"call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
"call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
"call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
"call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
"call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
"call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" Vimwiki
let g:vimwiki_list = [{'path': '~/.config/nvim/vimwiki/', 'path_html': '/tmp/vimwiki_html'}]

" Vimtex
let g:vimtex_view_method = 'mupdf'
