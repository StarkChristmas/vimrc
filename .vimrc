" auto reload .vimrc when changed, this avoids reopening vim
autocmd! bufwritepost .vimrc source %

set nocompatible              " 启用增强模式（必需）
filetype on                   " required

" 设置运行路径以包含 Vundle 并初始化
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 或者传入一个路径来指定插件安装位置
"call vundle#begin('~/some/path/here')

" Vundle 管理自身（必需）
Plugin 'gmarik/Vundle.vim'

" 通过 Vundle 管理的插件列表
" ----------------------------------------------------------
Plugin 'edkolev/promptline.vim'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'bling/vim-airline'
Plugin 'ervandew/supertab'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'godlygeek/tabular'
Plugin 'MatlabFilesEdition'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'junegunn/vim-easy-align'
" ------------------------------------------------------------
"
" All of your Plugins must be added before the following line

" 语言支持插件
Plugin 'sheerun/vim-polyglot'

" Golang 支持
Plugin 'fatih/vim-go'

" Python 支持
Plugin 'vim-python/python-syntax'
Plugin 'Vimjas/vim-python-pep8-indent'

" Bash 脚本支持
Plugin 'voldikss/vim-floaterm'


" ------------------------------
" 高级开发功能插件
" ------------------------------

" LSP support and autocompletion
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" Code navigation and symbol highlighting
Plugin 'RRethy/vim-illuminate'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'

" Code navigation and fuzzy finding
Plugin 'preservim/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'

" Git integration
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Debugger interface
Plugin 'puremourning/vimspector'

" Code formatting and linting
Plugin 'Chiel92/vim-autoformat'
Plugin 'dense-analysis/ale'

" Syntax enhancement
Plugin 'luochen1990/rainbow'
Plugin 'jiangmiao/auto-pairs'


" ------------------------------
" 恶意样本分析与二进制查看插件
" ------------------------------

" YARA 语法高亮
Plugin 's3rvac/vim-syntax-yara'

" 十六进制/二进制编辑
Plugin 'fidian/hexmode'
" 可选的更高级二进制分析，支持模板解析
Plugin 'd0c-s4vage/pfp-vim'

" 文本结构与对齐处理
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/Align'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" 设置全局编码
set encoding=utf-8
set termencoding=utf-8

" 每个文件打开时设置文件编码为 UTF-8（确保 modifiable）
autocmd BufReadPost,BufNewFile * if &modifiable | setlocal fileencoding=utf-8 | endif

" disable vi compatibility (emulation of old bugs)
set nocompatible

" commenting
set comments=sl:/*,mb:\ *,elx:\ */
set wildmode=longest:full
set wildmenu
set t_Co=256

syntax on

"tabs and spaces
set shiftwidth=4	"1 tab == 2 spaces
set tabstop=4		"<TAB> == 2 spaces
set softtabstop=4	"<TAB> and backspace
set smarttab		"smart tab
set autoindent		"set auto indent
set smartindent		"set smart indent
set copyindent		"use exisiting indents for new indents
set preserveindent	"save as much indent structure as possible

"UI Config
set number			"line number
set showmatch		"highlight matching [({})]
set mat=2			"for showmatch, set how many tenth of second it blinks
set ruler			"show current position
set magic			"magic for regular expression
set confirm			"ask to save file
set showcmd			"display incomplete command in the lower right corner of the console
set undolevels=1000	"let vim allow 1000 undos
set textwidth=80
" do not work in hammer. Uncomment for those not on hammer server
set colorcolumn=80
highlight ColorColumn ctermbg=236

"Searching
set incsearch			   "search as char are entered
set ignorecase
set hlsearch			   "highlight matches
set smartcase			   "smart with case search

"Folding
set foldenable	      "enable folds
set foldlevelstart=10 "prevent too many folds
set foldmethod=indent "set fold based on indentation
"can also be marker, manual, expr, syntax, or diff
"check :help for more information

"Movement
set mouse=a				     "mouse support in console (option + mouseclick for mac users)
set mousehide				 "hide cursor when typing
set scrolloff=5		         "minimum lines to keep above and below
set ttymouse=xterm2

"instant markdown
filetype plugin on          "required

"rainbow parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"indenting
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=black ctermbg=black
autocmd VimEnter * :IndentGuidesEnable

" statusline
set laststatus=2

" airline UI
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'

" separators
let g:airline#extensions#tabline#left_sep = '▶'
let g:airline#extensions#tabline#left_alt_sep = '▶'
let g:airline#extensions#tabline#right_sep = '◀'
let g:airline#extensions#tabline#right_alt_sep = '◀'
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '◀'
"let g:airline_symbols.branch = '▶'
"let g:airline_symbols.readonly = '▶'
"let g:airline_symbols.linenr = '▶'

function! AirlineInit()
	let g:airline_section_a = airline#section#create(['mode',' ','branch'])
	let g:airline_section_b = airline#section#create_left(['%F'])
	let g:airline_section_c = airline#section#create(['ffenc',' ','[%Y]'])
	let g:airline_section_x = airline#section#create(['%P'])   "P
	let g:airline_section_y = airline#section#create(['row:%l/%L ','(%03p%%)'])
	let g:airline_section_z = airline#section#create_right(['col:%03c'])
endfunction
autocmd VimEnter * call AirlineInit()

" Syntastic settings recommended
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" enable all checkers on same file
let g:syntastic_aggregate_errors = 1

" enable syntax checkers
let g:syntastic_c_checkers = ['gcc']
let g:syntastic_cpp_checkers = ['cppcheck' , 'gcc' , 'make']
let g:syntastic_matlab_checkers = ['mlint']
let g:syntastic_markdown_checkers = ['mdl']
let g:syntastic_text_checkers = ['language_check' , 'atdtool']

let g:syntastic_cpp_compiler = 'clang++' " C++ compiler
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++' " C++11 support
let g:syntastic_cpp_compiler_options = ' -std=c++1y' " C++14 support

"python autocomplet
filetype plugin on
let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'
let g:pydiction_menu_height = 3

"vim-go plugin"
let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1

let g:godef_split=2


"NERDTree
" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary")
map <C-n> :NERDTreeToggle<CR>

" vim-markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown    " *.md support

"spelling
"map <C-a> :set spell! <CR>
:nnoremap <C-a> :set spell!<CR>

" automatic Whitespace removal
autocmd VimEnter,BufReadPost,bufwritepost,bufenter * :FixWhitespace

" malokai theme
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai


au InsertLeave *.go,*.sh,*.php,*.py,*.md,*.c,*.cpp write

" ------------------------------
" 语言专属配置
" ------------------------------

" Golang settings
let g:go_fmt_command = "gopls"
let g:go_def_mode = "gopls"
let g:go_info_mode = "gopls"

" Python settings
let g:python_recommended_style = 0

" 通用设置
filetype plugin indent on
syntax enable
