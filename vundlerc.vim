" set syntax=vim

set nocompatible              " be iMproved, required
filetype off                  " required

" FOR PLUG
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

" 最近打开文件合集
Plug 'mhinz/vim-startify'
"Plug 'yegappan/mru'

"Plug 'xolox/vim-session'
"Plug 'vim-scripts/vim-misc'

"For QQ
Plug 'wsdjeg/vim-chat', {'on': []}
Plug 'xuhdev/vim-latex-live-preview', {'on': []}

" For Go
Plug 'fatih/vim-go', {'on': []}
Plug 'Blackrush/vim-gocode', {'on': []}

" About Complete 
" YouCompleteMe: cd ~/.vim/bundle/YouCompleteMe  && ./install.py --all
Plug 'Valloric/YouCompleteMe', {'on': []}

" ToDo List Manager
Plug 'vitalk/vim-simple-todo', {'on': []}

Plug 'cosminadrianpopescu/vim-sql-workbench', {'on': []}

" AsyncRun 异步运行 Recommend to use Vim 8.0 or later.
Plug 'skywind3000/asyncrun.vim'

Plug 'kakkyz81/evervim'

" For mysql
Plug 'mysqlguru/Vimsql', {'on': []}

Plug 'godlygeek/tabular'

" For Markdown 全部被注释掉, 我不喜欢markdown文档变样
Plug 'plasticboy/vim-markdown'
" Plug 'plasticboy/vim-markdown'
" Plug 'Markdown'
" Plug 'Markdown-syntax'

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" For CMake
Plug 'jalcine/cmake.vim', {'on': []}


Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

"For Git
Plug 'tpope/vim-fugitive'

" Show Marks
Plug 'kshenoy/vim-signature'
Plug 'vim-scripts/fcitx.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/css_color.vim'
Plug 'vim-scripts/vimdoc'
Plug 'vim-scripts/cscope.vim'
Plug 'vim-scripts/ZenCoding.vim'
Plug 'vim-scripts/JSON.vim'
Plug 'vim-scripts/vcscommand.vim'
" Plug 'Workspace-Manager'

" For Latex
Plug 'vim-scripts/vimlatex'

" For Java
Plug 'vim-scripts/javacomplete'
Plug 'vim-scripts/java_fold'
Plug 'vim-scripts/javaDoc.vim'

" Doxygen注释
Plug 'vim-scripts/DoxygenToolkit.vim'

" For Python
Plug 'vim-scripts/python.vim'

Plug 'vim-scripts/SuperTab', {'on': []}
Plug 'vim-scripts/AutoClose'

" Plug 'thaerkh/vim-workspace'

" For View
Plug 'vim-scripts/minibufexpl.vim', {'on': []}
Plug 'altercation/vim-colors-solarized'
Plug 'sickill/vim-monokai'
Plug 'vim-scripts/Tabular', {'on': 'Tabular'}
Plug 'Yggdroot/indentLine'

" Vim 异步语法检查 
" This plugin requires Vim 8.0 or above to run, or NeoVim
Plug 'w0rp/ale'

" For Verilog
Plug 'vim-scripts/verilog.vim'

" For Spell
Plug 'vim-scripts/SpellCheck'

call plug#end()


" FOR BUNDLE
call vundle#rc()              " 必须设置在前

" 语法检查插件
" Bundle 'Syntastic'

" GraphViz 作图
Bundle 'wmgraphviz'



" My Bundles here:
"
" original repos on github
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'


filetype plugin indent on     " required! 
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
