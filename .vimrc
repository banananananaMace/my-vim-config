" .vimrc - Vim configuration file.
"
" Copyright (c) 2010 Jeffy Du. All Rights Reserved.
"
" Maintainer: Defu Xu
"    Created: 2022-01-23
" LastChange: 2022-01-23

" GENERAL SETTINGS:

" Setting colorscheme
color molokai
let g:SnazzyTransparent = 1
let g:MolokaiTransparent = 1
let g:molokai_original = 1
let g:rehash256 = 1
autocmd BufWritePost $MYVIMRC source $MYVIMRC
if has("gui_running")
" 设置 gvim 显示字体
	" set guifont=YaHei\ Consolas\ Hybrid\ 11.5
	set guifont=Consolas\ 14
	let g:MolokaiTransparent = 0
	vnoremap <C-c> "+y
	vnoremap <C-x> "+x
	vnoremap <C-v> "+gP
endif
" To use VIM settings, out of VI compatible mode.
set nocompatible
" Enable file type detection.
filetype on
filetype plugin indent on
" Syntax highlighting.
syntax on
syntax enable
" Duplicate words
"map <LEADER>fd /\(\<\w\+\>\)\_s*\1
"make the boloc seen
set list
" 高亮显示当前行
" set cursorline
" set cursorcolumn
"red,white,black,green,yellow,blue,purple,gray,brown,tan,syan
" hi CursorLine cterm=underline ctermfg=NONE gui=underline guifg=black
" set colorcolumn=80
highlight ColorColumn ctermbg=red guibg=red
set noswapfile
set autoindent
set autoread
set autowrite
set background=dark
set backspace=indent,eol,start
set nobackup
set cindent
set cinoptions=:0
set completeopt=longest,menuone
set fileencodings=utf-8,gb2312,gbk,gb18030
set fileformat=unix
set foldenable
set foldmethod=marker
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=l
set helpheight=10
set helplang=cn
set hidden
set history=100
set incsearch
set hlsearch
set ignorecase
set laststatus=2
"enable mouse
set mouse=a
set number
set pumheight=10
"开启行号显示
set ruler
set scrolloff=5
set showcmd
set smartindent
set smartcase
"code format
set termencoding=utf-8
set textwidth=80
set whichwrap=h,l
set wildignore=*.bak,*.o,*.e,*~
set wildmenu
set wildmode=list:longest,full
"开启代码折叠
set wrap
"tabsize
set tabstop=8
set shiftwidth=8
set softtabstop=8
set noexpandtab
set clipboard=exclude:.*
setlocal list
set listchars=tab:>-,trail:.
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" AUTO COMMANDS:
" auto expand tab to blanks
"autocmd FileType c,cpp set expandtab
" Restore the last quit position when open file.
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g'\"" |
    \ endif

" SHORTCUT SETTINGS:
"Set mapleader
let mapleader=" "
" noremap <LEADER><CR> :nohl<CR>
" noremap  <LEADER><CR> :%! astyle --style=kr<cr>
noremap <LEADER>e :tabedit 
" noremap <LEADER>d :g/^\s*$/d<CR>
noremap <LEADER>t <C-W>T
noremap <LEADER>o <C-W>o
noremap <LEADER>v <C-W>v
noremap <LEADER>d :%bd\|e#<CR>:bd#<CR>
noremap <LEADER>q :wa!<CR>:tabo<CR>
" noremap <LEADER>w <C-W>]
" quickfix
nmap <C-n> :cn<cr>
nmap <C-p> :cp<cr>
" :cc                显示详细错误信息 ( :help :cc )
" :cp                跳到上一个错误 ( :help :cp )
" :cn                跳到下一个错误 ( :help :cn )
" :cl                列出所有错误 ( :help :cl )
" :cw                如果有错误列表，则打开quickfix窗口 ( :help :cw )
" :col               到前一个旧的错误列表 ( :help :col )
" :cnew              到后一个较新的错误列表 ( :help :cnew )

" buffer
"nmap <C-N> :bn<cr>
"nmap <C-P> :bp<cr>

"self nnoremap
noremap # *N
noremap H 0
noremap J 5j
noremap K 5k
noremap L $
noremap s <Esc>

"set the window size
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical res -5<CR>
noremap <right> :vertical res +5<CR>
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>

" Switching between buffers.
" usually used in split windows
noremap <C-h> <C-W>h
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l
inoremap <C-h> <Esc><C-W>h
inoremap <C-j> <Esc><C-W>j
inoremap <C-k> <Esc><C-W>k
inoremap <C-l> <Esc><C-W>l

" "cd" to change to open directory.
let OpenDir=system("pwd")
nmap <silent> <leader>cd :exe 'cd ' . OpenDir<cr>:pwd<cr>

"PLUGIN Install:
" you should install curl first
call plug#begin()

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'connorholyday/vim-snazzy'
Plug 'itchyny/lightline.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'tpope/vim-fugitive'
" Plug 'junegunn/fzf.vim'
"
" Taglist
" Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }
"
" Error checking
" Plug 'w0rp/ale'
"
" Auto Complete
call plug#end()

" PLUGIN SETTINGS:
" YouCompleteMe.vim
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_show_diagnostics_ui = 0                  "关闭语法提示
let g:ycm_complete_in_comments=1                   " 补全功能在注释中同样有效
let g:ycm_confirm_extra_conf=0                     " 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_collect_identifiers_from_tags_files=1    " 开启 YCM 标签补全引擎
let g:ycm_min_num_of_chars_for_completion=1        " 从第一个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0                         " 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1           " 语法关键字补全
let g:ycm_goto_buffer_command = 'horizontal-split' " 跳转打开上下分屏
let g:ycm_use_clangd = 1

" taglist.vim
let g:Tlist_Auto_Update=1
let g:Tlist_Process_File_Always=1
let g:Tlist_Exit_OnlyWindow=1
let g:Tlist_Show_One_File=1
let g:Tlist_WinWidth=25
let g:Tlist_Enable_Fold_Column=0
let g:Tlist_Auto_Highlight_Tag=1

" NERDTree.vim
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=25
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeQuitOnOpen=1
nmap <silent> <BS> <Plug>NERDCommenterToggle
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = {'c': {'left': '/*', 'right': '*/'}}
let g:NERDTrimTrailingWhitespace = 1

" airline.vim
let g:airline_theme="molokai"
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#symbol = '!'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_symbols.crypt = '⭡'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.linenr = '∥'
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.whitespace = 'Ξ'

" cscope.vim
if has("cscope")
    set csto=1
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif

" OmniCppComplete.vim
let g:OmniCpp_DefaultNamespaces=["std"]
let g:OmniCpp_MayCompleteScope=1
let g:OmniCpp_SelectFirstItem=2

" VimGDB.vim
if has("gdb")
	set asm=0
	let g:vimgdb_debug_file=""
	run macros/gdb_mappings.vim
endif

" LookupFile setting
let g:LookupFile_TagExpr='"./tags.filename"'
let g:LookupFile_MinPatLength=2
let g:LookupFile_PreserveLastPattern=0
let g:LookupFile_PreservePatternHistory=1
let g:LookupFile_AlwaysAcceptFirst=1
let g:LookupFile_AllowNewFiles=0

" Man.vim
source $VIMRUNTIME/ftplugin/man.vim

" snipMate
let g:snips_author="Xu defu"
let g:snips_email="1152699620@qq.com"
let g:snips_copyright="SicMicro, Inc"
" plugin shortcuts
function! RunShell(Msg, Shell)
	echo a:Msg . '...'
	call system(a:Shell)
	echon 'done'
endfunction
nmap <F2> :TlistToggle<cr>
nmap <F3> :NERDTreeToggle<cr>
nmap <F4> :MRU<cr>
nmap <F5> :FZF<cr>
nmap <F6> :G grep <C-R>=expand("<cword>")<cr> 
nmap <F7> :%g/<C-R>=expand("<cword>")<cr><cr>
nmap <F8> :vimgrep /<C-R>=expand("<cword>")<cr>/ **/*.c **/*.h<cr><C-o>:cw<cr>
nmap <F10> :call RunShell("Generate tags", "ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .")<cr>
nmap <F11> :call RunShell("Generate filename tags", "~/.vim/shell/genfiletags.sh")<cr>
nmap <F12> :call RunShell("Generate cscope", "cscope -Rb")<cr>:cs add cscope.out<cr>
nmap <leader>sa :cs add cscope.out<cr>
nmap <leader>ss :vert scs find s <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sg :vert scs find g <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sc :vert scs find c <C-R>=expand("<cword>")<cr><cr>
nmap <leader>st :vert scs find t <C-R>=expand("<cword>")<cr><cr>
nmap <leader>se :vert scs find e <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sf :vert scs find f <C-R>=expand("<cfile>")<cr><cr>
nmap <leader>si :vert scs find i <C-R>=expand("<cfile>")<cr><cr>
nmap <leader>sd :vert scs find d <C-R>=expand("<cword>")<cr><cr>
nmap <leader>zz <C-w>o
" nmap <leader>gs :GetScripts<cr>

" lightline relativepath filename jellybeans ayu_mirage solarized
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

" auto-pairs
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}

" vim-easymotion
map <leader>f <Plug>(easymotion-bd-w)
nmap <leader>f <Plug>(easymotion-overwin-w)

