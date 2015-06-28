" Load pathogen plugins
execute pathogen#infect()
syntax on
filetype plugin indent on
" Load :Man plugin
source $VIMRUNTIME/ftplugin/man.vim

" Make switching buffers/tabs easy
nnoremap <Leader>b :ls<CR>:buffer!<Space>
nnoremap <Leader>t :tabs<CR>:tabn<Space>

inoremap <Leader> <Esc>
inoremap <C-\> \
inoremap / /<C-x><C-f><C-p>
vnoremap <Leader> <Esc>
nnoremap <Tab> zz
nnoremap j gj
nnoremap k gk

nnoremap <silent> <c-l> :call JumpToNextIndentifier()<cr>
nnoremap <silent> <c-h> :call JumpToPrevIndentifier()<cr>

":echo "blah"
"Add the (e)x(ecute) macro
let @x = 'm`v$""y@"``'
let @v = '0/[{}]V%o'

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
nnoremap <silent> -cf m`ggVG"*y``
nnoremap <nowait> ! :!
"save sessions as file name, to permit multiple sessions per dir
nnoremap -ms :mksession! .%.vim<CR>
nnoremap -mx !chmod +x %<CR>
nnoremap -ss :source .%.vim<CR>
nnoremap -su :%s:::gc<Left><Left><Left><Left>
nnoremap -dt :call setline(".", strftime("%m/%d/%y"))<CR> 

" v(imrc)
noremap -sv :source ~/.vimrc<CR>
" s(hell)
noremap <silent> -sh :!clear && bash;<CR>
noremap <silent> -sx :Sex<CR>
nnoremap <silent> -tv :tabe ~/.vimrc<CR>
nnoremap <silent> -tl :tabe ~/Documents/learned<CR>
" t(rim) whitespace
nnoremap <silent> -tr m`:%s:\s*$::g<CR>``

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
