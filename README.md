# 我的vim配置(某些异步插件需要8.0以上)

![Vim](https://img.shields.io/badge/Vim-Best%20Editor-green.svg)

> 作为多年的`linux`和`vim`粉, 我好像正在被分享所融化, 曾经我的`.vim`文件夹中杂乱不堪,
> 开始接触`vundle`时, 我的内心是拒绝的, 我很辛苦才将`you-complete-me` 配置成功,
> 不想因为一个包管理而将辛苦配置的插件丢失, 但是linux的吸引之处绝不是混乱不堪, 
> 而是清晰, 有条理. 我花了一上午的时间将我的`.vim`目录配套了`vundle`包管理, 
> 这真是一个性感的工具, 基本上一条命令基本就可以将`vim`配置完成. 


## `.vim`目录结构

```bash
.
├── bundle/             # 插件存放文件夹
├── UltiSnips/          # 我的snip存放文件夹
├── vrapperrc           # .vrapperrc eclipse vrapperrc插件配置
├── vimrc               # .vimrc
├── gvimrc              # .gvimrc
├── ycm_extra_conf.py   # YCM 配置文件
└── vundlerc            # Bundle插件存放
2 directories, 5 files
```

## usage


1. 安装

最近模仿`SpaceVim`的安装脚本, 自己也写了一个哈:

```bash
curl -sL https://goo.gl/2DHtv5 | bash -
curl -sL https://corvo.myseu.cn/xyz/install.sh | bash -
# 或者
curl https://raw.githubusercontent.com/corvofeng/MyVimConfig/master/install.sh | bash -

# 再次执行下面的命令即可
./.vim/install.sh
```

建议将特定文件软链接到家目录, 这样修改一个文件的同时会进行同步

<!-- 1. 首先添加`.vimrc`等文件

```bash
git clone https://github.com/corvofeng/MyVimConfig.git ~/.vim
ln -s ~/.vim/vimrc.vim ~/.vimrc
ln -s ~/.vim/gvimrc.vim ~/.gvimrc
ln -s ~/.vim/vrapperrc ~/.vrapperrc
```
 -->
2. 安装插件
```bash
vim +BundleInstall +PlugInstall
```
默认读者有过基本`vim`操作技能


## vundlerc.vim

> 详见`vundlerc.vim`文件, 其中不免有些混乱, 望大家谅解, 许多插件我也只是安装,
> 还没有能深入使用


## vimrc

> vimrc中许多行都有注释, 我只挑`DIY`的重点来贴,
> 希望大家有所收获, 也能自定义出自己的配置, 适合自己的才是最好的

```
source ~/.vim/vundlerc.vim          "vim 第一行, 读入vundlerc

" 普通文件缩进4个字符
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

au Filetype c,cpp setl sw=8 sts=8 ts=8 et       "C, C++: 缩进8个字符

set hlsearch                    "高亮搜索
set incsearch                   "输入字符串就开始搜索

" 高亮搜索后关闭高亮, 困扰了我许久的问题, 
" 高亮的搜索没法关闭真是太痛苦了
map<F2> : noh <CR>

" 使用xterm运行, 可以直接弹出框, 按ESC或Enter退出xterm
" 许多快捷键操作都是调用此函数
function! Xterm(cmd)
    silent exec "!xterm -e '". a:cmd ." ; read" ."'"
endfunction

" 异步执行函数, 使用copen可以打开执行结果窗口
function! AsRun(cmd)
    silent exec "AsyncRun ". a:cmd .""
endfunction

" C C++ sh java的编译和运行  使用Shift+F10 此处调用Xterm
map <S-F10> :call CompileAndRun()<CR>

func! CompileAndRun()
    exec "w"
    if &filetype == 'c'                         "C and C++
        call AsRun("gcc -g % -o %< && ./%<")
    elseif &filetype == 'cpp'
        call AsRun("g++ -g % -o %< && ./%<")
    elseif &filetype == 'sh'                    "Shell Script
        call Xterm("chmod u+x % && ./%")
    elseif &filetype == 'dot'                   "Dot 作图
        silent exec "! dot -Tpng % -o %<.png"
    elseif &filetype == 'java'                  "Java Source 
        call AsRun("javac % && java %<")
    elseif &filetype == 'md'                    "For MarkDown
        call Xterm("nemo .")
    elseif &filetype == 'asm'                   "For asm
        "call Xterm("nasm % -o %<.bin")
        "call Xterm("make")
        AsyncRun make
    elseif &filetype == 'python'                "For Python
        call AsRun("python %")
    endif
endfunc

" 自定义的snip中可以插入变量, 可以自行修改用户与项目名称
let g:snips_author = "corvo"
let g:snips_projectname = "default"

" UltiSnips与YCM快捷键有冲突, 改为Ctrl+j补全snippets
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-k>'
let g:UltiSnipsJumpBackwardTrigger='<c-s-k>'
let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'

"Tablur 强大的对齐工具 
let mapleader=','
if exists(":Tabularize")
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
endif
```


## gvimrc

> 我的`gvim`配置, 定义了其它一些配置, 有许多已经有注释了, 就不贴了

```
set foldenable          "在gvim中可以进行折叠
set foldmethod=syntax

set lines=35 columns=90 "设置打开时窗口的大小

" 把`gvim`窗口周围都去掉的感觉很爽的, 如果开始使用不熟悉, 
" 将滚动条和工具条加回来就好
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
```


## Don Not Give Up

*  当我还是`linux`初学者的时候, `vim`的学习是艰苦的.
也许手指不离开键盘是一件挺炫的事情, 但是开始实在是很难适应, 
我的学习方法是:
*当你知道`hjkl`的用法之后就开始玩游戏, 我的游戏是在`chrome`上找到的`2048`,
 同时搭配`Vimium`, 
 逼迫自己使用`hjkl`进行操作, 我大概练习了一个小时, `vim`的移动就学习的差不多了. *

* 开始入门时, 效率不高是很正常. 不过用的多了之后, 效率真的是别的编辑器无法比拟的. 
 并不是说`vim`是神, 现在的许多`IDE`都提供了`vim`的插件, 
 比如`JetBrains`和`Eclipse`的插件就很好, 几乎可以无缝对接. 当你真正把`vim`用熟之后, 
 在不同的开发环境下也能拥有极高的效率, 
 我几乎不知道`JetBrains`和`Eclipse`的快捷键, 但是可以不用鼠标去调整光标

> 许多软件的原则是好用, 而不是易用, 如果你想更高效率的工作, 
> 花点时间在编辑器的配置上总不是件坏事.


## LICENSE:

Copyright © 2016 corvo. 未经许可不得用于商业用途. 转载请注明出处.

