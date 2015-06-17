"Load pathogen plugins
execute pathogen#infect()
syntax on
filetype plugin indent on

" Make switching buffers/tabs easy
nnoremap <Leader>b :ls<CR>:buffer!<Space>
nnoremap <Leader>t :tabs<CR>:tabn<Space>

inoremap <Leader> <Esc>
inoremap <C-\> \
vnoremap <Leader> <Esc>
nnoremap <Tab> zz
nnoremap j gj
nnoremap k gk

"Add the (e)x(ecute) macro
let @x = 'v$""y@"'

" Readline bindings for command mode
"cnoremap <C-a> <Home>
"cnoremap <C-e> <End>
"cnoremap <C-p> <Up>
"cnoremap <C-n> <Down>
"cnoremap <C-b> <Left>
"cnoremap <C-f> <Right>
"cnoremap <C-d> <Del>
"cnoremap <C-h> <BS>
cnoremap <C-r> <C-f>?
cnoremap <C-s> <C-f>/
" The bindings below ought to be <M-...>, this is specific to 0SX
cnoremap <C-[>b <S-Left>
cnoremap <C-[>f <S-Right>
nnoremap <space> :w<CR>
nnoremap Q :bd<CR>
noremap ;; :%s:::g<Left><Left><Left>
"Javascript convenience
inoremap <C-l> console.log("")<Left><Left>
"Yank the current buffer full path to clipboard
nnoremap <silent> -y :let @+ = expand("%:p")<CR>
"nnoremap <silent> -[ <C-O>
"nnoremap <silent> -] <C-I>
noremap -ms :mksession! .Session.vim<CR>
nnoremap  -ss :source .Session.vim<CR>
" v(imrc)
noremap <silent> -tv :tabe ~/.vimrc<CR>
noremap <silent> -tl :tabe ~/Documents/learned<CR>
noremap -sv :source ~/.vimrc<CR>
" s(hell)
noremap <silent> -sh :shell<CR>
" t(rim) whitespace
noremap <silent> -t :%s:\s*$::g<CR>

" Settings
set backspace=indent,eol,start
set autochdir
set autoread
set display=lastline    " display lines that extend past bottom
set expandtab
set foldenable          " enable folds
set history=50		" keep 50 lines of command line history
set hlsearch
set incsearch		" do incremental searching
" Use Vim settings, rather than Vi settings (much better!).
set nocompatible
"set nomore              " removes the annoying vim page message thing
set noswapfile
set pastetoggle=<F2>
set ruler		" show the cursor position all the time
set shiftwidth=4
set showcmd		" display incomplete commands
set showmode
set softtabstop=4
set textwidth=78
set undofile
set wildmenu
set wildmode=longest:full
" Tap pages is omitted from below, so sessions are per tab
set sessionoptions=blank,buffers,curdir,folds,help,options,winsize
" Centralize backups, swapfiles and undo history
if exists("&backupdir")
    set backupdir=~/.vim/backups
endif
if exists("&directory")
    set directory=~/.vim/swaps
endif
if exists("&undodir")
    set undodir=~/.vim/undo
endif
colorscheme uncolor

highlight MatchParen cterm=underline " causes unmatched parens to be visible

" Disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Let commentary default to #, if filetype is empty useful when opening cmd line and editing a bash/awk script
autocmd BufRead,BufNewFile * if &ft == '' | set commentstring=#\ %s | endif

autocmd BufDelete * if len(filter(range(1, bufnr('$')), '!empty(bufname(v:val)) && buflisted(v:val)')) == 1 | quit | endif
