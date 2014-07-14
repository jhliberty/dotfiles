
" ------------------------------------------------------------------------------
" General Settings
" ------------------------------------------------------------------------------

set bdir+=/tmp
set dir-=.
set dir+=/tmp
set nocompatible                             " Turn off vi compatibility.
set undolevels=10000                         " Large undo levels.
set undofile                                 " Save undo tree.
set undodir=/tmp                             " Undo tree directory.
set history=10000                            " Size of command history.
set encoding=utf8                            " Always use unicode.
set backspace=indent,eol,start               " Fix backspace.
set nobackup                                 " Disable backups.
set nowritebackup
set noswapfile
set nomodeline
set selection=inclusive                      " Select to the end of line.
set pastetoggle=<F2>

let mapleader = "\<Space>"

" ------------------------------------------------------------------------------
" Foldings
" ------------------------------------------------------------------------------

set foldmethod=indent
set foldlevelstart=1

" ------------------------------------------------------------------------------
" WhiteSpacing
" ------------------------------------------------------------------------------

set listchars=tab:>~,nbsp:_,trail:.  " Displays whitespaces and tab as chars
set list

set tabstop=2                     " Set tab to equal 4 spaces.
set softtabstop=2                 " Set soft tabs equal to 4 spaces.
set shiftwidth=2                  " Set auto indent spacing.
set expandtab

autocmd BufWritePre * :%s/\s\+$//e   " Remove trailing whitespace

" ------------------------------------------------------------------------------
" Vundle
" ------------------------------------------------------------------------------

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'dhruvasagar/vim-railscasts-theme'

Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'

Bundle 'terryma/vim-smooth-scroll'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-commentary'
Bundle 'Townk/vim-autoclose'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-bundler'
Bundle 'szw/vim-maximizer'
Bundle 'gregsexton/gitv'

Bundle 'kchmck/vim-coffee-script'
Bundle 'thoughtbot/vim-rspec'
Bundle 'myusuf3/numbers.vim'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-rsi'
Bundle 'szw/vim-g'

" ------------------------------------------------------------------------------
" Mappings
" ------------------------------------------------------------------------------

" Basic mappings
map <C-c> <Esc>

noremap <leader>w :w<CR>
noremap <leader>q :q<cr>
noremap <leader>rp :%s/

" Remap ctrlp and ctrlbuffer
let g:ctrlp_map = '<Leader>t'

nmap <leader>t :CtrlP<CR>
nmap <leader>T :CtrlPBuffer<CR>

" Find with ack ignoring .log files
nmap <leader>f :Ack --ignore-dir=log<Space>

" Indent with tab and shift+tab the selected lines
vmap <Tab> >gv
vmap <S-Tab> <gv

" Exit insert mode with jk (smash exit)
imap jk <Esc>:w<CR>
imap JK <Esc>:w<CR>
imap jK <Esc>:w<CR>
imap kJ <Esc>:w<CR>
imap kj <Esc>:w<CR>
imap KJ <Esc>:w<CR>

" Go to the current file in the nerd tree
nmap <leader>nf :NERDTreeFind<cr>

" Paste mode
nmap [p :set paste<CR>
nmap ]p :set nopaste<CR>

nmap zM zMz

" Maximize a window
nnoremap <Leader>o :MaximizerToggle<CR>

" Open nerd tree like with <C-w>t
nmap <C-w>t :NERDTreeToggle<CR>

" Run the tests in a spec file
map <Leader>r :call RunNearestSpec()<CR>
map <Leader>R :call RunCurrentSpecFile()<CR>

" Git mappings (fugitive, gitgutter and gitv)
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gb :Gblame<CR>
map <Leader>gv :Gitv --all<CR>
map <Leader>gr :GitGutterRevertHunk<CR>

" Buffer manipulation mappings
nmap <C-n> :bnext<CR>
nmap <C-p> :bprevious<CR>
map <Leader>bc :Bclose<CR>
map <Leader>ba :call DeleteInactiveBufs()<CR>
map <Leader>bd :bd<CR>

" Open all buffers vertical splitted
nmap <Leader>sa :sba<CR>

" Open all buffers horizontal splitted
nmap <Leader>va :vert sba<CR>

" Reload and edit .vimrc
nnoremap <leader>ev :vsplit /Users/vasconcelloslf/Dotfiles/.vimrc<cr>
nnoremap <leader>rv :source /Users/vasconcelloslf/Dotfiles/.vimrc<cr>

" Move up/down the selected lines
vnoremap <C-k> :mo'<-- <CR> gv
vnoremap <C-j> :mo'>+ <CR> gv

" Smooth scrool
noremap <silent> <C-b> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <C-f> :call smooth_scroll#down(&scroll, 0, 2)<CR>

" Clone the current paragraph
noremap cp yap<S-}>p

" Align the current paragprah
noremap <leader>a =ip

" ------------------------------------------------------------------------------
" Search and Replace
" ------------------------------------------------------------------------------

set hlsearch                      " Highlight search patterns.
set wrapscan                      " Wrap to top of buffer when searching.

" ------------------------------------------------------------------------------
" Presentation
" ------------------------------------------------------------------------------

set matchpairs+=<:>               " Pairs to match
set shortmess=aIoO                " Show short messages, no intro.
set cmdheight=1                   " Make command line height to 1 lines.
set cursorline                    " Highlight current line
set showmatch                     " Show matching parenthesis.
set showcmd                       " Show last command.
set hidden                        " Allow hidden buffers.
set number
set ruler                         " Show the cursor position.
set cf                            " Enable error jumping.

syntax on                         " Enable syntax highlighting.
filetype on                       " Detect file type.
filetype indent on                " Enable file indenting.
filetype plugin indent on         " Load syntax files for better indenting.

colorscheme railscasts " Load colorscheme

set t_ut=

" buffer tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" ------------------------------------------------------------------------------
" Misc
" ------------------------------------------------------------------------------

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Don't close window, when deleting a buffer
" -----------------------------------------
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Close hidden buffers
" -------------------
function! DeleteInactiveBufs()
    "From tabpagebuflist() help, get a list of all buffers in all tabs
    let tablist = []
    for i in range(tabpagenr('$'))
        call extend(tablist, tabpagebuflist(i + 1))
    endfor

    "Below originally inspired by Hara Krishna Dara and Keith Roberts
    "http://tech.groups.yahoo.com/group/vim/message/56425
    let nWipeouts = 0
    for i in range(1, bufnr('$'))
        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
        "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
            silent exec 'bwipeout' i
            let nWipeouts = nWipeouts + 1
        endif
    endfor
    echomsg nWipeouts . ' buffer(s) wiped out'
endfunction

command! Bdi :call DeleteInactiveBufs()
