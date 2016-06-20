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
Plugin 'ctrlpvim/ctrlp.vim'

" multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" handlebars/mustache syntax highlighting
Plugin 'mustache/vim-mustache-handlebars'

" Eaiser code commenting
Plugin 'tpope/vim-commentary'

" [Un]Surround stuff with text
Plugin 'tpope/vim-surround'

" Syntatic checks platform
Plugin 'scrooloose/syntastic'

" completion stuff
Plugin 'Shougo/neocomplete.vim'

" Emmet HTML/CSS abbreviations for vim
Plugin 'mattn/emmet-vim'

" Autoclosing paired stuff like parenthesis, brackets, etc
Plugin 'Raimondi/delimitMate'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enabling solarized
syntax enable
set background=dark
colorscheme solarized

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

" settings for statusline
set laststatus=2                " tells vim to always draw the statusline
set statusline=                 " resets statusline when sourcing .vimrc
set statusline+=%#warningmsg#   " Syntastic statusline warnings
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%#error#%r%*    " sets the read only flag with the error color
set statusline+=%m\             " show modified file flag
set statusline+=%f\             " show file name
set statusline+=%y              " show file type
set statusline+=%=              " align to right
set statusline+=%c,%l\            " cursor column and line

" changes the <leader> key to ,
let mapleader=","

" maps jj as <ESC>
imap jj <ESC>

" shortcuts for life
nmap <leader>w :w<CR>
nmap <leader>e :e<SPACE>

nnoremap tn :tabnext<CR>
nnoremap tp :tabprevious<CR>

" a shortcut for greping through the project.
" the <Left> thing moves the cursor to inside the quotes
nmap <leader>f :grep -R -F '' .<Left><Left><Left>

" list! shows special characters
nnoremap <leader>. :set list!<CR>

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
" Clear CtrlP cache with cc (the same as F5, just easier)
map clc :CtrlPClearCache<ENTER>

" Enables mustache/handlebars abbreviations
let g:mustache_abbreviations = 1

" Syntastic default settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Enabling syntastic checkers
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_tidy_exec = 'tidy5'

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
