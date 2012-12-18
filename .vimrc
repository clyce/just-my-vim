"Basic Settings
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
let mapleader=","
let g:mapleader=","
set nocompatible            " 关闭 vi 兼容模式
syntax on                   " 自动语法高亮
set mouse=a                 " 开启鼠标模式
filetype plugin indent on   " 开启插件
set number                  " 显示行号
set cursorline            " 突出显示当前行
set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4               " 设定 tab 长度为 4
set nobackup                " 覆盖文件时不备份
set autochdir               " 自动切换当前目录为当前文件所在的目录
set backupcopy=yes          " 设置备份时的行为为覆盖
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍大小写敏感
set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本
set noerrorbells            " 关闭错误信息响铃
set novisualbell            " 关闭使用可视响铃代替呼叫
set t_vb=                   " 置空错误铃声的终端代码
set nowrap                  " 不自动换行
set magic                   " 显示括号配对情况
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set smartindent             " 开启新行时使用智能自动缩进
set cindent                 " c风格程序缩进
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,&gt;1s,=1s,:1s
set backspace=indent,eol,start " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1             " 设定命令行的行数为 1
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)
set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
set linespace=2
setlocal foldlevel=1        " 设置折叠层数为
colorscheme liquidcarbon         " 设定配色方案

"设置代码折叠方式为 手工indent
set foldmethod=indent
"设置代码块折叠后显示的行数
set foldexpr=1

if has("gui_running")
	set guioptions-=m " 隐藏菜单栏
	set guioptions-=T " 隐藏工具栏
	set guioptions-=L " 隐藏左侧滚动条
	set guioptions-=r " 隐藏右侧滚动条
	set guioptions-=b " 隐藏底部滚动条
	set showtabline=1 " 隐藏Tab栏
endif

" vim 支持中文
set encoding=utf-8
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set guifont=Inconsolata-dz\ for\ Powerline\ 9 
set helplang=cn
set ambiwidth=double

set diffexpr=MyDiff()
function! MyDiff()
	let opt = '-a --binary '
	if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
	if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
	let arg1 = v:fname_in
	if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
	let arg2 = v:fname_new
	if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
	let arg3 = v:fname_out
	if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
	let eq = ''
	if $VIMRUNTIME =~ ' '
		if &sh =~ '\<cmd'
			let cmd = '""' . $VIMRUNTIME . '\diff"'
			let eq = '"'
		else
			let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
		endif
	else
		let cmd = $VIMRUNTIME . '\diff'
	endif
	silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"-------------------------------------------------------
"
"快捷键
" 全文搜索选中的文字。选中后  ,f
:vmap <silent> <leader>f y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
:vmap <silent> <leader>F y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

" 删除所有行未尾空格。快捷键f12
nmap <F12> :%s/[ \t\r]\+$//g<CR>
" Buffers操作快捷方式!切换文件 shirt+l.shift+h
nmap <S-L> :bnext<CR>
nmap <S-H> :bprevious<CR>
"切换窗口。ctrl+w+whjkl
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <space> <C-d>
nmap <leader>, %

" 插入模式下移动光标
imap <c-l> <esc>la
imap <c-h> <esc>ha
imap <c-j> <esc>ja
imap <c-k> <esc>ka
imap <c-w> <esc>wa
imap <c-b> <esc>ba
imap <c-0> <esc>0a
imap <c-$> <esc>$a
imap <c-%> <esc>%a

"映射转换语法
nmap <leader>1 :set filetype=xhtml<CR>
nmap <leader>2 :set filetype=css<CR>
nmap <leader>3 :set filetype=javascript<CR>
nmap <leader>4 :set filetype=php<CR>
nmap <leader>5 :set filetype=clojure<CR>
nmap <leader>6 :set filetype=default<CR>

" php语法进行检测 ctrl+p启动
map <C-P> :!/php/php/bin/php -l %<CR>

"php缩进
let PHP_autoformatcomment=1

" php启动帮助 快捷键普通模式下K
autocmd BufNewFile,Bufread *.ros,*.inc,*.php set keywordprg="help

"粘帖模式开启和关闭
:set pastetoggle=<F4>

"-------------------------------------------------------

"不同文件类型的缩进
au FileType html,python,vim,javascript setl shiftwidth=4
au FileType html,python,vim,javascript setl tabstop=4
au FileType java,php setl shiftwidth=4
au FileType java,php setl tabstop=4
set completeopt=longest,menu
"-----------------------------------------------------------------

"-----------------plug-in - Mark--------------------
" plugin - Mark.vim 给各种tags标记不同的颜色，便于观看调式的插件。
"   ,hl”光标下的单词或者文本高亮
"   ,hh会清除该单词的高亮。如果在高亮单词外输入则清除所有的高亮
"   ,hr来高亮符合输入一个正则表达式的文本
nmap <silent> <leader>hl <Plug>MarkSet
nmap <silent> <leader>hh <Plug>MarkClear
nmap <silent> <leader>hr <Plug>MarkRegex
vmap <silent> <leader>hl <Plug>MarkSet
vmap <silent> <leader>hh <Plug>MarkClear
vmap <silent> <leader>hr <Plug>MarkRegex
" 你可以在高亮文本上使用“,#”或“,*”来上索高亮文本。在使用了“,#”或“,*
" ”后，就可以直接输入“#”或“*”来继续查找该高亮文本，直到你又用“#”或“
" *”查找了其它文本。
"-----------------------------------------------------------------


"-----------------plug-in - NERDTree--------------------
map <F7> :NERDTreeToggle<CR>
"-----------------------------------------------------------------

"-----------------plug-in - NeoComplCache--------------------
let g:neocomplcache_enable_at_startup = 1 " Use smartcase.
let g:neocomplcache_enable_smart_case = 1 " Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 0 " Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1 " Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:NeoComplCache_DictionaryFileTypeLists = {'default' : '','php' :'/usr/share/vim/vim70/dict/php.dict'}
" imap <silent><C-T> <Plug>(neocomplcache_snippets_expand)
" smap <silent><C-T> <Plug>(neocomplcache_snippets_expand)
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"-----------------------------------------------------------------


"-----------------plug-in - youdao_Translation--------------------
map <F2> <ESC>:call Youdao()<cr>
"-----------------------------------------------------------------

"-----------------plug-in - TList--------------------
map <F6> :TlistToggle<cr>
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Compact_Format = 0
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Max_Submenu_Items = 1
let Tlist_Max_Tag_Length = 30
let Tlist_Process_File_Always = 0
let Tlist_Show_Menu = 0
let Tlist_Show_One_File = 0
let Tlist_Sort_Type = "order"
let Tlist_Use_Horiz_Window = 0
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 20
let tlist_php_settings = 'php;c:class;i:interfaces;d:constant;f:function'

"-----------------plug-in - Powerline--------------------
let g:Powerline_symbols = 'fancy'
"-----------------------------------------------------------------

"-----------------plug-in - Vim-clojure--------------------
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1
let g:vimclojure#FuzzyIndent=1
let g:vimclojure#HighlightBuiltins=1
let g:vimclojure#HighlightContrib=1
let g:vimclojure#DynamicHighlighting=1
let g:vimclojure#WantNailgun = 1
let g:vimclojure#NailgunClient = $HOME . "/.vim/lib/vimclojure-nailgun-client/ng"
nmap <leader>r :ClojureRepl
"-----------------------------------------------------------------

"-----------------plug-in - Colorize--------------------
nmap <leader>c :ColorToggle<CR>
"-----------------------------------------------------------------
"
