" Source system vim config, necessary because of alias
" in bash_aliases, which when skipped disallows plugins..
so $VIM/vimrc

" Create a scratch buffer
nmap <Leader>s :new<CR>:setlocal buftype=nofile<CR>:setlocal bufhidden=hide<CR> :setlocal noswapfile

" Make switching buffers easy
nmap <Leader>b :ls<CR>:buffer!<Space>

imap \ <Esc>
vmap \ <Esc> 
inoremap <C-\> \
nnoremap \ :noh<CR>
map <down> <C-d>zz
map <up> <C-u>zz
nnoremap <tab> zz
nnoremap '. '.zz
nnoremap j gj
nnoremap k gk

" Readline bindings for command mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
cnoremap <C-x><C-e> <C-f>
cnoremap <C-r> <C-f>?
cnoremap <C-s> <C-f>/
" The bindings below ought to be <M-...>, this is specific to 0SX
cnoremap <C-[>b <S-Left>
cnoremap <C-[>f <S-Right>

nnoremap <space> :w<CR>
nnoremap Q :q!<CR>
noremap ;; :%s:::g<Left><Left><Left>

set nocompatible                     " Use Vim settings, rather than Vi settings (much better!).
set foldmethod=syntax
set expandtab
set softtabstop=4
set shiftwidth=4
set pastetoggle=<F2>
set noswapfile
set autochdir
set showmode
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set hlsearch
set autochdir
set noswapfile
set undofile
set nomore              " removes the annoying vim page message thing
set display=lastline    " display lines that extend past bottom
syntax on
set wildmode=longest:full
set wildmenu

" Load pathogen plugins
execute pathogen#infect('~/dotfiles/vim/bundle/{}')
filetype plugin indent on

" These two lines must come after executing pathogen,
" otherwise changing runtimepath borks pathogen's path
" further experimentation required for a workaround
let &rtp = expand("~/dotfiles/vim") . "," . &rtp
colorscheme uncolor

highlight MatchParen cterm=underline " causes unmatched parens to be visible

" Disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
