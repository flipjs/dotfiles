" =============================================================================

set nocompatible
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
set modelines=0                                            " learn more on this

" =============================================================================

set tabstop=2
set shiftwidth=2
set softtabstop=2
" expand tabs into spaces
set expandtab

" =============================================================================

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=full
" set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set relativenumber
" set undofile
set nobackup
set nowritebackup
set noswapfile

" =============================================================================

let mapleader = ","

" =============================================================================

" use normal regex when searching
nnoremap / /\v
vnoremap / /\v

" =============================================================================

set ignorecase
set smartcase
" applies substitutions globally on lines
set gdefault
set incsearch
set showmatch
set hlsearch
" gets rid of highlighting when done with search
nnoremap <leader><space> :noh<cr>
"match bracket pairs instead of typing %
nnoremap <tab> %
vnoremap <tab> %

" =============================================================================

set wrap
set linebreak
set showbreak=»»\ 
set textwidth=79
set formatoptions=qrn1
" set colorcolumn=85
" match ErrorMsg '\%>79v.\+'
nnoremap <silent> <leader><leader>9 :match ErrorMsg '\%>80v.\+'<CR>
nnoremap <silent> <leader><leader>0 :match none<CR>
syntax on

" =============================================================================

cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev wrap set wrap
cnoreabbrev warp set wrap
cnoreabbrev nowrap set nowrap
cnoreabbrev nowr set nowrap

" =============================================================================

" show invisible characters
" set list
" set listchars=tab:▸\ ,eol:¬

" =============================================================================

" disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" makes j and k the way you expected and not jumping on long lines
nnoremap j gj
nnoremap k gk

" =============================================================================

" you may hit F1 when pressing ESC, so make it ESC as well
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" =============================================================================

" Navigate buffers
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <silent> <leader>bm :bp<CR>
nnoremap <silent> <leader>bb :b#<CR>
nnoremap <silent> <leader>bd :bd<CR>

" =============================================================================

nnoremap ; :

" =============================================================================

" save on losing focus
au FocusLost * :wa

" =============================================================================

" strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" =============================================================================

nnoremap <leader>a :Ack

" =============================================================================

" fold tag
nnoremap <leader>ft Vatzf

" =============================================================================

" for sorting css properties
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" =============================================================================

" re-hardwrap paragraphs of text
nnoremap <leader>q gqip

" =============================================================================

" reselect the text that was just pasted
nnoremap <leader>v V`]

" =============================================================================

" open .vimrc in a new tab
nnoremap <silent> <leader>ev :tabedit $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" =============================================================================

" go back to normal mode
inoremap fg <C-c>
" go to above or below, start or end of line in insert mode
inoremap hh <C-c>A
inoremap jj <C-c>o
inoremap kk <C-c>O
inoremap ii <C-c>I

" =============================================================================

" open a new vertical split and switch over to it
nnoremap <leader>w <C-w>v<C-w>l

" =============================================================================

" commands needed to move around your splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" =============================================================================

" Remap new tab
nnoremap <leader>t <ESC>:tabnew<CR>

" =============================================================================

" new split window go to bottom and right
set splitbelow
set splitright

" =============================================================================

" For swapping files between split windows

function! MarkWindowSwap()
  let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
  "Mark destination
  let curNum = winnr()
  let curBuf = bufnr( "%" )
  exe g:markedWinNum . "wincmd w"
  "Switch to source and shuffle dest->source
  let markedBuf = bufnr( "%" )
  "Hide and open so that we aren't prompted and keep history
  exe 'hide buf' curBuf
  "Switch to dest and shuffle source->dest
  exe curNum . "wincmd w"
  "Hide and open so that we aren't prompted and keep history
  exe 'hide buf' markedBuf 
endfunction

" =============================================================================

nnoremap <leader>mw :call MarkWindowSwap()<CR>
nnoremap <leader>dw :call DoWindowSwap()<CR>

" =============================================================================

set t_Co=256
set guifont=Source\ Code\ Pro\ for\ PowerLine:h16
set background=dark
color distinguished

" =============================================================================

" vim-airline statusline
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" =============================================================================

" CtrlP mappings
nnoremap <silent> <leader>ff :CtrlP<CR>
nnoremap <silent> <leader>fb :CtrlPBuffer<CR>
nnoremap <silent> <leader>fr :CtrlPMRU<CR>
nnoremap <silent> <leader>fm :CtrlPMixed<CR>

" =============================================================================

" Syntastic settings
let g:syntastic_javascript_checkers = ['jshint']

" =============================================================================

nnoremap <silent> <leader>bt :TagbarToggle<CR>

" =============================================================================

augroup JavaScript
  autocmd!
  autocmd FileType javascript nnoremap <buffer> <leader>rr :!node %<CR>
augroup END

" =============================================================================

function! InsertTabWrapper()
  " MULTIPURPOSE TAB KEY
  " Indent if we're at the beginning of a line. Else, do completion.
  " via https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" =============================================================================

function! OpenUrlUnderCursor()
  let url=matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
  if url != ""
    silent exec "!open '".url."'" | redraw! 
  endif
endfunction

map <leader>o :call OpenUrlUnderCursor()<CR>

" =============================================================================

