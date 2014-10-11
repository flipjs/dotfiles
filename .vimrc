" =============================================================================

set nocompatible
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
set modelines=0                                            " learn more on this

" =============================================================================

" set snippets location for SnipMate
let g:snippets_dir = "~/.vim/snippets"

" =============================================================================

set tabstop=2
set shiftwidth=2
set softtabstop=2
" expand tabs into spaces
set expandtab

" =============================================================================

set encoding=utf-8
set scrolloff=1
set autoindent
" do NOT uncomment smartindent, otherwise weird behavior for indenting braces
" set smartindent
set showmode
set showcmd
set hidden
set wildmenu
" set wildmode=full
" set wildmode=list:longest
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
" set hlsearch
" toggles search highlighting
nnoremap <leader><space> :set hls!<CR>
" match bracket pairs instead of typing %
nnoremap <tab> %
vnoremap <tab> %

" =============================================================================

set wrap
set linebreak
set showbreak=↪\ 
set textwidth=79
set formatoptions=qrn1
" set colorcolumn=85
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
" uncomment if you split lines a lot but check first if K is not being used
" makes K split lines (the opposite of J)
" nnoremap K i<cr><esc>k$
" makes Q quit
nnoremap Q :q<CR>

" =============================================================================

" Dash shortcut
nmap <silent> <leader>d <Plug>DashSearch

" =============================================================================

" you may hit F1 when pressing ESC, so make it ESC as well
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

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
"imap <C-f> <Plug>snipMateNextOrTrigger
"smap <C-f> <Plug>snipMateNextOrTrigger
imap vv <ESC>a<Plug>snipMateNextOrTrigger
smap vv <Plug>snipMateNextOrTrigger

" =============================================================================

" command line history
nnoremap <leader>hi q:

" =============================================================================

"nnoremap ; :

" =============================================================================

" save on losing focus
au FocusLost * :wa

" =============================================================================

" strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" =============================================================================

nnoremap <leader>A :Ack

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
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

nnoremap <silent> <leader>eh :e .vim.tips<CR>

" =============================================================================

" go back to normal mode
inoremap fg <C-c>
" go to above or below, start or end of line on insert mode
inoremap hh <C-c>A
inoremap jj <C-c>o
inoremap kk <C-c>O
inoremap ii <C-c>I
" delete to end of line on insert mode
inoremap <C-d> <C-c>lc$

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

nnoremap <silent> <leader>bt :TagbarToggle<CR>

" =============================================================================

augroup JavaScript
  autocmd!
  autocmd FileType javascript nnoremap <buffer> <leader>rr :!node %<CR>
augroup END

" =============================================================================

" does NOT work with SnipMate, so switched it off for now

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

" do NOT uncomment, might break SnipMate auto-completion
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <s-tab> <c-n>

" =============================================================================

function! OpenUrlUnderCursor()
  let url=matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
  if url != ""
    silent exec "!open '".url."'" | redraw! 
  endif
endfunction

map <leader>o :call OpenUrlUnderCursor()<CR>

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
" set popup background to match airline tomorrow theme
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#ffffff guibg=#ae8762

" =============================================================================

" mapping delay, my sweetspot (ymmv)
set timeoutlen=500

" =============================================================================

" Tern settings
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'
