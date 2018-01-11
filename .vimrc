" Disable vi-compatibility
set nocompatible  

" source Plugin file
so ~/.vim/plugins.vim

" easy get rid of search stuff
nmap<Leader><Leader> :nohlsearch<cr>

let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler_options  = ("-std=c++11")

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" j and k improvement
nnoremap j gj
nnoremap k gk

set laststatus=2
syntax on
"completion
set complete=.,w,b,u 	

" swap backups and swaps out of project dir
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set relativenumber
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell                  " don't beep
set noerrorbells                " don't beep
set autowrite                   "Save on buffer switch

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" fast .vimrc
nmap <leader>ev :e ~/.vimrc<cr>
nmap <leader>g :NERDTreeToggle<cr>

" Fast saves
nmap <leader>w :w!<cr>

" Fast Syntax
nmap <leader>s :syntax on<cr>

" Easy escaping to normal model
imap jj <esc>

" Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>

" Append a simikollon to the end of a line
nmap <leader>a A;<esc>

" cTag
nmap <leader>f :tag<space>
nmap <leader>t :!ctags -R --exclude="vendor" --exclude="node_modules"

" Easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Resize vsplit
nmap <C-v> :vertical resize +5<cr>
nmap 25 :vertical resize 40<cr>
nmap 50 <c-w>=
nmap 75 :vertical resize 120<cr>

"Show (partial) command in the status line
set showcmd

" Create split below
nmap :sp :rightbelow sp<cr>

" Quickly go forward or backward to buffer
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>

" Remove search results
autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch
command! H let @/=""
set mouse=a
set ttymouse=xterm


" Familiar commands for file/symbol browsing
map <D-p> :CtrlP<cr>

" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/**
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|Doc\|doc\|Docs\|docs\|out\'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

" Create/edit file in the current directory
nmap :ed :edit %:p:h/
autocmd FileType java noremap <Leader>g :InsertGetterSetter<CR>

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
