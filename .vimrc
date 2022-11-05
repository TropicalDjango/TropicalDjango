"
"██╗░░░██╗██╗███╗░░░███╗░█████╗░░█████╗░███╗░░██╗███████╗██╗░██████╗░
"██║░░░██║██║████╗░████║██╔══██╗██╔══██╗████╗░██║██╔════╝██║██╔════╝░
"╚██╗░██╔╝██║██╔████╔██║██║░░╚═╝██║░░██║██╔██╗██║█████╗░░██║██║░░██╗░
"░╚████╔╝░██║██║╚██╔╝██║██║░░██╗██║░░██║██║╚████║██╔══╝░░██║██║░░╚██╗
"░░╚██╔╝░░██║██║░╚═╝░██║╚█████╔╝╚█████╔╝██║░╚███║██║░░░░░██║╚██████╔╝
"░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝░╚════╝░░╚════╝░╚═╝░░╚══╝╚═╝░░░░░╚═╝░╚═════╝░
"
"
" GENERAL ------------------------------------------------{{{

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" ZoomWin thingy
set nocp
 
" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add relative numbers to each line.
set number relativenumber

" Highlight cursor line horizontally.
set cursorline

" Highlight cursor line vertically.
set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Don't save backupfiles.
set nobackup

" Don't let cursor scroll below or above N lines when scrolling.
set scrolloff=10

" Don't wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching through a file incrementally highlight matching chars.
set incsearch

" Ignore char-case during search.
set ignorecase

" This allows to search for capital letters.
set smartcase

" Show partial command you type in the last line
set showcmd

" Show the mode on last line
set showmode

" Show matching words.
set showmatch

" use higlighting during search
set hlsearch

" Set commands to save in history default is 20
set history=1000

" Enalbe autocomplete menu after pressing TAB
set wildmenu

" Make wildmenu behave like bash completion
set wildmode=list:longest

" Ignore files with these extensions
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.mat

" Set the background tone.
set background=dark

" Set the color scheme.
colorscheme molokai
" }}}

" PLUGINS -----------------------------------------------------------------------{{{

call plug#begin('~/.vim/plugged')

    Plug 'dense-analysis/ale'
    Plug 'preservim/nerdtree'
    Plug 'vim-scripts/ZoomWin'   
call plug#end()
" }}}

" MAPPINGS ----------------------------------------------------------------------{{{

" '\' is set as the leader
let mapleader ='\'

" Press \\ to jump back to last cursor position
nnoremap <leader>\ ''

" Press \p to print the current file to the default printer from a linux
" operating system
"
" View available printers:      lpstat -v
" Set default printer:          lpoptions -d <printer_name>
" <silent> means don't display output.

nnoremap <silent> <leader>p :%w !lp<CR>

" buffer select

nnoremap <silent> <leader>b :edit<SPACE>
nnoremap <silent> <leader>n :bnext<CR>
nnoremap <silent> <leader>v :bprev<CR>

nnoremap <silent> <leader>z :ZoomWin<CR>
nnoremap <leader>s :split<SPACE>
" Type jj to exit insert mode
"
inoremap jj <esc>

" Press space bar to type the : character in command mode
nnoremap <space> :

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below current line
nnoremap o o<esc>
nnoremap O O<esc>

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to end of line using Y.
nnoremap Y y$

" Map the f5 key to run a python script inside Vim.
" I map F5 to a chain of commands here.
" :w save file
" <CR> (carriage return) is like pressing enter
" !clear: runs the external clear screen command
" !python3 % excecutes the current file with Python
nnoremap <F5> :w <CR>:!clear <CR>:!python3 % <CR>

" You can split the window in Vim by typing :split or :vsplit.
" Navigate split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" NERDTree specfic mappings.
" Map the F3 key to toggle NERDTree open and close.
noremap <F3> :NERDTreeToggle<CR>

" Have NERDTree ignore certain files and directories
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']


" }}}

" VIMSCRIPT ---------------------------------------------------------------------{{{

" ENABLE CODE FOLDING.
" Use the marker method of folding.
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END

" If the current file type is HTML, set indentation to 2 spaces.
autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" You can split a window into sections by typing ':split' or ':vsplit'.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

" If GUI version of Vim is running set these options.
if has('gui_running')
    " Set the background tone.
    set background=dark

    " Set the color scheme.
    colorscheme=molokai

    " Set a custom font you have installed.
    " Syntax: set guifont=<font_name>\ <font_weight>\ <size>
    set guifont=Roboto\ Regular\ 14
    
    " Display more of the file by default.
    " Hide the toolbar.
    set guioptions-=T

    " Hide the right-side scroll bar.
    set guioptions-=R
     
    " Hide the left-side scroll bar.
    set guioptions-=L
 
    " Hide the menu bar.
    set guioptions-=M
 
    " Hide the bottom scroll bar.
    set guioptions-=B

    " Map the F4 key to toggle the menu, toolbar, and scroll bar.
    " <Bar> is the pipe character.
    " <CR> is the enter key.
    noremap <F4> :if &guioptions=~#'mTr' <Bar>
        \set guioptions-=mTr<Bar>
        \else<Bar>
        \set guioptions+=mTr<Bar>
        \endif<CR>
endif 

function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > =0?'  '.l:branchname.' ':''
endfunction

" }}}

" STATUS LINE -------------------------------------------------------------------{{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to seperate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}

" END ----------------------------------------{{{

" Load all plugins"
" Plugins need to be added to runtimepath before helptag can be generated. 
packloadall

" Load all helptags now, after plugins have been generated
" All messages and errors will be ignored.
silent! helptags ALL

" }}}

