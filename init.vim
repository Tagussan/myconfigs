call plug#begin()
" Make sure you use single quotes
" Group dependencies, vim-snippets depends on ultisnips
Plug 'w0ng/vim-hybrid'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'vim-scripts/matchit.zip'
Plug 'haya14busa/incsearch.vim'
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-syntax-extra'
Plug 'alvan/vim-closetag'
Plug 'osyo-manga/vim-brightest'
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-sleuth'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'simeji/winresizer'
Plug 'svermeulen/vim-easyclip'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'lambdalisue/fern.vim'
Plug 'maxboisvert/vim-simple-complete'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
"Plug 'junegunn/fzf.vim'
call plug#end()

set noshowmode

colorscheme hybrid
"set background=dark

"share clipboard
" set clipboard=unnamed,unnamedplus
syntax on

set autoindent
set smartindent
set backspace=indent,eol,start
set showmatch
set matchtime=1
set hlsearch
set matchpairs& matchpairs+=<:>
set number
"set shiftwidth=4
set smarttab
set ignorecase
set expandtab
set softtabstop=0
set cursorline
set noswapfile
set noshowmode
set tags=.tags
set laststatus=2
set undofile
set undodir=~/.config/nvim/undodir

" keymaps
nnoremap j gj
nnoremap k gk
nnoremap p ]p
nnoremap <Down> gj
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
nnoremap <C-e> $
nnoremap <C-a> ^
vnoremap <C-e> $
vnoremap <C-a> ^
nnoremap <Esc><Esc> :nohlsearch<CR>

" indent guide
let g:indent_guides_enable_on_vim_startup = 1

" airline
let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#fnamemod = ':t'
" let g:Powerline_symbols="fancy"
" let g:airline_powerline_fonts = 1

" UndoTree
nnoremap <C-r> :UndotreeToggle<CR>

"incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"improve asterisk
nnoremap <silent> * "syiw<Esc>: let @/ = @s<CR>:set hls<CR>

"easymotion
let g:EasyMotion_do_mapping = 0 "Disable default mappings
nmap s <Plug>(easymotion-bd-w)
vmap s <Plug>(easymotion-bd-w)

"Vimtex
let g:tex_flavor='latex' 
"let g:vimtex_view_enabled = 1
let g:tex_conceal=""
let g:vimtex_latexmk_options = '-latex=pdflatex --shell-escape'
"let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_fold_enabled=0
let g:tex_fast = "bMpr"
autocmd BufNewFile,BufRead *.tex set spell
set spelllang=en,cjk

"Rainbow paren
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'separately': {
\       'systemverilog': {
\           'parentheses': [
\               'start=/(/ end=/)/ fold',
\               'start=/\[/ end=/\]/ fold',
\               'start=/{/ end=/}/ fold',
\               'start=/\v(^|\s)begin($|\s)/ end=/\v(^|\s)end($|\s)/ fold'
\           ],
\           'after': ['syn clear verilogLabel'],
\       },
\   }
\}

let g:brightest#highlight = {
\   "group" : "BrightestUnderline"
\}

let g:brightest#enable_filetypes = {
\	"tex" : 0
\}

" let g:ale_verilog_verilator_options = '-I ./'
au FileType systemverilog
    \ let g:ale_linters = {'systemverilog' : ['verilator'],}

hi Normal guibg=NONE ctermbg=NONE
let g:winresizer_start_key = '<C-S>'

let g:EasyClipShareYanks = 1

let g:cursorhold_updatetime = 100
nnoremap <C-f> :Fern . -drawer -toggle<CR>
augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END
function! s:init_fern() abort
  " Define NERDTree like mappings
  nmap <buffer> t <Plug>(fern-action-open:tabedit)
  nmap <buffer> i <Plug>(fern-action-open:split)
  nmap <buffer> s <Plug>(fern-action-open:vsplit)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> h <Plug>(fern-action-leave)
  nmap <buffer> q :<C-u>quit<CR>
endfunction

let g:vsc_type_complete_length = 1

nmap <silent> <C-g> :History<CR>
