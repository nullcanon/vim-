



set nocompatible              " 去除VI一致性,必须
filetype off                  " 必须

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim' "自动补全加语法分析
Plugin 'Align'      "标签
Plugin 'vim-airline' "标签
Plugin 'tpope/vim-commentary'
Plugin 'The-NERD-tree' "文件树
Plugin 'tpope/vim-surround' "括号插件
Plugin 'jiangmiao/auto-pairs' "括号插件


" 以下范例用来支持不同格式的插件安装.
" 请将安装插件的命令放在vundle#begin和vundle#end之间.
" Github上的插件
" 格式为 Plugin '用户名/插件仓库名'
Plugin 'tpope/vim-fugitive'
" 来自 http://vim-scripts.org/vim/scripts.html 的插件
" Plugin '插件名称' 实际上是 Plugin 'vim-scripts/插件仓库名' 只是此处的用户名可以省略
Plugin 'L9'
" 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址'
"Plugin 'git://git.wincent.com/command-t.git'
" 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径'
"Plugin 'file:///home/gmarik/path/to/plugin'
" 插件在仓库的子目录中.
" 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" 安装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突
"Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'Valloric/YouCompleteMe'

" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须

filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
" 将你自己对非插件片段放在这行之后


"指定.ycm_extra_conf.py的目录
let g:ycm_global_ycm_extra_conf ='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'


"ctags
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1

"如果为1的话，会总是提示是否加载.ycm_extra_conf.py文件
let g:ycm_confirm_extra_conf = 0

""在补全的时候默认是可以打开补全预览的,所谓的补全预览就是在vim的上面展开一个小的名为"草稿"窗口,
"里面显示的是当前补全列表中选择内容的完整内容预览, 这

"功能并不实用, 因为补全列表中的内容已经相当详细了,
"突然打开的草稿窗口只会给编辑带来不顺畅感.因此这里建议将其设置为1来关闭预览功能.
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

"*****************************************************
""           airline配置                            *
"*****************************************************
""显示tab和buf
let g:airline#extensions#tabline#enabled = 1
"关闭tabline
"let g:airline#extensions#tabline#enabled = 0
" let g:airline#extensions#tabline#buffer_nr_show = 1

 "打开tabline功能,方便查看Buffer和切换" 
  let g:airline#extensions#tabline#enabled = 1 
  let g:airline#extensions#tabline#buffer_nr_show = 1

  "设置切换Buffer快捷键"
  nnoremap <Tab> :bn<CR>
  nnoremap <Tab> :bp<CR>

  if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif

  "支持显示箭头的符号
  let g:airline_powerline_fonts = 1

             "unicode symbols
             let g:airline_left_sep = '▶'
             let g:airline_left_alt_sep = '❯'
             let g:airline_right_sep = '◀'
             let g:airline_right_alt_sep = '❮'
             let g:airline_symbols.linenr = '¶'
             let g:airline_symbols.branch = '⎇'



function! WrapForTmux(s)
    if !exists('$TMUX')
        return a:s
    endif

    let tmux_start = "\<Esc>Ptmux;"
    let tmux_end = "\<Esc>\\"

    return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

if exists('$ITERM_PROFILE')
    if exists('$TMUX')
        let &t_SI = "\<Esc>[3 q"
        let &t_EI = "\<Esc>[0 q"
    else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif
end

"********************************************************
"                   一般性配置                          *
"********************************************************
"关闭vim一致性原则
set nocompatible
"显示行号
set number
"设置在编辑过程中右下角显示光标的行列信息
set ruler
"在状态栏显示正在输入的命令
set showcmd
"设置历史记录条数
set history=1000
"设置取消备份 禁止临时文件的生成
set nobackup
set noswapfile
"设置匹配模式
set showmatch
set background=dark "黑色背景
"设置C/C++方式自动对齐
set autoindent
set cindent
"开启语法高亮功能
syntax enable
syntax on
"指定配色方案为256色
set t_Co=256
"设置搜索时忽略大小写
set ignorecase
"配置backspace的工作方式
set backspace=indent,eol,start
"选中高亮
set hls 
"高亮光标所在行
"set cul "cursorline 
"set cuc
set go=             " 不要图形按钮  
"color desert     " 设置背景主题  
color ron     " 设置背景主题  
"color torte     " 设置背景主题  
set guifont=Courier_New:h10:cANSI   " 设置字体  
"autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
"autocmd InsertEnter * se cul    " 用浅色高亮当前行  
"set whichwrap+=<,>,h,l   " 允许backspace和光标键跨越行边界(不建议)  
" 光标移动到buffer的顶部和底部时保持3行距离  
set scrolloff=3
" 总是显示状态行
set cmdheight=1
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)  
set foldenable      " 允许折叠  
"set foldmethod=manual   " 手动折叠  
"set magic                   " 设置魔术
"set guioptions-=T           " 隐藏工具栏
"set guioptions-=m           " 隐藏菜单栏
let g:indentLine_char = '┊'
"启动时不显示帮助乌干达儿童提示
set shortmess=atI 
"设置在vim中可以使用鼠标
set mouse=a
"设置tab宽度
set tabstop=4
"设置自动对齐空格数
set shiftwidth=4
" 使用回格键正常处理indent,eol,start等
set backspace=2
"设置退格键时可以删除4个空格
set smarttab
set softtabstop=4
"将tab键自动转换为空格
set expandtab
"设置编码方式
set encoding=utf-8
"自动判断编码时 依次尝试以下编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"检测文件类型
"filetype on
"针对不同的文件采取不同的缩进方式
filetype indent on
"允许插件
filetype plugin on
"简化+寄存器操作
set clipboard=unnamedplus
"启动智能补全
filetype plugin indent on
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"*****************************************************
""          映射配置                            *
"*****************************************************
"通过9跳转到行末尾,0默认跳转到行首
map 9 $

"*****************************************************
"           YouCompleteMe配置                        *
"*****************************************************
"leader映射为逗号“，”
let mapleader = ","  
"配置默认的ycm_extra_conf.py
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py' 
let g:ycm_show_diagnostics_ui = 1    " 开启实时错误或者warning的检测  

" 错误标记  
let g:ycm_error_symbol = 'E'  "set error or warning signs  

" warning标记  
let g:ycm_warning_symbol = 'W'  

let g:ycm_add_preview_to_completeopt = 0    " 关闭补全预览 
"按gb 会跳转到定义,并会用分屏打开
let g:ycm_goto_buffer_command = 'horizontal-split' 
nnoremap <silent> gb :YcmCompleter GoToDefinitionElseDeclaration<CR>   
"打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_confirm_extra_conf=0   
"使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tag_files = 1 
"注释和字符串的的补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1
"在注释中也可以补全  
let g:ycm_complete_in_comments=1  
""在字符串中也可以补全
let g:ycm_complete_in_strings = 1
let g:ycm_key_invoke_completion='<C-d>'"
map <F4> : YcmDiags<CR>

"********************************************************
"                      NERD_Tree 配置                   *
"********************************************************
"显示增强
let NERDChristmasTree=1
"自动调整焦点
let NERDTreeAutoCenter=1
"鼠标模式:目录单击,文件双击
let NERDTreeMouseMode=2
"打开文件后自动关闭
let NERDTreeQuitOnOpen=0
"显示文件
let NERDTreeShowFiles=1
"显示隐藏文件
let NERDTreeShowHidden=0
"高亮显示当前文件或目录
let NERDTreeHightCursorline=1
"显示行号
let NERDTreeShowLineNumbers=1
"窗口位置
let NERDTreeWinPos='left'
"窗口宽度
let NERDTreeWinSize=31
"不显示'Bookmarks' label 'Press ? for help'
let NERDTreeMinimalUI=1
"快捷键
nnoremap <silent> <F2> :NERDTreeToggle<CR>
"当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
"只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" 设置当文件被改动时自动载入
" set autoread

"配色方案
colorscheme desert

"TODO 安装snipMate插件实现一键生成代码片段
