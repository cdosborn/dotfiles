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

":echo "blah"
"Add the (e)x(ecute) macro
let @x = 'v$""y@"'

" The bindings below ought to be <M-...>, this is specific to 0SX
cnoremap <C-[>b <S-Left>
cnoremap <C-[>f <S-Right>
nnoremap <space> :w<CR>
"quit each tab
nnoremap Q ZQ
"center when jumping to next search
nnoremap n nzz
"center when jumping to prev search
nnoremap N Nzz
nnoremap # #zz
nnoremap * *zz
"Yank the current buffer full path to clipboard
nnoremap <silent> -yp :let @" = expand("%:p")<CR>
nnoremap <silent> -yf m`ggVG""y``
nnoremap <silent> -cp :let @* = expand("%:p")<CR>
nnoremap <silent> -cf m`ggVG"*y``
"save sessions as file name, to permit multiple sessions per dir
nnoremap -ms :mksession! .%.vim<CR>
nnoremap -ss :source .%.vim<CR>
nnoremap -su :%s:::gc<Left><Left><Left><Left>
nnoremap -dt :call setline(".", strftime("%m/%d/%y"))<CR> 

" v(imrc)
nnoremap <silent> -tv :tabe ~/.vimrc<CR>
nnoremap <silent> -tl :tabe ~/Documents/learned<CR>
nnoremap -sv :source ~/.vimrc<CR>
" s(hell)
nnoremap <silent> -sh :shell<CR>
nnoremap <silent> -sx :Sex<CR>
nnoremap -sm :sp /tmp/manblah \| :%!man -P cat <right>
" t(rim) whitespace
nnoremap <silent> -tr m`:%s:\s*$::g<CR>``

"function rename()


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
set virtualedit=all 
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

"autocmd BufDelete * if len(filter(range(1, bufnr('$')), '!empty(bufname(v:val)) && buflisted(v:val)')) == 1 | quit | endif
