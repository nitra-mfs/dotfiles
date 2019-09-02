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

" https://github.com/tpope/vim-sensible
 Plugin 'tpope/vim-sensible'

" https://github.com/vim-airline/vim-airline
 Plugin 'vim-airline/vim-airline'

"https://github.com/scrooloose/nerdtree
 Plugin 'scrooloose/nerdtree'

" https://github.com/vim-syntastic/syntastic.git
 Plugin 'scrooloose/syntastic'

" https://github.com/cocopon/pgmnt.vim
 Plugin 'cocopon/pgmnt.vim'

" https://github.com/cocopon/iceberg.vim
 Plugin 'cocopon/iceberg.vim'

" https://github.com/rhysd/vim-clang-format
 Plugin 'rhysd/vim-clang-format'

" https://github.com/valloric/youcompetenme
 Plugin 'valloric/youcompleteme'

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

set autoindent
set number
set cc=80
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

" per .git vim configs
" just `git config vim.settings "expandtab sw=4 sts=4"` in a git repository
" change syntax settings for this repository
let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
    exe "set" git_settings
endif

"call plug#begin()
"Plug 'roxma/nvim-completion-manager'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"call plug#end()

