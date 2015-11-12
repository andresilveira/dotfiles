scriptencoding utf-8
set encoding=utf-8

" something about the system wide .vimrc and user .vimrc
set nocompatible

" just disables the filetype recognition/indentation by the time
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Nice color scheme
Plugin 'altercation/vim-colors-solarized'

" File navigator Ctrl-p
Plugin 'kien/ctrlp.vim'

" multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" handlebars/mustache syntax highlighting
Plugin 'mustache/vim-mustache-handlebars'

" Eaiser code commenting
Plugin 'tpope/vim-commentary'

" [Un]Surround stuff with text
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enabling solarized
syntax enable
set background=dark
colorscheme solarized

" Enables using backspace over everything in insert mode
set backspace=indent,eol,start

" Show line numbers
set number

" sets tabs to use space character and uses 2 chars as tab size
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" maps some special characters
set listchars=eol:¬,tab:»»,trail:•

" show the commands in the bottom right
set showcmd

" changes the <leader> key to ,
let mapleader=","

" maps jj as <ESC>
imap jj <ESC>

" short cuts for life
map <leader>w :w<CR>
map <leader>e :e

" list! shows special characters
nnoremap <leader>. :set list!<CR>

" add a newline after the current line
nmap <CR> o<Esc>

" map the switch slipts commands
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

" open splits on right and below which feels more natural
set splitbelow
set splitright

" auto remove trailing spaces
" autocmd BufWritePre * :%s/\s\+$//e

" allows me to specify some custom commands on per directory
if filereadable(".vim.custom")
  so .vim.custom
endif

" for some reason vim by default don't allow you to erase
" stuff that were not added in the present session of the file
set backspace=indent,eol,start

" ignores some folders including node_modules
" useful when using the ctrl-p plugin to not have unrelated files in the three
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*

" Enables mustache/handlebars abbreviations
let g:mustache_abbreviations = 1
