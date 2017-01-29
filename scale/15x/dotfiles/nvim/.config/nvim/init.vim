set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'edkolev/tmuxline.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'mileszs/ack.vim'
Plugin 'nanotech/jellybeans.vim'

call vundle#end()
filetype plugin indent on

" airline
let g:airline_powerline_fonts = 1 
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:webdevicons_conceal_nerdtree_brackets = 1

syntax on

"set nocompatible   " Disable vi-compatibility
set encoding=utf-8 " Necessary to show unicode glyphs
set t_Co=256       " Explicitly tell vim that the terminal supports 256 colors
let &t_Co=256

let mapleader=","

set autoread
"set grepprg=ack-grep
set grepformat=%f:%l:%m
set incsearch
set hlsearch
set expandtab
set smartcase
set tabstop=2
set shiftwidth=2
set autoindent
set number
set hidden
set bg=dark
"set nowrap
set scrolloff=3
set sidescrolloff=7
set sidescroll=1
set wildmenu
set wildmode=list:longest
set wildignore=*.o,*~,*.pyc,venv
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

" ack
"let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ackprg = 'ag --vimgrep --smart-case'
"let g:ackprg = 'ag --vimgrep'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" markdown
let g:vim_markdown_folding_disabled=1

" nerdtree
nnoremap <leader>d :NERDTreeToggle<cr>
"nnoremap <leader>d :NERDTreeMirrorToggle<cr>
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeQuitOnOpen = 0
let g:nerdtree_tabs_open_on_console_startup = 1
let NERDTreeIgnore = ['\.pyc$', '.*\.egg-info$', '.*egg$', 'venv', '__pycache__']
let g:NERDTreeWinSize = 25

" nerdcommenter
let NERDSpaceDelims=1
" let NERDCustomDelimiters = { 'py' : { 'left': '# ', 'leftAlt': '', 'rightAlt': '' }}

" statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%{fugitive#statusline()}
set laststatus=2
set noshowmode

let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_enable_signs=1
let g:syntastic_check_on_open=1
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['python', 'json', 'ruby'] }
let g:syntastic_json_checker = "jsonlint"

" kill trailing white space
nnoremap <Leader>kw :1,$s/ \+$//<CR>

" display long lines
au BufWinEnter *.rst,*.py,*.rb let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)
" au BufWinEnter *.rs let w:m2=matchadd('ErrorMsg', '\%>98v.\+', -1)

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  autocmd FileType ruby, set ai sw=2 sts=2 et
  autocmd FileType python, set ai sw=4 ts=4 sts=4 et
  autocmd FileType go, set ai sw=4 ts=4 sts=4 noet
  autocmd FileType rust, set ai sw=4 ts=4 sts=4 noet
  autocmd FileType sh,bash set sw=4 sts=4
  autocmd FileType sh,bash,txt set ts=4 sts=4 sw=4 noet
  autocmd FileType yaml,yml set ts=2 sts=2 sw=2 et
augroup END
" autocmd FileType sh,python,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd Filetype gitcommit setlocal spell textwidth=72
" autocmd Filetype python autocmd BufWritePre * :0,$!yapf
autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>

" display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

set mouse=r
:nmap <F1> <nop>

" nmap <silent> <leader>p :set paste<CR>"*p:set nopaste<CR>
"set pastetoggle=<leader>p
nmap <leader>p :set paste!<CR>

" vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
" let test#strategy = "dispatch"
let test#strategy = "vtr"

colorscheme jellybeans
