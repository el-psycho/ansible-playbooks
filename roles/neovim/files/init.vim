" Plugins
" -------
call plug#begin('~/.vim/plugged')
Plug 'sainnhe/gruvbox-material'
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
set updatetime=500

let g:NERDCommentEmptyLines = 1
let g:vim_json_syntax_conceal = 0

" IndentLine settings
" -------------------
let g:indentLine_char = '┊'
let g:indentLine_first_char = '┊'
let g:indentLine_showFirstIndentLevel = 1

" Colorscheme
" -----------
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_italic = 1
let g:indentLine_setColors = 0
let g:gruvbox_material_palette = 'material'
colorscheme gruvbox-material
" Makes the background transparent
hi Normal guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE


" Airline settings
" -----------------
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox_material'

" Neovim virtualenv python3 interpreter path
" ------------------------------------------
let g:python3_host_prog = '/home/kevin/.local/share/nvim/nvim-py3/bin/python'

" Black virtualenv path
" ---------------------
let g:black_virtualenv='/home/kevin/.local/share/nvim/nvim-py3'

" flake8 binary path
" ------------------
let g:flake8_cmd='/home/kevin/.local/share/nvim/nvim-py3/bin/flake8'

" deoplete settings
" -----------------
let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('jedi', 'show_docstring', 0)
call deoplete#custom#option('auto_complete_delay', 100)

" syntastic settings
" ------------------------
let g:syntastic_check_on_open = 1
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

" Apply a specific filetype/syntax for filenames
" ----------------------------------------------
au BufNewFile,BufRead Jenkinsfile setf groovy

