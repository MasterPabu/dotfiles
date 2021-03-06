set nocompatible
filetype off

autocmd VimEnter * echo "Welcome, Venkat!"

call plug#begin('~/.vim/plugged')
Plug 'mattn/emmet-vim', { 'for': ['php','html'] }
Plug 'jiangmiao/auto-pairs'
Plug 'haya14busa/vim-auto-programming'
Plug 'ervandew/supertab'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/limelight.vim'
Plug 'flazz/vim-colorschemes'
Plug 'dracula/vim'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-sleuth'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'hail2u/vim-css3-syntax'
Plug 'majutsushi/tagbar'
Plug 'chrisbra/csv.vim'
Plug 'raichoo/haskell-vim'
Plug 'mxw/vim-jsx'
Plug 'wakatime/vim-wakatime'
call plug#end()

set completefunc=autoprogramming#complete

filetype plugin indent on
syntax enable
set clipboard=unnamedplus
set termguicolors

color gruvbox

let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_italic = 1

let base16colorspace=256
set background=dark
set t_Co=256
set encoding=utf-8

"set tabstop=4 softtabstop=0 expandtab shiftwidth=4
"set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4
set tabstop=4 shiftwidth=4
set listchars=tab:➢\ ,trail:~,extends:>,precedes:<
"set smarttab
set title
set autoindent
set smartindent
set backspace=indent,eol,start
set hlsearch
set ruler
set incsearch
set encoding=utf8
set wildmenu
set number
set showmatch

set list

"set cursorline

set splitbelow
set splitright
"
"highlight CursorLine cterm=bold ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set nobackup
set nowb
set noswapfile

let mapleader = "\<Space>"

cmap w!! w !sudo tee %

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

noremap <silent> <C-k> :call <SID>swap_up()<CR>
noremap <silent> <C-j> :call <SID>swap_down()<CR>
noremap <silent> <C-up> :call <SID>swap_up()<CR>
noremap <silent> <C-down> :call <SID>swap_down()<CR>

nnoremap <A-.> :call MoveToNextTab()<CR>
nnoremap <A-,> :call MoveToPrevTab()<CR>

:command WQ wq
:command Wq wq
:command W w
:command Q q

:command Set set

nnoremap <CR> :noh<CR><CR>

map <c-o> :NERDTreeToggle<CR>

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
set ttimeoutlen=0

let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-o>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_exit_from_insert_mode=0
let g:multi_cursor_exit_from_visual_mode=0

map <leader>e :bp<bar>sp<bar>bn<bar>bd<CR>.

function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif
    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif
    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

func! WordProcessorMode()
    setlocal formatoptions=1
    setlocal noexpandtab
    map j gj
    map <Down> gj
    map k gk
    map <Up> gk
    setlocal spell spelllang=en_us
    set complete+=s
    set formatprg=par
    setlocal wrap
    setlocal linebreak
endfu
com! WP call WordProcessorMode()

func! DayMode()
    color base16-gruvbox-light-hard
    AirlineTheme gruvbox
    let g:airline_theme='gruvbox'
endfu
com! Day call DayMode()

func! NightMode()
    color gruvbox
    AirlineTheme gruvbox
endfu
com! Night call NightMode()

func! PlaySound()
  silent! exec '!play -q ~/.vim/type/sound1.aiff &'
endfunction
"autocmd CursorMovedI * call PlaySound()

nnoremap <Leader>w :bn<CR>
nnoremap <Leader>q :bp<CR>
