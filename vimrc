" Set up plugins
set  nocompatible
filetype plugin indent on
syntax on

call plug#begin()

" Using git URL
Plug 'https://github.com/rking/ag.vim'
Plug 'https://github.com/Rykka/colorv.vim.git'
Plug 'git://github.com/PeterRincker/vim-argumentative.git'
Plug 'git://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/nvie/vim-flake8.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/cdosborn/vim-rsi.git'
Plug 'https://github.com/sjl/gundo.vim.git'

call plug#end()

" Load :Man plugin
source $VIMRUNTIME/ftplugin/man.vim

" Make switching buffers/tabs easy
nnoremap <Leader>b :ls<CR>:sbuffer!<Space>
nnoremap <Leader>t :tabs<CR>:tabn<Space>

" Better goto file
nnoremap gf :exec ":exec \":sb \" . expand(\"<cfile>\")"<CR>

inoremap <Leader> <Esc>
inoremap <C-\> \
inoremap / /<C-x><C-f><C-p>
vnoremap <Leader> <Esc>
nnoremap <Tab> zz
nnoremap j gj
nnoremap k gk
"nnoremap <silent> <C-J> <C-W><C-J>:exe 'resize +1000 \| vertical resize +1000'<CR>
"nnoremap <silent> <C-K> <C-W><C-K>:exe 'resize +1000 \| vertical resize +1000'<CR>
"nnoremap <silent> <C-L> <C-W><C-L>:exe 'resize +1000 \| vertical resize +1000'<CR>
"nnoremap <silent> <C-H> <C-W><C-H>:exe 'resize +1000 \| vertical resize +1000'<CR>
nnoremap <silent> <C-L> <C-W><C-L>
nnoremap <silent> <C-H> <C-W><C-H>
nnoremap <silent> <C-J> <C-W><C-J>
nnoremap <silent> <C-K> <C-W><C-K>
nnoremap <silent> <C-W>v :rightbelow vs<CR>
nnoremap <silent> ) gt<CR>
nnoremap <silent> ( gT<CR>

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
nnoremap g; g;zz
nnoremap g, g,zz
"Yank the current buffer full path to clipboard
nnoremap <silent> -yp :let @" = expand("%:p")<CR>
nnoremap <silent> -yf m`ggVG""y``
nnoremap <silent> -cp :let @* = expand("%:p")<CR>
nnoremap <silent> -cf m`ggVG"*y``
nnoremap <silent> -cf m`ggVG"*y``
nnoremap <nowait> ! :!
nnoremap -mn :Man<space>
nnoremap -ms :mksession! .session.vim<CR>
nnoremap -mx :!chmod +x %<CR>
nnoremap -mk :make<CR>
nnoremap -mc :!ctags -o .tags *<CR>
nnoremap -ss :source .session.vim<CR>
nnoremap -sf :w \| so %<CR>
nnoremap -su :%s:::gc<Left><Left><Left><Left>
" re(fresh)
nnoremap -re :normal! <CR>
nnoremap <silent> -dt :call setline(".", strftime("%m/%d/%y"))<CR>

" v(imrc)
nnoremap -sv :source ~/.vimrc<CR>
" s(hell)
" nnoremap <silent> -va :set wiw=20 \| only \| vertical all \| set wiw=9999<CR>
" nnoremap <silent> -sa :only \| all<CR>
" nnoremap <silent> -va :only \| vertical all<CR>
nnoremap <silent> -sa :only \| all<CR>
nnoremap -va <C-W>L:windo<space>normal<space><C-V><C-W>H<CR>
nnoremap -sa <C-W>J:windo<space>normal<space><C-V><C-W>K<CR>
nnoremap <silent> -sh :!clear && bash;<CR>
nnoremap <silent> -sx :Sex<CR>
nnoremap <silent> -ev :vsp ~/.vimrc<CR>
nnoremap <silent> -ec :sp ~/.vim/colors/uncolor.vim<CR>
" t(rim) whitespace
nnoremap <silent> -tr m`:%s:\s*$::g<CR>``

" Settings
set autochdir
set autoread
set backspace=indent,eol,start
set display=lastline
set expandtab
set foldenable
set history=50
set hlsearch
set incsearch
set noswapfile
set pastetoggle=<F2>
set ruler                      
set shiftwidth=4
set showcmd                    
set showmode
set softtabstop=4
set switchbuf=useopen,usetab
set sessionoptions=blank,tabpages,buffers,curdir,folds,help,options,winsize
set tags=.tags
set textwidth=78
set undofile
set virtualedit=all
set wildmenu
set wildmode=longest:full
" set wiw=9999
"set winminheight=0
set winminwidth=10
"set winminheight=0
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

" Disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Let commentary default to #, if filetype is empty useful when opening cmd line and editing a bash/awk script
" autocmd BufRead,BufNewFile * if &ft == '' | set commentstring=#\ %s | endif

autocmd WinEnter * :exe "normal \<c-w>|"

set statusline=\ %F%#Modified#\ %M\ 
set tabline=%!MyTabLine()
function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= ' ' . (i + 1) . ' '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999X'
  endif

  return s
endfunction
