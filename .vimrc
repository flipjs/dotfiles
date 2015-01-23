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

" indent size = 4
set tabstop=4
set shiftwidth=4
set softtabstop=4
" tab is space
" set expandtab
" tab is tab
set noexpandtab

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
set showbreak=»\
set textwidth=79
" set formatoptions+=t
set formatoptions=qrn1
" match ErrorMsg '\%>79v.\+'
nnoremap <leader>99 :match ErrorMsg '\%>80v.\+'<CR>
nnoremap <leader>00 :match none<CR>
syntax on

" =============================================================================

" code folding setup
nnoremap <SPACE> za
vnoremap <SPACE> za

" this breaks the macvim with the breakindent command. commented out for now
" save folds and reload automatically
" autocmd BufWinLeave * mkview
" autocmd BufWinEnter * silent loadview

" =============================================================================

" Shortcut to rapidly toggle `set list`
nmap <leader>ll :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

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

" QuickFix setup
nnoremap <leader>qc :cclose<CR>
nnoremap <leader>qo :copen<CR>
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

" =============================================================================

" Ack hotkey
nnoremap <C-A> :Ack!
" uncomment to use AG instead
" let g:ackprg = 'ag --nogroup --nocolor --column'

" =============================================================================

" Note-taking
command! -nargs=1 Ngrep vimgrep "<args>" $NOTES_DIR/**/*.txt
nnoremap <leader>ng :Ngrep

" =============================================================================

" makes j and k the way you expected and not jumping on long lines
nnoremap j gj
nnoremap k gk
" close current buffer
nnoremap <leader>dd :bd<CR>
nnoremap <leader>ww :w<CR>

" =============================================================================

" insert newline without entering insert mode using Enter key
" nnoremap <CR> O<ESC>j

" =============================================================================

" split line (opposite of shift-j)
" nnoremap <C-J> a<CR><ESC>k$

" =============================================================================

" Copy to end of line, not all of line
nnoremap Y y$

" Save file that requires root permission
cmap w!! %!sudo tee > /dev/null %

" Select all text in buffer
nnoremap <leader>aa ggVG

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
nmap <leader>h <Plug>DashSearch

" =============================================================================

" Gundo settings
set undodir=~/.vim/tmp/undo
" set undofile
set history=1000
set undolevels=1000
let g:gundo_width = 30
nnoremap <leader>un :GundoToggle<CR>

" =============================================================================

" set wrap toggle
nnoremap <leader>WR :set wrap!<CR>
" set paste toggle
nnoremap <leader>pt :set paste!<CR>
" set relativenumber toggle
" nnoremap <leader>rn :set relativenumber!<CR>
" command line history
nnoremap <leader>ch q:
" reselect the text that was just pasted and reindent
nnoremap <leader>v V`]=

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
" inoremap {<CR> {<CR>}<C-o>O<TAB>

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
" for some reasons, i get this error: E420: BG color unknown. commented for now
" if has("gui_running")
"   highlight vertsplit guibg=bg guifg=#999999 ctermbg=bg ctermfg=#FFFFFF
" endif

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
nnoremap <C-C> :bnext<CR>
nnoremap <C-X> :bprev<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bm :bp<CR>
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

nnoremap <leader>nt :NERDTreeToggle<CR>

" =============================================================================

" CtrlP settings

" ignore some files and dirs
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
" DO NOT USE CODE BELOW, otherwise wildignore and custom_ignore will not work!
" let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_match_window = 'min:4,max:28' "results imposed by max height
" let g:ctrlp_match_window = 'results:80' " overcome limit imposed by max height"

let g:ctrlp_match_window_reversed = 0
" let g:ctrlp_match_window_bottom = 0
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

let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_html_tidy_ignore_errors=["proprietary attribute" ,"trimming empty", "unescaped &" , "is not recognized!", "discarding unexpected", "inserting implicit", "missing", "lacks", "element not empty"]

" =============================================================================

nnoremap <leader>tb :TagbarToggle<CR>

" =============================================================================

augroup CoffeeScript
  autocmd!
  autocmd FileType coffee nnoremap <buffer> <leader>rr :CoffeeRun<CR>
  autocmd FileType coffee nnoremap <buffer> <leader>jc :CoffeeCompile vert<CR>
  autocmd FileType coffee nnoremap <buffer> <leader>jw :CoffeeWatch vert<CR>
  autocmd FileType coffee nnoremap <buffer> <leader>jl :!coffeelint %<CR>
augroup END

augroup JavaScript
  autocmd!
  autocmd FileType javascript nnoremap <buffer> <leader>rr :!node %<CR>
  autocmd FileType javascript nnoremap <buffer> <leader>jl :!jshint %<CR>
  " Work around to indent and tab when pressing return after the open curly brace
  autocmd FileType javascript inoremap {<CR> {<CR>}<C-o>O<TAB>
augroup END

" =============================================================================

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" =============================================================================

" JSBeautify config
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
autocmd FileType less vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
autocmd FileType scss vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

" =============================================================================

" vv - snipmate completion
imap <C-E> <ESC>a<Plug>snipMateNextOrTrigger
smap <C-E> <Plug>snipMateNextOrTrigger

" =============================================================================

" YCM configuration
set complete=.,b,u,]
set wildmode=longest,list:longest
set completeopt=menu,preview
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<ENTER>']

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

" Go config
let g:go_disable_autoinstall = 0
au FileType go nmap <Leader>gs <Plug>(go-implements)
au FileType go nmap <Leader>gi <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gg <Plug>(go-doc-browser)
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gc <Plug>(go-coverage)
au FileType go nmap <Leader>ge <Plug>(go-rename)

" =============================================================================

" rainbow config
autocmd FileType javascript syntax clear jsFuncBlock " hack to work with js
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
"
" ctermfgs: [ 'DodgerBlue3', 'DarkOrange3', 'SeaGreen3', 'Red3' ]
" rainbow cant detect these color names, so put actual value instead
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': [26, 130, 78, 124],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'css': 0,
\       'html': 0
\   }
\}

" =============================================================================

" Setting specific to MacVim
if has("gui_macvim")
    " use option key as meta
    set macmeta
    " MacVIM shift+arrow-keys behavior (required in .vimrc)
    let macvim_hig_shift_movement = 1
endif

" =============================================================================

" dont use this, use editorconfig plugin
" set exrc
" set secure

" dont use this, use editorconfig plugin
" load custom vimrc per project/folder
" let b:thisdir=expand("%:p:h")
" let b:vim=b:thisdir."/.vim"
" if (filereadable(b:vim))
"     execute "source ".b:vim
" endif
