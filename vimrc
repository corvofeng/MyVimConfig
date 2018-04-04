" vim: foldmethod=marker foldcolumn=3
" 使用magic line, zR 打开全部折叠

" 基础设置 {{{

" 添加Vundlerc脚本 
source ~/.vim/vundlerc.vim

syntax on

set cindent     "设置c自动缩进
set smartindent
set autoindent

set foldlevel=1
" 自动识别UNIX格式和MS-DOS格式
set fileformats=unix,dos


let g:tex_conceal = "" "latex关键字不进行自动隐藏

" 这是Evernote 不是印象笔记
let g:evervim_nutstore='https://www.evernote.com/shard/s601/notestore'
let g:evervim_devtoken='S=s601:U=679e590:E=162d689dfcb:C=15b7ed8b0f0:P=1cd:A=en-devtoken:V=2:H=a2b5f0303de8aacebdd2de76f70b169f'

let g:VimuxUseNearest=1
let g:VimuxRunnerInde="vim_attach:1.1"

" 添加对于Tmux的支持
function! VimuxSlime()
    call VimuxSendText(@v)
    call VimuxSendKeys("Enter")
endfunction

 " If text is selected, save it in the v buffer and send that buffer it to tmux
vmap <S-F5>  "vy : call VimuxSlime()<CR>

" 命令行下的补全功能
set wildmode=list:longest

" 普通文件缩进4个字符
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set number      " 显示行号
" set relativenumber " 相对行号设置

" set scrolloff=15 " 顶部始终有15行, 保持光标在中间

let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

let g:solarized_termcolors = 256
let g:solarized_contrast   = "high"
let g:solarized_diffmode   = "low"

" colorscheme solarized
" set background=light

set cc=78               " 80字符对齐线

"let g:solarized_hitrail   = 1

set showmatch             " 括号配对
set linebreak             " 整词换行
set whichwrap=b,s,<,>,[,] " 设置整词换行
set nocompatible          " 删除vi一致性

set matchtime=1 " 匹配括号高亮
"set mouse=a     " 允许鼠标
set clipboard+=unnamed

set hlsearch                    "高亮搜索
set incsearch                   "输入字符串就开始搜索

set autochdir                   " 自动切换目录

set showcmd

"设置命令行高度为1
set cmdheight=1

"粘贴时保持格式
set paste

set regexpengine=1

filetype on
filetype plugin on
filetype plugin indent on

"Markdown 禁止文本中转换
set conceallevel=2
let g:tex_conceal = ""
let g:vim_markdown_conceal = 0

"Make enter finish the completion popup menu
"inoremap<expr><CR> pumvisible()? <C-y>: <C-g>u\<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"python 配置文件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:pydiction_location='~/.vim/complete-dict'
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType go set omnifunc=gocomplete#Complete

"let g:vjde_completion_key='<c-space>'
au Filetype c,cpp setl sw=4 sts=4 ts=4 et       "C, C++: 缩进8个字符
au Filetype asm setl sw=8 sts=8 ts=8 et       "汇编代码

"au FileType java setl omnifunc=javacomplete#Complete sw=4 sts=4 et
"autocmd FileType javascrīpt set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete


let g:pydiction_location='/home/corvo/.vim/complete-dict'
"let g:pydiction_menu_height = 5
if has("autocmd")
    autocmd FileType python set complete+=k/home/corvo/.vim/pydiction iskeyword+=.,(
endif " has("autocmd")


" fzf 配置
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Minibufexpl
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

"保存文件
nmap <c-s> :w<CR>

" }}}

" 自定义函数 {{{

"高亮搜索后关闭高亮
map<F2> : noh <CR>

"目录树
map <F3> :NERDTreeToggle <CR>
imap <F3> <ESC>: NERDTreeToggle <CR>

"QT
map <F4>:call ComplieQt() <CR>
func! ComplieQt()
        exec "w"
        exec "!qmake-qt4 -project"
        exec "!qmake-qt4"
        exec "make"
endfunc

let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif

" Ctags的设定
map <C-F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

let Tlist_Auto_Highlight_Tag   = 1
let Tlist_Auto_Update          = 1
let Tlist_Display_Tag_Scope    = 1
let Tlist_Exit_OnlyWindow      = 1
let Tlist_Enable_Dold_Column   = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Show_One_File        = 1
let Tlist_Use_Right_Window     = 1
let Tlist_Use_SingleClick      = 1
let Tlist_Ctags_Cmd            = '/usr/bin/ctags'
nnoremap <silent> <F8> :TlistToggle <CR>

"打开所在文件夹
map <F11> : silent exec "!nemo ." <CR>
map <S-F11> : silent exec "!gnome-terminal ." <CR>

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" LOAD YCM
augroup load_us_ycm
  autocmd!
  autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe')
                     \| autocmd! load_us_ycm
augroup END

" if filereadable("./_gvimrc")
"     source _gvimrc
" endif

" 使用xterm运行
function! Xterm(cmd)
    silent exec "!xterm -e '". a:cmd ." ; read" ."'"
endfunction

" 异步执行函数, 使用copen可以打开执行结果窗口
function! AsRun(cmd)
    silent exec "AsyncRun ". a:cmd .""
endfunction

" C C++ sh java的编译和运行
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

" }}}

" 工具函数 {{{

""""""""""""""""""""""""""""""
"Chinese Punctuation
" 将中文标点直接替换为英文标点
""""""""""""""""""""""""""""""
function! CheckChineseMark()
    "依次检查
    if search('。')
        let s:line=search('。')
        execute s:line . "s/。/\.\ /g"
    endif

    if search('。')
        let s:line=search('。')
        execute s:line . "s/。/\.\ /g"
    endif

    if search('，')
        let s:line=search('，')
        execute s:line . "s/，/,\ /g"
    endif

    if search('；')
        let s:line=search('；')
        execute s:line . "s/；/:\ /g"

    endif

    if  search('？')
        let s:line=search('？')
        execute s:line . "s/？/?\ /g"
    endif

    if search('：')
        let s:line=search('：')
        execute s:line . "s/：/\:\ /g"
    endif

    if search('‘')
        let s:line=search('‘')
        execute s:line . "s/‘/\'/g"
    endif

    if search('’')
        let s:line=search('’')
        execute s:line . "s/’/\'/g"
    endif

    if search('”')
        let s:line=search('”')
        execute s:line . "s/”/\"/g"
    endif

    if search('“')
        let s:line=search('“')
        execute s:line . "s/“/\"/g"
    endif

    if search('《')
        let s:line=search('《')
        execute s:line . "s/《/\</g"
    endif

    if search('》')
        let s:linie=search('》')
        execute s:line . "s/》/\>/g"
    endif

    if search('——')
        let s:line=search('——')
        execute s:line . "s/——/-/g"
    endif

    if search('）')
        let s:line=search('）')
        execute s:line . "s/）/\)/g"
    endif

    if search('（')
        let s:line=search('（')
        execute s:line . "s/（/\(/g"
    endif

    if search('……')
        let s:line=search('……')
        execute s:line . "s/……/^/g"
    endif

    if search('￥')
        let s:line=search('￥')
        execute s:line . "s/￥/$/g"
    endif

    if search('！')
        let s:line=search('！')
        execute s:line . "s/！/!/g"
    endif

    if  search('·')
        let s:line=search('·')
        execute s:line . "s/·/`/g"
    endif

endfunction

""" For linux Kernel
""" This is my settings
"""
"""Add any cscope database in current directory
if filereadable("cscope.out")
cs add cscope.out
""" else add the database pointed to by environment variable
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif

nmap <C-\>s :cs  find s <C-R>=expand("<cword>") <CR><CR>
nmap <C-\>g :cs  find g <C-R>=expand("<cword>") <CR><CR>
nmap <C-\>c :cs  find c <C-R>=expand("<cword>") <CR><CR>
nmap <C-\>t :cs  find t <C-R>=expand("<cword>") <CR><CR>
nmap <C-\>e :cs  find e <C-R>=expand("<cword>") <CR><CR>
nmap <C-\>f :cs  find f <C-R>=expand("<cword>") <CR><CR>
nmap <C-\>i :cs  find i <C-R>=expand("<cword>") <CR><CR>
nmap <C-\>d :cs  find d <C-R>=expand("<cword>") <CR><CR>


"括号自动补全
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {} <ESC>hi
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i
"function! ClosePair(char)
"        if getline('.')[col('.') - 1] == a:char
"                return "\<Right>"
"        else
"                return a:char
"        endif
"endfunction

" C++ 语法检查设置
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

"markdown
let g:vim_markdown_folding_disabled        = 1 " 阻止Markdown折叠
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_math                    = 1
let g:vim_markdown_frontmatter             = 1


"YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'

" YouCompleteMe setup
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_filetype_blacklist={'unite': 1}
let g:ycm_min_num_of_chars_for_completion = 1
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" UltiSnips setup
" 使用c-b 可以由$1跳转至$2
" 使用c-z 可以由$2跳回$1
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsListSnippets='<c-tab>'
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=[$HOME.'.vim/plugged/vim-snippets/snippets', $HOME.'/.vim/UltiSnips']

" For Snippet
let g:snips_author="corvo"
let g:snips_projectname="default"
let g:ultisnips_python_style="google"       " python注释风格

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

"Tablur
let mapleader=','
if exists(":Tabularize")
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
endif

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction


"For diff
if &diff
    highlight! link DiffText MatchParen
endif

" Doxygen 注释
"let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
"let g:DoxygenToolkit_paramTag_pre="@Param "
"let g:DoxygenToolkit_returnTag="@Returns   "
"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="corvo"
"let g:DoxygenToolkit_licenseTag="My own license"

" 在NERDTree中不显示pyc文件
let NERDTreeIgnore = ['\.pyc$']

let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,d,vim,ruby,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

