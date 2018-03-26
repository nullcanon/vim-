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
"***************************************************
"                 搜索相关                         *
"***************************************************
" 高亮显示搜索结果
set hlsearch
" " 开启实时搜索功能
set incsearch
" " 搜索时大小写不敏感
set ignorecase
" " 设置魔术
set magic



"***************************************************
"检测文件类型
filetype on
"针对不同的文件采取不同的缩进方式
filetype indent on
"允许插件
filetype plugin on
"简化+寄存器操作
set clipboard=unnamedplus
"启动智能补全
filetype plugin indent on
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
"*********************************************************
"                  vundle 配置                           *
"*********************************************************
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
Bundle 'gmarik/vundle'
" My Bundles here:
"Bundle 'SuperTab'
"Bundle 'tpope/vim-commentary' "这行要用，clen的时候记得取消注释    
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'vim-airline/vim-airline'
"Bundle 'a.vim'
"Bundle 'c.vim'
"Bundle 'Align'
"Bundle 'L9'
"Bundle 'vim-javacompleteex'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Yggdroot/indentLine'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'ctags.vim'
Bundle 'taglist.vim'
Bundle 'The-NERD-tree'
Bundle 'Syntastic'
Bundle 'std_c.zip'
Bundle 'FuzzyFinder'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Valloric/YouCompleteMe' 
Bundle 'Valloric/MatchTagAlways'
"*****************************************************
"               MatchTagAlways配置                   *
"*****************************************************
let g:mta_use_matchparen_group = 1

"*****************************************************
"          映射配置                            *
"*****************************************************
"通过9跳转到行末尾,0默认跳转到行首
map 9 $

"*****************************************************
"           FuzzyFinder配置                          *
"*****************************************************
"map <leader>F :FufFile<CR>
"map <leader>f :FufTaggedFile<CR>
"map <leader>g :FufTag<CR>
"map <leader>b :FufBuffer<CR>

"*****************************************************
"          commentary配置                          *
"*****************************************************
"为python和shell等添加注释
autocmd FileType python,shell,coffee set commentstring=#\ %s
"修改注释风格
autocmd FileType java,c,cpp set commentstring=//\ %s

"gcc     注释当前行（普通模式）
"gc      可视模式下，注释当前选中的部分
"gcu     撤销上一次注释的部分，可以是一行也可以是多行
"gcgc    撤销注释当前行和邻近的上下两行 


"*****************************************************
"          ctrlp.配置                                *
"*****************************************************
"<Leader>p搜索当前目录下文件
"let g:ctrlp_map = '<Leader>p'
"let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = '<c-c>'
let g:ctrlp_cmd = ':CtrlP'
let g:ctrlp_working_path_mode = '0'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip 

"*****************************************************
"                   taglist配置                      *
"*****************************************************
"不显示"press F1 to display help"
let Tlist_Compact_Format=1
"窗口在左侧显示
let Tlist_Use_Right_Window=1
"只显示当前文件的tags
let Tlist_Show_One_File=1  
"高亮显示
let Tlist_Auto_Highlight_tag=1
"随文件自动更新
let Tlist_Auto_Update=1
"设置宽度
let Tlist_WinWidth=30       
"taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow=1 
"单击跳转
let Tlist_Use_SingClick=1
"打开关闭快捷键
"nnoremap <silent> <F3> :TlistToggle<CR>
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

"*****************************************************
"           airline配置                            *
"*****************************************************
"显示tab和buf
let g:airline#extensions#tabline#enabled = 1
"关闭tabline
"let g:airline#extensions#tabline#enabled = 0
"let g:airline#extensions#tabline#buffer_nr_show = 1

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

"*****************************************************
"           YouCompleteMe配置                        *
"*****************************************************
"leader映射为逗号“，”
let mapleader = ","  
"配置默认的ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py' 
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
"*****************************************************
"           Syntastic配置                            *
"*****************************************************
"let g:syntastic_check_on_open = 1
"let g:syntastic_cpp_include_dirs = ['/usr/include/']
"let g:syntastic_cpp_remove_include_errors = 1
"let g:syntastic_cpp_check_header = 1
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
"set error or warning signs
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '⚠'
"whether to show balloons
"let g:syntastic_enable_balloons = 1
"*****************************************************
"C，C++ 按F5编译运行                                 *
"*****************************************************
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc
"*****************************************************
"C,C++的调试 F8                                      *
"*****************************************************
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc
"*****************************************************
"新文件标题                                          *
"*****************************************************
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#!/bin/bash") 
        call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "") 

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."),   "  > File Name   : ".expand("%")) 
        call append(line(".")+1, "  > Author      : jack") 
        call append(line(".")+2, "  > Mail        : hansheng.jiayou@qq.com") 
        call append(line(".")+3, "  > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+8, "#endif")
    endif
    if &filetype == 'java'
        call append(line(".")+6,"public class ".expand("%:r"))
        call append(line(".")+7,"")
    endif
    "新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile * normal G

"*****************************************************
"代码格式优化化                                      *
"*****************************************************

map <=> :call FormartSrc()<CR><CR>

"定义FormartSrc()
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc
"结束定义FormartSrc
"]"
"]"]]"]")"]")
"
