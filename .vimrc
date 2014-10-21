" ------------------------------------------------------------------------------
" General Settings
" ------------------------------------------------------------------------------

set bdir+=/tmp
set dir-=.
set dir+=/tmp
set nocompatible
set undolevels=10000
set undofile
set undodir=/tmp
set history=10000
set encoding=utf8
set backspace=indent,eol,start
set nobackup
set nowritebackup
set noswapfile
set nomodeline
set selection=inclusive
set pastetoggle=<F2>
set textwidth=999999999
set ignorecase
set smartcase
set formatoptions-=r

let mapleader = "\<Space>"

" ------------------------------------------------------------------------------
" Foldings
" ------------------------------------------------------------------------------

set foldmethod=indent
set foldlevelstart=99

" ------------------------------------------------------------------------------
" WhiteSpacing
" ------------------------------------------------------------------------------

autocmd BufWritePre * :%s/\s\+$//e
set listchars=tab:>~,nbsp:_,trail:.
set softtabstop=2
set shiftwidth=2
set expandtab
set tabstop=2
set list

" ------------------------------------------------------------------------------
" Vundle
" ------------------------------------------------------------------------------

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'dhruvasagar/vim-railscasts-theme'

Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler.vim'

Plugin 'terryma/vim-smooth-scroll'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-obsession'
Plugin 'szw/vim-maximizer'
Plugin 'gregsexton/gitv'

Plugin 'kchmck/vim-coffee-script'
Plugin 'thoughtbot/vim-rspec'
Plugin 'myusuf3/numbers.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-rsi'

Plugin 'gorodinskiy/vim-coloresque'
Plugin 'Raimondi/delimitMate'

Plugin 'vasconcelloslf/vim-foldfocus'
Plugin 'vasconcelloslf/vim-interestingwords'
Plugin 'kannokanno/unite-todo'
Plugin 'mattn/flappyvird-vim'
Plugin 'majutsushi/tagbar'
Plugin 'vasconcelloslf/YUNOcommit.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" ------------------------------------------------------------------------------
" Mappings
" ------------------------------------------------------------------------------

" Because fuck you, thats why.
noremap q :q<cr>

" Basic mappings
noremap <leader>w :w<CR>
nnoremap <leader>s :%s/

" Remap ctrlp and ctrlbuffer
let g:ctrlp_map = '<Leader>t'

nmap <leader>t :CtrlP<CR>
nmap <leader>T :CtrlPBuffer<CR>

" Find with ack ignoring .log files
nmap <leader>ss :Ack --ignore-dir=log<Space>
nmap <leader>sw :Ack <CR><Space>

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

" Paste mode
nmap [p :set paste<CR>
nmap ]p :set nopaste<CR>

nmap zM zMz

" Maximize a window
nnoremap <Leader>o :MaximizerToggle<CR>

" Run the tests in a spec file
map <Leader>r :call RunNearestSpec()<CR>
map <Leader>R :call RunCurrentSpecFile()<CR>

" Git mappings (fugitive, gitgutter and gitv)
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gb :Gblame<CR>
map <Leader>gv :Gitv --all<CR>
map <Leader>gr :GitGutterRevertHunk<CR>
map <Leader>gn :GitGutterNextHunk<CR>
map <Leader>gp :GitGutterPrevHunk<CR>

" Buffer manipulation mappings
nmap <C-n> :bnext<CR>
nmap <C-p> :bprevious<CR>
map <Leader>bc :Bclose<CR>
map <Leader>ba :call DeleteInactiveBufs()<CR>

" FoldFocus
nmap <CR> :call FoldFocus('e')<CR>
nmap <Leader><CR> :call FoldFocus('vnew')<CR>

map <Leader>bd :bd<CR>

" Open all buffers vertical splitted
nmap <Leader>sa :sba<CR>

" Open all buffers horizontal splitted
nmap <Leader>va :vert sba<CR>

" Reload and edit .vimrc
nnoremap <leader>ev :vsplit ~/Dotfiles/.vimrc<cr>
nnoremap <leader>rv :source ~/Dotfiles/.vimrc<cr>

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

" Keep the search terms on the center of the screen
nnoremap n nzz
nnoremap N Nzz

" Make * work for visual mode
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" Lowercase the current word
noremap <C-u> gUiw

" Highlight the current line
nnoremap vv ^vg_

" Position the cursor in the right place after typing {}
imap {<cr> {<cr>}<c-o>O

" Vimfiler
nnoremap <Leader>f :VimFiler -force-quit<CR>

let g:vimfiler_safe_mode_by_default=0
let g:vimfiler_as_default_explorere=1

" Tagbar
nnoremap <Leader>T :TagbarToggle<CR>

autocmd FileType vimfiler nmap <silent><buffer><expr> <CR> vimfiler#smart_cursor_map(
      \ "\<Plug>(vimfiler_expand_tree)",
      \ "\<Plug>(vimfiler_edit_file)")

let g:vimfiler_execute_file_list = {}
let g:vimfiler_execute_file_list['_'] = 'vim'

let g:YUNOcommit_after=50

" ------------------------------------------------------------------------------
" Unite.vim configurations
" ------------------------------------------------------------------------------

let g:unite_source_history_yank_enable = 1

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

nnoremap <leader>t :Unite -no-split -buffer-name=files    -start-insert file_rec/async<cr>
nnoremap <leader>y :Unite -no-split -buffer-name=yank     history/yank<cr>
nnoremap <leader>s :Unite -no-split -buffer-name=search   grep:.<cr>

" call unite#custom#source('file_rec/async', 'ignore_pattern', 'node_modules/\|database_songs/\|public/')
call unite#custom#source('file_rec/async', 'ignore_pattern', 'plugins/\|database_songs/\|tmp/\|node_modules/\|platforms/\|.vagrant/\|classes/')

" Custom mappings for the unite buffer
"
autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  nmap <buffer> p       <Plug>(unite_exit)
endfunction

" ------------------------------------------------------------------------------
" Search and Replace
" ------------------------------------------------------------------------------

set hlsearch
set wrapscan

" ------------------------------------------------------------------------------
" Presentation
" ------------------------------------------------------------------------------

set matchpairs+=<:>
set shortmess=aIoO
set cmdheight=1
set cursorline
set showmatch
set showcmd
set hidden
set number
set ruler
set cf

syntax enable
filetype on
filetype indent on
filetype plugin indent on

colorscheme railscasts
set background=light

set t_ut=

" ------------------------------------------------------------------------------
" Misc
" ------------------------------------------------------------------------------

" Airline buffer tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Resize all splits when the (tmux) panel is resized
au VimResized * exe "normal! \<c-w>="

" Open the file in the same line that the cursor were when the buffer was closed
augroup line_return
  au!
  au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   execute 'normal! g`"zvzz' |
    \ endif
augroup END


" Don't close window when deleting a buffer
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
