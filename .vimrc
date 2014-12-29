" =============================================================================

set nocompatible
filetype off
call pathogen#infect()
call pathogen#helptags()
" do not use smartindent or cindent, use below instead
filetype plugin indent on
set nomodeline
set mouse=a
set clipboard=unnamed

" =============================================================================

" set snippets location for SnipMate
let g:snippets_dir = "~/.vim/snippets"

" =============================================================================

set tabstop=4
set shiftwidth=4
set softtabstop=4
" set expandtab                                                 " tabs to spaces

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
" ensure set number is set for numbers.vim plugin when using vim 7.4.x
set number
" set relativenumber
" with numbers.vim plugin, no need to set relativenumber
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
if v:version > 704 || v:version == 704 && has("patch338")
  set breakindent
endif
set showbreak=↪\ 
set textwidth=79
set formatoptions=qrn1
" match ErrorMsg '\%>79v.\+'
nnoremap <leader>99 :match ErrorMsg '\%>80v.\+'<CR>
nnoremap <leader>00 :match none<CR>
syntax on

" =============================================================================

" this breaks the macvim with the breakindent command. commented out for now
" save folds and reload automatically
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview

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
" close current buffer
nnoremap <leader>dd :bd<CR>
nnoremap <leader>ww :w<CR>

" =============================================================================

" Copy to end of line, not all of line
nnoremap Y y$

" Save file that requires root permission
cmap w!! %!sudo tee > /dev/null %

" Select all text in buffer
nnoremap <leader>aa ggvG

" Toggle case
nnoremap <leader>uu g~iw

" Better home/end keys - synonymous to normal movement
nnoremap H ^
nnoremap L $
vnoremap L g_

" rebind original H and L
nnoremap <leader>H H
nnoremap <leader>L L

" Emacs-like Home/End in insert and command mode
" " inoremap <c-a> <esc>I
" " inoremap <c-e> <esc>A
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" =============================================================================

" Dash shortcut
nmap <C-h> <Plug>DashSearch

" =============================================================================

" Gundo settings
set undodir=~/.vim/tmp/undo
" set undofile
set history=1000
set undolevels=1000
let g:gundo_width = 30
nnoremap <leader>un :GundoToggle<CR>

" =============================================================================

" ctrl-f for snipmate completion, use vv instead
" imap <C-f> <Plug>snipMateNextOrTrigger
" smap <C-f> <Plug>snipMateNextOrTrigger
imap vv <ESC>a<Plug>snipMateNextOrTrigger
smap vv <Plug>snipMateNextOrTrigger

" =============================================================================

" set wrap toggle
nnoremap <leader>WR :set wrap!<CR>
" set paste toggle
nnoremap <leader>pt :set paste!<CR>
" set relativenumber toggle
" nnoremap <leader>rn :set relativenumber!<CR>
" command line history
nnoremap <leader>ch q:
" reselect the text that was just pasted
nnoremap <leader>v V`]

" =============================================================================

" save on losing focus
au FocusLost * :wa

" =============================================================================

nnoremap <leader>A :Ack

" =============================================================================

" open .vimrc in a new tab
nnoremap <leader>ov :e $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>
nnoremap <leader>eh :e .vim.tips<CR>

" =============================================================================

" vim-session plugin
let g:session_autoload = 'no'
let g:session_autosave = 'no'
nnoremap <leader>os :OpenSession<CR>
nnoremap <leader>ss :SaveSession<CR>

" =============================================================================

" CDC = Change to Directory of Current file
command CDC cd %:p:h
" Use %% on the command line to expand to the path of the current file
cabbr <expr> %% expand('%:p:h')

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

" Better looking splits
set fillchars+=vert:│
if has("gui_running")
  highlight vertsplit guibg=bg guifg=#999999 ctermbg=bg ctermfg=white
endif

" =============================================================================

" Move between splits with q + hjkl, new splits with qs or qv
nnoremap q <c-w>
" rebind q (macro recording) to Q
nnoremap Q q

" =============================================================================

" new split window go to bottom and right
set splitbelow
set splitright

" =============================================================================

" open new buffer or tab
nnoremap <leader>wn <ESC>:enew<CR>                " new buffer
nnoremap <leader>wb <ESC>:new<CR>                 " new split bottom
nnoremap <leader>wv <ESC>:vnew<CR>                " new split right
nnoremap <leader>wt <ESC>:tabe<CR>                " new tab

" =============================================================================

" edit file showing path
nnoremap <leader>en :e <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>eb :sp <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" =============================================================================

nnoremap <leader>ex <ESC>:Explore<CR>             " explore files

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
nnoremap <C-c> :bnext<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bb :b#<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bl :ls<CR>
" delete empty buffers
nnoremap <leader>ee :call DeleteEmptyBuffers()<CR>

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
let g:airline_section_b = "%{strftime('%H:%M')}"

" =============================================================================

" CtrlP mappings
" let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
nnoremap <leader>ff :CtrlP<CR>
nnoremap <leader>fb :CtrlPBuffer<CR>
nnoremap <leader>fr :CtrlPMRU<CR>
nnoremap <leader>fm :CtrlPMixed<CR>
nnoremap <leader>fc :CtrlPCurWD<CR>

" =============================================================================

" switch filetype
nnoremap <leader>fth :set ft=html<CR>
nnoremap <leader>ftj :set ft=javascript<CR>
nnoremap <leader>ftc :set ft=css<CR>

" =============================================================================

" Syntastic settings
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol='X'
let g:syntastic_warning_symbol='!'
let g:syntastic_auto_loc_list=2
let g:syntastic_loc_list_height=5

let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_tidy_ignore_errors = [" proprietary attribute \"ng-"]
let g:syntastic_html_tidy_ignore_errors = [ '<form> lacks "action" attribute', 'trimming empty <i>', 'trimming empty <li>', 'unescaped & which should be written as &amp;', '<form> proprietary attribute "novalidate"', '<input> proprietary attribute "required"', '<tags-input> is not recognized!', 'trimming empty <tags-input>', 'discarding unexpected <tags-input>', 'discarding unexpected </tags-input>', '<fb:login-button> is not recognized!', 'discarding unexpected <fb:login-button>', 'discarding unexpected </fb:login-button>', '<div> attribute "id" has invalid value ', '<a> escaping malformed URI reference', '<textarea> proprietary attribute "placeholder"', 'trimming empty <span>', '<img> escaping malformed URI reference', '<img> lacks "src" attribute' ]
" =============================================================================

nnoremap <leader>tb :TagbarToggle<CR>

" =============================================================================

augroup JavaScript
  autocmd!
  autocmd FileType javascript nnoremap <buffer> <leader>rr :!node %<CR>
  autocmd FileType javascript nnoremap <buffer> <leader>jh :!jshint %<CR>
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
" let g:tern_show_argument_hints='on_hold'
" disable preview window
autocmd BufEnter * set completeopt-=preview

" =============================================================================

" tabular settings
nmap <leader>ae :Tabularize /=<CR>
vmap <leader>ae :Tabularize /=<CR>
nmap <leader>ac :Tabularize /:<CR>
vmap <leader>ac :Tabularize /:<CR>

" =============================================================================

" disable concealing quotes in json file
let g:vim_json_syntax_conceal = 0

" =============================================================================

" hit v to select 1 char, hit again to expand and so on. ctrl-v to reverse
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" =============================================================================

" close tag
inoremap ,/ </<C-X><C-O>

" =============================================================================

" tcomment_vim plugin - remap to leader-cc
map <leader>cc <C-_><C-_>

" =============================================================================

" vim-session plugin
let g:session_autoload = 'no'
let g:session_autosave = 'no'

" =============================================================================

" sparkup config
let g:sparkupDoubleQuote = 1

" =============================================================================

" Soure current line / selection
vnoremap <leader>sr y:execute @@<cr>:echo 'Sourced selection.'<cr>
nnoremap <leader>sr ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>

" =============================================================================

