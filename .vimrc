" ------------------------------------------------------------------------------
" General Settings
" ------------------------------------------------------------------------------
set dir-=.
set undofile
set nobackup
set smartcase
set dir+=/tmp
set noswapfile
set nomodeline
set ignorecase
set bdir+=/tmp
set nocompatible
set undodir=/tmp
set history=10000
set nowritebackup
set encoding=utf8
set pastetoggle=<F2>
set formatoptions-=r
set undolevels=10000
set textwidth=999999999
set selection=inclusive
set backspace=indent,eol,start

let mapleader = "\<Space>"

" ------------------------------------------------------------------------------
" Foldings
" ------------------------------------------------------------------------------

set foldmethod=indent
set foldlevelstart=99

" ------------------------------------------------------------------------------
" WhiteSpacing
" ------------------------------------------------------------------------------

set listchars=tab:>~,nbsp:_,trail:.
set softtabstop=2
set shiftwidth=2
set expandtab
set tabstop=2
set list

autocmd BufWritePre * :%s/\s\+$//e

" ------------------------------------------------------------------------------
" Vundle
" ------------------------------------------------------------------------------

filetype off
set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'vasconcelloslf/vim-railscasts-theme'

Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimfiler.vim'

Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'

Plugin 'vasconcelloslf/vim-foldfocus'
Plugin 'vasconcelloslf/YUNOcommit.vim'
Plugin 'vasconcelloslf/vim-interestingwords'

Plugin 'tpope/vim-rsi'
Plugin 'mattn/emmet-vim'
Plugin 'deris/vim-shot-f'
Plugin 'szw/vim-maximizer'
Plugin 'bling/vim-airline'
Plugin 'myusuf3/numbers.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'Raimondi/delimitMate'
Plugin 'junegunn/limelight.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'DanielFGray/DistractionFree.vim'

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

" Indent with tab and shift+tab the selected lines
vmap <Tab> >gv
vmap <S-Tab> <gv

" Exit insert mode with jk (smash exit)
imap jk <Esc>:w<CR>
imap JK <Esc>:w<CR>
imap jK <Esc>:w<CR>

" Paste mode
nmap [p :set paste<CR>
nmap ]p :set nopaste<CR>

" Better folding
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

" Reload and edit .vimrc
nnoremap <leader>ev :vsplit ~/Dotfiles/.vimrc<cr>
nnoremap <leader>rv :source ~/Dotfiles/.vimrc<cr>

" Move up/down the selected lines
vnoremap <C-k> :mo'<-- <CR> gv
vnoremap <C-j> :mo'>+ <CR> gv

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

" Highlight the current line
nnoremap vv ^vg_

" Position the cursor in the right place after typing {}
imap {<cr> {<cr>}<c-o>O

" YUNOCommit
let g:YUNOcommit_after=50

" Airline buffer tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#excludes = ['vimfiler:explorer']

" Resize all splits when the (tmux) panel is resized
au VimResized * exe "normal! \<c-w>="

" Emmet
let g:user_emmet_settings = {
\  'indentation' : '  '
\}

" Unite & Vimfiler
let g:vimfiler_safe_mode_by_default=0
let g:vimfiler_as_default_explorer=1
let g:vimfiler_execute_file_list = {}
let g:vimfiler_execute_file_list['_'] = 'vim'
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_mru_filename_format = ':.'

" Distractions
nnoremap <Leader>df <Esc>:DistractionsToggle<CR>
let g:distraction_free#toggle_limelight = 1
let g:distraction_free#toggle_tmux = 1

nnoremap <C-f>     :VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<cr>
nnoremap <C-t>     :Unite    -buffer-name=files    -start-insert -no-split file_rec/async:!<cr>
nnoremap <Leader>m :Unite    -buffer-name=mru      file_mru<cr>
nnoremap <Leader>y :Unite    -buffer-name=yank     history/yank<cr>
nnoremap <Leader>S :Unite    -buffer-name=search   grep:.<cr>

call unite#filters#sorter_default#use(['sorter_rank'])
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('file_rec/async,grep', 'ignore_pattern', 'plugins/\|database_songs/\|tmp/\|node_modules/\|platforms/\|.vagrant/\|classes/\|lib/\|bower_components/')

autocmd FileType vimfiler nmap <silent><buffer><expr> <CR> vimfiler#smart_cursor_map(
      \ "\<Plug>(vimfiler_expand_tree)",
      \ "\<Plug>(vimfiler_edit_file)")

" ------------------------------------------------------------------------------
" Search and Replace
" ------------------------------------------------------------------------------

set hlsearch
set wrapscan

" ------------------------------------------------------------------------------
" Presentation
" ------------------------------------------------------------------------------

colorscheme railscasts
syntax enable

set background=light
set matchpairs+=<:>
set shortmess=aIoO
set cmdheight=2
set cursorline
set cursorcolumn
set showmatch
set showcmd
set hidden
set number
set t_ut=
set ruler
set cf

filetype plugin indent on
filetype indent on
filetype on

" ------------------------------------------------------------------------------
" Misc Functions
" ------------------------------------------------------------------------------

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

" ------------------------------------------------------------------------------
" Vimfiler Colors
" ------------------------------------------------------------------------------

highlight vimfilerOpenedFile ctermfg=82
highlight vimfilerClosedFile ctermfg=82
highlight vimfilerNonMark    ctermfg=82 cterm=bold
