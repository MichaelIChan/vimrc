set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" 下面是一些不同来源的插件的配置案例
" 请将这些插件配置放置于vundle#begin/end之间

" backpage kcal lidm jack facebook target luach ajax


" plugin on GitHub repo
" GitHub 仓库插件格式
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" vim 官方插件配置方法，写入名字就行了
"Plugin 'L9'
" Git plugin not hosted on GitHub
" git服务器插件，但不是在GitHub上面
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" git 仓库在自己的电脑上
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" 已经存在一个L9的插件了，另外再安装一个名字叫L9的插件
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line

" 用于解决代码折叠数目过多情况的插件
Plugin 'tmhedberg/SimpylFold'

" 自动补全引号，括号
Plugin 'Raimondi/delimitMate'

" 代码缩进标示
Plugin 'Yggdroot/indentLine'

" 文件目录树
Plugin 'scrooloose/nerdtree.git'

" YouCompleteME 代码补全
Plugin 'Valloric/YouCompleteMe'

" vim-airline 状态栏增强插件
Plugin 'bling/vim-airline'

" ctrlp全局搜索
Plugin 'kien/ctrlp.vim'

" tagbar
Plugin 'majutsushi/tagbar'

" 快速注释
Plugin 'scrooloose/nerdcommenter'

" 光标快速移动
Plugin 'easymotion/vim-easymotion'

" 显示代码尾部的空格
Plugin 'ShowTrailingWhitespace'


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

nnoremap <C-J> <C-W><C-J> " 切换到下方的分割窗口
nnoremap <C-K> <C-W><C-K> " 切换到上方的分割窗口
nnoremap <C-L> <C-W><C-L> " 切换到右侧的分割窗口
nnoremap <C-H> <C-W><C-H> " 切换到左侧的分割窗口

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 基于语法折叠
" set foldmethod=syntax
"基于缩进代码折叠，用空格键代替za
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" 显示折叠代码的文档字符串
let g:SimpylFold_docstring_preview=1

"indentLine 代码缩进线标志线
let g:indentLine_char = '¦'
let g:indentLine_color_term = 239
"映射到ctrl+i键
map <C-i> :IndentLinesToggle<CR>

set encoding=utf-8
" 高亮显示搜索结果
set hlsearch

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 文件目录树 NERD-tree  explore ,映射到ctrl+e , " 隐藏pyc文件
let NERDTreeWinPos='left'
let NERDTreeWinSize=25
map <C-e> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree"


" YCM 配置
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'  "配置默认的ycm_extra_conf.py
let g:ycm_confirm_extra_conf=0    "打开vim时不再询问是否加载ycm_extra_conf.py配置
" leader映射为逗号“,”
let mapleader = ","
" 按jd跳转到语义
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu
" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
 let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2	"
" 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0


" 文件侦查启动,用以检测文件的后缀
filetyp on
" 设置tagbar使用的ctags的插件,必须要设置对
let g:tagbar_ctags_bin='ctags'
" 设置tagbar的窗口宽度
let g:tagbar_width=25
" 设置tagbar的窗口显示的位置,为右边
let g:tagbar_right=1
" 打开文件自动 打开tagbar
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*py call tagbar#autoopen()
" 映射tagbar的快捷键
map <F3> :TagbarToggle<CR>

" 全局搜索插件ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" vim-airline
set laststatus=2
set t_Co=256

" strip all trailing whitespace in the current file
" 在normal模式下,按leader + w, 删除所有行尾的空格
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>


"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.py文件
    if &filetype == 'python'
	call append(line("."), "#coding:utf-8")
        call append(line(".")+1, "# File Name: ".expand("%"))
        call append(line(".")+2, "# Author: Michael")
        call append(line(".")+3, "# Email: loveandloss@hotmail.com")
        call append(line(".")+4, "# Created Time: ".strftime("%Y-%m-%d"))
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call setline(1, "/*")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Author: Michael")
        call append(line(".")+2, "    > Email: loveandloss@hotmail.com")
        call append(line(".")+3, "    > Created Time: ".strftime("%Y-%m-%d"))
        call append(line(".")+4, " */")
        call append(line(".")+5, "")
    endif
    if &filetype == 'c'
        call setline(1, "/*")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Author: Michael")
        call append(line(".")+2, "    > Email: loveandloss@hotmail.com")
        call append(line(".")+3, "    > Created Time: ".strftime("%Y-%m-%d"))
        call append(line(".")+4, " */")
        call append(line(".")+5, "")
    endif
    if &filetype == 'java'
        call setline(1, "/*")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Author: Michael")
        call append(line(".")+2, "    > Email: loveandloss@hotmail.com")
        call append(line(".")+3, "    > Created Time: ".strftime("%Y-%m-%d"))
        call append(line(".")+4, " */")
        call append(line(".")+5, "")
    endif
    if &filetype == 'h'
        call setline(1, "/*")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Author: Michael")
        call append(line(".")+2, "    > Email: loveandloss@hotmail.com")
        call append(line(".")+3, "    > Created Time: ".strftime("%Y-%m-%d"))
        call append(line(".")+4, " */")
        call append(line(".")+5, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc

function HeaderPython()
    call setline(1, "#coding:utf-8")
    call append(line("."), "#")
    call append(line(".")+1, "# File Name: ".expand("%"))
    call append(line(".")+2, "# Author: Michael")
    call append(line(".")+3, "# Email: loveandloss@hotmail.com")
    call append(line(".")+4, "# Created Time: ".strftime("%Y-%m-%d"))
    call append(line(".")+5, "#")
    normal G
    autocmd BufNewFile * normal G
endf
autocmd bufnewfile *.py call HeaderPython()

if has('gui_running')
    set lines=999 columns=999
    set background=dark
    colorscheme solarized
    set guioptions-=m " 隐藏菜单栏
    set guioptions-=T " 隐藏工具栏
    set guioptions-=L " 隐藏左侧滚动条
    set guioptions-=r " 隐藏右侧滚动条
    set guioptions-=b " 隐藏底部滚动条
    set showtabline=0 " 隐藏Tab栏
    set guifont=Monaco
endif

" 取消光标闪烁
set gcr=a:blinkon0

" 关闭（开启）终端闪烁
" gsettings set org.gnome.desktop.interface cursor-blink false(true)

" ctrl + o 返回光标刚才所在位置
" ctrl + e 打开nerdtree
" ctrl + p 全局搜索
" <leader>jd 跳转至定义部分
" <leader>cc 多行注释
" <leader>cu 取消注释
" <leader><leader>   快速跳转
" 命令模式 输入 / + 字符 进行查找 n下一个， shift + n 上一个
"
"
" i : 在当前字符的左边插入
" I : 在当前行首插入
" a : 在当前字符的右边插入
" A : 在当前行尾插入
" o : 在当前行下面插入一个新行
" O ：在当前行上面插入一个新行
