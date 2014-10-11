" =============================================================================

set nocompatible
filetype off
call pathogen#infect()
call pathogen#helptags()
" do not use smartindent or cindent, use below instead
filetype plugin indent on
set nomodeline

" =============================================================================

" set snippets location for SnipMate
let g:snippets_dir = "~/.vim/snippets"

" =============================================================================

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab                                                 " tabs to spaces

" =============================================================================

set encoding=utf-8
set scrolloff=1
" do not use smartindent or cindent, use filetype plugin indent on
set autoindent
set showcmd
set hidden
set wildmenu
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set relativenumber
set nobackup
set nowritebackup
set noswapfile

" =============================================================================

let mapleader = ","

" =============================================================================

set ignorecase
set smartcase
" applies substitutions globally on lines
set gdefault
set incsearch
set showmatch
" set hlsearch
" toggles search highlighting
nnoremap <leader><space> :set hls!<CR>

" =============================================================================

set wrap
set linebreak
set showbreak=↪\ 
set textwidth=79
set formatoptions=qrn1
" match ErrorMsg '\%>79v.\+'
nnoremap <silent> <leader>99 :match ErrorMsg '\%>80v.\+'<CR>
nnoremap <silent> <leader>00 :match none<CR>
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

" makes j and k the way you expected and not jumping on long lines
nnoremap j gj
nnoremap k gk
" makes Q quit
nnoremap Q :q<CR>

" =============================================================================

" Dash shortcut
nmap <silent> <leader>d <Plug>DashSearch

" =============================================================================

" Gundo settings
set undodir=~/.vim/tmp/undo
"set undofile
set history=100
set undolevels=100
let g:gundo_width = 30
nnoremap <silent> <leader>un :GundoToggle<CR>

" =============================================================================

nnoremap <silent> <leader>nt :NERDTreeToggle<CR>

" =============================================================================

" ctrl-f for snipmate completion, use vv instead
" imap <C-f> <Plug>snipMateNextOrTrigger
" smap <C-f> <Plug>snipMateNextOrTrigger
imap vv <ESC>a<Plug>snipMateNextOrTrigger
smap vv <Plug>snipMateNextOrTrigger

" =============================================================================

" use when pasting from clipboard, same as set paste/nopaste
set pastetoggle=<leader>VV
" command line history
nnoremap <leader>cl q:
" reselect the text that was just pasted
nnoremap <leader>v V`]

" =============================================================================

" save on losing focus
au FocusLost * :wa

" =============================================================================

nnoremap <leader>A :Ack

" =============================================================================

" open .vimrc in a new tab
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>
nnoremap <silent> <leader>eh :e .vim.tips<CR>

" =============================================================================

" fixes slow O inserts (all three)
set timeout
set timeoutlen=1000
set ttimeoutlen=100

" go back to normal mode
inoremap jj <ESC>

" =============================================================================

" Work around to indent and tab when pressing return after the open curly brace
inoremap {<CR> {<CR>}<C-o>O<TAB>

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

nnoremap <leader>wm :call MarkWindowSwap()<CR>
nnoremap <leader>ws :call DoWindowSwap()<CR>

" =============================================================================

" commands needed to move around your splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" =============================================================================

" new split window go to bottom and right
set splitbelow
set splitright

" =============================================================================

nnoremap <silent> <leader>wb <ESC>:new<CR>                 " new split bottom
nnoremap <silent> <leader>wv <ESC>:vnew<CR>                " new split right
nnoremap <silent> <leader>wn <ESC>:enew<CR>                " new buffer

" =============================================================================

function! DeleteEmptyBuffers()
    let [i, n; empty] = [1, bufnr('$')]
    while i <= n
        if bufexists(i) && bufname(i) == ''
            call add(empty, i)
        endif
        let i += 1
    endwhile
    if len(empty) > 0
        exe 'bdelete' join(empty)
    endif
endfunction

" =============================================================================

" buffer related functions
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <silent> <leader>bp :bp<CR>
nnoremap <silent> <leader>bb :b#<CR>
nnoremap <silent> <leader>bd :bd<CR>
nnoremap <silent> <leader>bl :ls<CR>
" delete empty buffers
nnoremap <silent> <leader>be :call DeleteEmptyBuffers()<CR>

" =============================================================================

set t_Co=256
set guifont=Source\ Code\ Pro\ for\ PowerLine:h16
set background=dark
color distinguished

" =============================================================================

" vim-airline settings
" dont show vim default status
set noshowmode
" enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" populate symbols
let g:airline_powerline_fonts = 1
" set theme
let g:airline_theme='tomorrow'

" =============================================================================

" CtrlP mappings
nnoremap <silent> <leader>ff :CtrlP<CR>
nnoremap <silent> <leader>fb :CtrlPBuffer<CR>
nnoremap <silent> <leader>fr :CtrlPMRU<CR>
nnoremap <silent> <leader>fm :CtrlPMixed<CR>

" =============================================================================

" Syntastic settings
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_tidy_ignore_errors = [" proprietary attribute \"ng-"]
let g:syntastic_html_tidy_ignore_errors = [
    \"trimming empty <i>",
    \"trimming empty <span>",
    \"<input> proprietary attribute \"autocomplete\"",
    \"proprietary attribute \"role\"",
    \"proprietary attribute \"hidden\"",
\]
" =============================================================================

nnoremap <silent> <leader>tb :TagbarToggle<CR>

" =============================================================================

augroup JavaScript
  autocmd!
  autocmd FileType javascript nnoremap <buffer> <leader>rr :!node %<CR>
augroup END

" =============================================================================

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" =============================================================================

" YCM configuration
set complete=.,b,u,]
set wildmode=longest,list:longest
set completeopt=menu,preview

" =============================================================================

" Tern settings
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

" =============================================================================
