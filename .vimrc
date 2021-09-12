set nocompatible
scriptencoding utf-8
let g:mapleader = " "
language messages POSIX
filetype               on
filetype plugin        on
filetype plugin indent on
syntax                 on
runtime macros/matchit.vim

set autochdir
set autoindent
set autoread
set autowriteall
set background=dark
set backspace=2
set clipboard=unnamedplus
set cmdheight=2
set cmdwinheight=5
set copyindent
set diffopt+=vertical
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set fillchars=""
set foldmethod=syntax
set helplang=en
set hidden
set history=10000
set hlsearch
set ignorecase
set incsearch
set infercase
set langmenu=en
set laststatus=0
set lazyredraw
set mouse=a
set nofoldenable
set nojoinspaces
set nostartofline
set noswapfile
set nowrap
set nowrapscan
set nowritebackup
set pastetoggle=<leader>p
set path+=**
set pumheight=5
set pyxversion=3
set report=0
set ruler
set scrolloff=5
set secure
set shiftround
set shiftwidth=2
set shortmess=I
set showcmd
set showfulltag
set showmatch
set sidescroll=5
set smartcase
set smartindent
set smarttab
set softtabstop=2
set splitbelow
set splitright
set switchbuf=newtab,vsplit,split,useopen,usetab
set t_Co=256
set tabstop=2
set tagcase=followscs
set termencoding=utf-8
set textwidth=100
set title
set ttimeout
set ttimeoutlen=1000
set ttyfast
set ttymouse=sgr
set undodir=$HOME/.vim/undo
set undofile
set virtualedit=block
set wildmenu

nnoremap Y y$
nnoremap j gj
nnoremap k gk

vnoremap < <gv
vnoremap > >gv

cnoreabbrev Q q!
cnoreabbrev W w!
cnoreabbrev q q!
cnoreabbrev w w!

inoremap jj <Esc>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <silent># #zz
nnoremap <silent>* *zz
nnoremap <silent>N Nzz
nnoremap <silent>n nzz

nnoremap          <leader>e :edit   <Space>
nnoremap <silent> <leader>q :quit!  <CR>
nnoremap <silent> <leader>w :write! <CR>

nnoremap <silent> <leader>s :split  <CR>
nnoremap <silent> <leader>v :vsplit <CR>

nnoremap <silent> <leader>/ :nohlsearch <CR>

nnoremap <silent> <leader>bn :bnext     <CR>
nnoremap <silent> <leader>bp :bprevious <CR>

nnoremap <silent> <leader>n :tabnext     <CR>
nnoremap <silent> <leader>p :tabprevious <CR>
nnoremap <silent> <leader>t :tabnew      <CR>

nnoremap <silent> <leader>h :vertical resize -10 <CR>
nnoremap <silent> <leader>j :resize          -10 <CR>
nnoremap <silent> <leader>k :resize          +10 <CR>
nnoremap <silent> <leader>l :vertical resize +10 <CR>

for prefix in ["i", "n", "v"]
  execute prefix . "noremap " . "<C-q>" . " <Nop>"
  for key in ["<Up>", "<Down>", "<Left>", "<Right>"]
    execute prefix . "noremap " . key . " <Nop>"
  endfor
endfor

function! FormatFile()
  silent! normal ml
  if (&filetype!="python")
    silent! normal gg=G
  endif
  silent! %s/\s\+$//e
  silent! %s#\($\n\s*\)\+\%$##
  silent! normal 'lzz
  silent! delmarks l
endfunction

if has("autocmd")
  augroup BeforeWritingFile
    autocmd!
    autocmd BufWritePre * retab
    autocmd BufWritePre * call FormatFile()
  augroup END
  autocmd! FileType c,cpp setlocal equalprg=clang-format
  autocmd! FileType make setlocal noexpandtab
  autocmd! FocusGained,BufEnter * silent! execute "checktime"
  autocmd! InsertEnter * norm zz
endif
