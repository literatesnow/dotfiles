set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'othree/html5.vim'
Plugin 'szw/vim-ctrlspace'
Plugin 'rking/ag.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'

Bundle 'https://github.com/vim-scripts/doriath.vim'
Bundle 'https://github.com/kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
" Bundle 'Lokaltog/vim-easymotion'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'tpope/vim-commentary'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin on           " required

filetype plugin indent on
syntax on

if has("gui_running")
  if has("gui_gtk2")
    colorscheme rainbow_breeze
    " set guifont=Inconsolata\ 10
    set guifont=Consolas\ 10
    set clipboard=unnamedplus
    set guiheadroom=0
    set linespace=3
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h12
  elseif has("gui_win32")
    set guifont=Consolas:h10:cANSI
    set clipboard=unnamed
  endif
  set lines=45 columns=140
else
  if $TERM == "xterm-256color"
    set t_Co=256
  endif
  if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
  endif

  let g:solarized_termcolors=256
  set background=dark
  colorscheme solarized

  set ttyfast
  set ttyscroll=3
  set lazyredraw
  set clipboard=unnamed,unnamedplus
endif

set synmaxcol=512
set mouse+=a
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set expandtab
set ts=2
set shiftwidth=2
set browsedir=buffer
set su=.bak,~,.o,.h,.info,.swp,.obj,.class

set backspace=2
set laststatus=2
set foldmethod=marker
set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P
set sm
set si
" set ai
set hls
set ic
set spell
set number
set path=.
set directory=$HOME/.vim/swap//
set hidden "vim-ctrlspace
set showtabline=0

set wildmode=longest,list,full
set wildmenu

autocmd BufRead *.po set encoding=utf-8 fileencoding=utf-8
autocmd BufNewFile,BufRead *.gradle set filetype=groovy

"map <TAB> :tabnext<CR>
"map <S-TAB> :tabprev<CR>
"map <Leader><TAB> :tabnew<CR>
vmap <F1> <ESC>
map <F1> <ESC>
imap <F1> <ESC>
nmap <F2> <plug>NERDTreeTabsToggle<CR>
map <F6> <ESC>:cn<CR>
map <F7> <ESC>:cp<CR>
map <F8> <ESC>:copen<CR>
" imap <C-SPACE> <C-X><C-U>
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-E> <End>

nmap <C-H>sj :set syn=javascript<CR>
nmap <C-H>sp :set syn=php<CR>
nmap <C-H>sm :set syn=smarty<CR>
nmap <C-H>n :noh<CR>
nmap <C-H>y :%s/\s\+$//g<CR>
nmap <C-H>t :%s/\t/  /g<CR>

set complete=.,w,b,u

" show newlines and tabs
if has("multi_byte")
  set list listchars=trail:_
  execute "set listchars+=tab:" . nr2char(187) . '\ '
else
  set list listchars=trail:_,tab:>-
endif

set encoding=utf-8
set termencoding=utf-8

" NERDTree
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp']
let g:miniBufExplMapWindowNavVim = 1
" let g:miniBufExplMapWindowNavArrows = 1
" let g:miniBufExplMapCTabSwitchBufs = 1
" let g:miniBufExplModSelTarget = 1
let g:NERDTreeWinSize = 40
let g:nerdtree_tabs_open_on_gui_startup = 0

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_custom_ignore = '\v\.(jpeg|jpg|JPG|png|pdf|gif|svn|hg|git)$'
" let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_working_path_mode = ''
" let g:ctrlp_max_height = 20
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:30'
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 0
let g:ctrlp_lazy_update = 300
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40
if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif
let g:ctrlp_cache_dir = $HOME . "/.cache/ctrlp"

" ctrlp ctrlspace ag.vim
if executable('ag')
  set grepprg=ag\ -p\ ./\ -i\ --nogroup\ --nocolor\ --hidden
  " let g:ctrlp_user_command = 'ag -l -i --nocolor --hidden -g "" %s'
  let g:ctrlp_user_command = 'ag -p "." -l -i --nocolor --hidden -g "." %s'
  let g:ctrlspace_glob_command = 'ag -p "." -l -i --nocolor --hidden -g ""'
  let g:agprg="ag -p ./ -i --column --hidden"
endif

" EasyMotion
" let g:EasyMotion_do_mapping = 0 " Disable default mappings
" let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
" " Bi-directional find motion
" " Jump to anywhere you want with minimal keystrokes, with just one key binding.
" " `s{char}{label}`
" " map <Space> <Plug>(easymotion-prefix)
" nmap <Space> <Plug>(easymotion-w)
" nmap <Backspace> <Plug>(easymotion-b)
" " nmap s <Plug>(easymotion-s)

" ctrlspace
let g:ctrlspace_set_default_mapping = 1
let g:ctrlspace_default_mapping_key = '<Tab>'

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
