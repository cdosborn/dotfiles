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
nnoremap <silent> <C-J> <C-W><C-J>:exe 'resize +1000 \| vertical resize +1000'<CR>
nnoremap <silent> <C-K> <C-W><C-K>:exe 'resize +1000 \| vertical resize +1000'<CR>
nnoremap <silent> <C-L> <C-W><C-L>:exe 'resize +1000 \| vertical resize +1000'<CR>
nnoremap <silent> <C-H> <C-W><C-H>:exe 'resize +1000 \| vertical resize +1000'<CR>

":echo "blah"
"Add the (e)x(ecute) macro
let @x = 'm`v$""y@"``'

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
nnoremap -mn :Man<space>
"save sessions as file name, to permit multiple sessions per dir
nnoremap -ms :mksession! .session.vim<CR>
nnoremap -mx !chmod +x %<CR>
nnoremap -ss :source .session.vim<CR>
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
set sessionoptions=blank,tabpages,buffers,curdir,folds,help,options,winsize
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
" autocmd BufRead,BufNewFile * if &ft == '' | set commentstring=#\ %s | endif

set tabline=%!MyTabLine()  " custom tab pages line
if !exists("*MyTabLine")
    function MyTabLine()
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
        let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
      endfor

      " after the last tab fill with TabLineFill and reset tab page nr
      let s .= '%#TabLineFill#%T'

      " right-align the label to close the current tab page
      if tabpagenr('$') > 1
        let s .= '%=%#TabLine#%999X'
      endif

      return s
    endfunction
endif

if !exists("*MyTabLabel")
    function MyTabLabel(i)
        let s = (a:i) . '' "complete tabline goes here
        let m = ''       " &modified counter
        " loop through each buffer in a tab
        for b in tabpagebuflist(a:i)
                " check and ++ tab's &modified count
                if getbufvar( b, "&modified" )
                        let m .= '+'
                endif
        endfor

        if m != ''
            let s .= ' ' . m
        endif

        return s
    endfunction
endif
