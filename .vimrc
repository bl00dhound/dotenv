filetype plugin indent on
set encoding=utf-8

" initialize Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Use filetype detection and file-based automatic indenting.
  filetype plugin indent on

  " Use actual tab chars in Makefiles.
  autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif


" find all plugins
call plug#begin('~/.vim/plugged')
" Plugins
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'Xuyuanp/nerdtree-git-plugin' " git plugin for NERDTree

Plug 'morhetz/gruvbox' " Gruvbox theme

Plug 'vim-airline/vim-airline' " Status bar

Plug 'airblade/vim-gitgutter'

Plug 'valloric/youcompleteme'

Plug 'yggdroot/indentline'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" folding for code
Plug 'konfekt/fastfold'

call plug#end()

" Plugins
colorscheme gruvbox
let g:airline_powerline_fonts = 1 " Set up Powerlines fonts accesibility
let g:airline#extensions#keymap#enabled = 0 " Doesn't show current mapping
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" " Custom cursor graph
let g:Powerline_symbols='unicode' " Unicode suppoirt
let g:airline#extensions#xkblayout#enabled = 1 
let g:indentLine_color_term = 239
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"let g:indentLine_concealcursor = 'inc'
"let g:indentLine_conceallevel = 1
set guifont=Fura\ Code\ Light\ Nerd\ Font\ Complete:h16
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"fix for json viewing
"let g:indentLine_enabled = 1
"let g:indentLine_noConcealCursor='nc'
"let g:vim_json_syntax_conceal = 0

" NERDTree key mappings
map <C-p> :NERDTreeToggle<CR>
map <C-o> :NERDTree %<CR>


" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nnoremap <silent> <C-f> :FZF<CR>

" beautify JSON
com! Beautify %!python -m json.tool

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Other settings
set relativenumber
set nu
set nocompatible
"set list lcs=tab:\|\ 
syntax enable

" from fastfold plugin
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

set tabstop=2
set shiftwidth=2
set expandtab
set modifiable

set backupdir=$TMPDIR//
set directory=$TMPDIR//
set foldmethod=indent
set foldlevelstart=2

"cursor showing section
set ttimeoutlen=10
let &t_SI.="\e[5 q"
let &t_SR.="\e[3 q"
let &t_EI.="\e[1 q"


