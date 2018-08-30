" set syntax=vim

set nocompatible              " be iMproved, required
filetype off                  " required

" FOR PLUG
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

Plug 'alx741/vinfo'

" 插件有许多问题, 想要用起来实在不容易
" Plug 'vim-scripts/winmanager'

" Plug 'pathogen.vim'

" Vim开机画面
Plug 'mhinz/vim-startify'
"Plug 'yegappan/mru'

" Plug 'xolox/vim-session'
Plug 'vim-scripts/vim-misc'

"For QQ
" Plug 'wsdjeg/vim-chat', {'on': []}

Plug 'xuhdev/vim-latex-live-preview', {'on': []}

" For html
Plug 'mattn/emmet-vim', {'for': 'html'}

" For Go
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'Blackrush/vim-gocode', {'for': 'go'}

" About Complete 
" YouCompleteMe: cd ~/.vim/bundle/YouCompleteMe  && ./install.py --all
Plug 'Valloric/YouCompleteMe' ", {'on': []}

" ToDo List Manager
" Plug 'vitalk/vim-simple-todo', {'on': []}


" AsyncRun 异步运行 Recommend to use Vim 8.0 or later.
Plug 'skywind3000/asyncrun.vim'

" Evernote
" Plug 'kakkyz81/evervim', {'on': []}

" For mysql
" Plug 'mysqlguru/Vimsql', {'on': []}
" Plug 'cosminadrianpopescu/vim-sql-workbench', {'on': []}

" Plug 'ctrlpvim/ctrlp.vim'

" For Markdown
" Plug 'plasticboy/vim-markdown'
Plug 'vim-scripts/Markdown'
" Plug 'Markdown-syntax'

" Airline变得再好看也是airline, 放弃了
" Plug 'bling/vim-airline'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" VimWiki
" Plug 'vimwiki/vimwiki'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

" Work with tmux
" Plug 'benmills/vimux'

" For CMake
Plug 'jalcine/cmake.vim', {'for': 'cmake'}

" 很好很强大, 快速产生写好的代码片段
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'
" For Git
" Plug 'tpope/vim-fugitive', {'on': []}

" Show Marks
Plug 'kshenoy/vim-signature'

Plug 'vim-scripts/fcitx.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/css_color.vim'
Plug 'vim-scripts/vimdoc'
Plug 'vim-scripts/cscope.vim'
" Plug 'vim-scripts/ZenCoding.vim'
Plug 'vim-scripts/JSON.vim', {'for': 'json'}
Plug 'vim-scripts/vcscommand.vim'
" Plug 'Workspace-Manager'

" For Latex
Plug 'vim-scripts/vimlatex'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" For Java
" Plug 'vim-scripts/javacomplete'
" Plug 'vim-scripts/java_fold'
" Plug 'vim-scripts/javaDoc.vim'

" Doxygen注释
Plug 'vim-scripts/DoxygenToolkit.vim'

" For Python
Plug 'vim-scripts/python.vim', {'for': 'python'}
" Plug 'davidhalter/jedi-vim' ", {'for': 'python'}
" Plug 'python-mode/python-mode', { 'branch': 'develop', 'for': 'python' }
" Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}


" Plug 'vim-scripts/SuperTab', {'on': []}
Plug 'vim-scripts/AutoClose'

" Plug 'thaerkh/vim-workspace'

" For View
" Plug 'vim-scripts/minibufexpl.vim'

" Some themes
Plug 'crusoexia/vim-monokai'
Plug 'jaromero/vim-monokai-refined'
Plug 'iCyMind/NeoSolarized'
Plug 'altercation/vim-colors-solarized'
Plug 'rakr/vim-one'

Plug 'vim-scripts/Tabular' " , {'on': 'Tabular'}
Plug 'Yggdroot/indentLine'


" Vim 异步语法检查 
" This plugin requires Vim 8.0 or above to run, or NeoVim
Plug 'w0rp/ale' ", {'on':[]}

" For Verilog
" Plug 'vim-scripts/verilog.vim'

" For Spell
" Plug 'vim-scripts/SpellCheck'

call plug#end()


" FOR BUNDLE
call vundle#rc()              " 必须设置在前

" 语法检查插件
" Bundle 'Syntastic'

" GraphViz 作图
" Bundle 'wmgraphviz'



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
