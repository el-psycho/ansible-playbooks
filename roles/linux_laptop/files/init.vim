" Plugins
" -------
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'fatih/vim-go'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'elzr/vim-json'
Plug 'psf/black'
call plug#end()

syntax enable
filetype plugin on

set number
set noshowmode
set expandtab
set shiftwidth=2
set tabstop=2
set colorcolumn=80
set list lcs=tab:\|\ 
set path+=**

au BufNewFile,BufRead Jenkinsfile setf groovy

let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'

let g:indentLine_char = '┊'
let g:indentLine_first_char = '┊'
let g:indentLine_showFirstIndentLevel = 1

let g:NERDCommentEmptyLines = 1

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 100
let g:deoplete#sources#jedi#show_docstring = 1

let g:vim_json_syntax_conceal = 0

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox


" Neovim virtualenv python interpreter paths
" ------------------------------------------
let g:python3_host_prog = '/home/kevin/.local/share/nvim/nvim-py3/bin/python'

" Black virtualenv path
" ---------------------
let g:black_virtualenv='/home/kevin/.local/share/nvim/nvim-py3'


" flake8 binary path
" ------------------
let g:flake8_cmd='/home/kevin/.local/share/nvim/nvim-py3/bin/flake8'

" syntastic checkers settings
" ------------------------
let g:syntastic_python_flake8_exec='/home/kevin/.local/share/nvim/nvim-py3/bin/flake8'
let g:syntastic_python_checkers=['python', 'flake8', 'mypy']

" Key mappings
" ------------
let mapleader = ","
nmap <leader>t :NERDTreeToggle<CR>
map cc <plug>NERDCommenterToggle


" Automatic commands
" ------------------
autocmd BufWritePre *.py execute ':Black'

" Close the preview window after deoplete completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif

" Some filetypes need tabs instead of spaces
" ------------------------------------------
autocmd Filetype ini setlocal noexpandtab
au BufNewFile,BufRead .flake8 setf ini
autocmd Filetype make setlocal noexpandtab

