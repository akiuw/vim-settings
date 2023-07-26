let mapleader=" "
set number
set wildmenu
set cursorline
set wrap
set hlsearch
set incsearch
set ignorecase
set smartcase
set nocompatible
set encoding=utf-8
set tabstop=4
set shiftwidth=4 
set softtabstop=4
set scrolloff=7
" set foldmethod=indent
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
map S :w<CR>
map Q :q<CR>
map <LEADER>k <C-w>l
map <LEADER>u <C-w>k
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <tab>f :FZF<CR>
vnoremap <C-y> "+y
call plug#begin('~/.vim/plugged')
" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
" Error checking
Plug 'w0rp/ale'
" Undo Tree
Plug 'mbbill/undotree/'
" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'
" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
" Plug 'hail2u/vim-css3-syntax'
" Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
" Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
" Plug 'mattn/emmet-vim'
" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'
" Other useful utilities
" Plug 'terryma/vim-multiple-cursors'
" Plug 'junegunn/goyo.vim' " distraction free writing mode
" Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
" Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
" Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
" Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line
" Or build from source code by using yarn: https://yarnpkg.com
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
" Dependencies
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'kana/vim-textobj-user'
" Plug 'fadein/vim-FIGlet'
" go 主要插件
Plug 'fatih/vim-go'

" rust
Plug 'rust-lang/rust.vim'

" 配⾊⽅案
" colorscheme neodark
" Plug 'KeitaNakamura/neodark.vim'
" colorscheme monokai
" Plug 'crusoexia/vim-monokai'
" colorscheme github 
" Plug 'acarapetis/vim-colors-github'
" colorscheme one 
" Plug 'rakr/vim-one'
" colorscheme codedark
Plug 'tomasiser/vim-code-dark'
" colorscheme molokai
" Plug 'fatih/molokai'
Plug 'mhinz/vim-signify'
Plug 'ngemily/vim-vp4'
" 括号⾃动补全
" let b:delimitMate_autoclose = 0 选项关闭
Plug 'Raimondi/delimitMate'
" csv 插件
" Plug 'chrisbra/csv.vim'
"
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" cpp highlight 
Plug 'octol/vim-cpp-enhanced-highlight'


call plug#end()
" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeSize=30
""当NERDTree为剩下的唯⼀窗⼝时⾃动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""打开vim时⾃动打开NERDTree
" autocmd vimenter * NERDTree
""窗⼝位置
let g:NERDTreeWinPos='left'
""窗⼝尺⼨
let g:NERDTreeSize=30
""窗⼝是否显示⾏号
let g:NERDTreeShowLineNumbers=1
""不显示隐藏⽂件
let g:NERDTreeHidden=0
" == NERDTree-git
" let g:NERDTreeIndicatorMapCustom = {
let g:NERDTreeGitStatusIndicatorMapCustom = {
 \ "Modified" : "✹",
 \ "Staged" : "✚",
 \ "Untracked" : "✭",
 \ "Renamed" : "➜",
 \ "Unmerged" : "═",
 \ "Deleted" : "✖",
 \ "Dirty" : "✗",
 \ "Clean" : "✔",
 \ "Unknown" : "?"
 \ }
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
 \ pumvisible() ? "\<C-n>" :
 \ <SID>check_back_space() ? "\<TAB>" :
 \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
 let col = col('.') - 1
 return !col || getline('.')[col - 1] =~# '\s'
endfunction
let g:coc_global_extensions = [
\ 'coc-json',
\ 'coc-vimlsp',
\ 'coc-marketplace']
nmap <silent> [ <Plug>(coc-diagnostic-prev)
nmap <silent> ] <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')
" Undo Tree
if has("persistent_undo")
 let target_path = expand('~/.undodir')
 " create the directory and any parent directories
 " if the location does not exist.
 if !isdirectory(target_path)
 call mkdir(target_path, "p", 0700)
 endif
 let &undodir=target_path
 set undofile
endif
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1 
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_string_spellcheck = 0
let g:go_highlight_format_strings = 0

let g:cpp_posix_standard = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

let g:rustfmt_autosave = 1

" Rename tabs to show tab number.
noremap <F5> :UndotreeToggle<CR>
colorscheme codedark
