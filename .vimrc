" ~/.vimrc

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" https://github.com/tpope/vim-fugitive
 Plugin 'tpope/vim-fugitive'

" https://github.com/tpope/vim-surround
 Plugin 'tpope/vim-surround'

" https://github.com/tpope/vim-sensible
 Plugin 'tpope/vim-sensible'

" https://github.com/vim-airline/vim-airline
 Plugin 'vim-airline/vim-airline'

"https://github.com/scrooloose/nerdtree
 Plugin 'scrooloose/nerdtree'
 nnoremap <C-o> :NERDTree
 nnoremap <C-n> :tabnew
 nnoremap <C-p> :tabprevious
 nnoremap <C-l> :tabnext
 nnoremap <C-c> :tabclose
 silent! nmap <C-t> :NERDtreeToggle<CR>
 silent! map <F3> :NERDTreeFind<CR>

 let g:NERDTreeMapActivateNode="<F3>"
 let g:NERDTreeMapPreview="<F4>"

" https://github.com/vim-syntastic/syntastic.git
 Plugin 'scrooloose/syntastic'

" https://github.com/cocopon/pgmnt.vim
 Plugin 'cocopon/pgmnt.vim'

" https://github.com/cocopon/iceberg.vim
" Plugin 'cocopon/iceberg.vim'

" https://github.com/rhysd/vim-clang-format
 Plugin 'rhysd/vim-clang-format'

" https://github.com/valloric/youcompleteme
 Plugin 'valloric/YouCompleteMe',
    \{'do':'./install.py --clang-completer','for':['cpp','python']}
 autocmd! User YouCompleteMe
    \ if !has('vim_starting')|call youcompleteme#Enable()|endif
 nnoremap gt:YcmCompleter GoTo<CR>

 " https://github.com/dracula/dracula-theme
 Plugin 'dracula/vim'

 " https://github.com/junegunn/fzf
 Plugin 'junegunn/fzf',{'dr':'~/.fzf','do':'./install --all'}
 Plugin 'junegunn/fzf.vim'
 nnoremap<space><space> :GitFiles<cr>

 " https://github.com/craigemery/vim-autotag
 Plugin 'craigemery/vim-autotag'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" runtime! plugin/sensible.vim
" colorscheme iceberg
set tabstop=4 shiftwidth=4 expandtab

set encoding=utf-8 fileencodings=
syntax on
color dracula

set autoindent
set number
set cc=120
set mouse=a

autocmd Filetype make setlocal noexpandtab

set list listchars=tab:»·,trail:·
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_cpp_compiler_options = ' -std=c++17'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:ycm_confirm_extra_conf = 0
let g:ycm_complete_in_comments = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/.ycm_extra_conf.py'
let g:ycm_extra_conf_vim_data = ['&filetype']

" fzf config
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

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

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" per .git vim configs
" just `git config vim.settings "expandtab sw=4 sts=4"` in a git repository
" change syntax settings for this repository
let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
    exe "set" git_settings
endif
