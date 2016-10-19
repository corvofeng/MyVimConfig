source ~/.vim/vundlerc

syntax on

set cindent     "设置c自动缩进
set smartindent
set autoindent

let g:tex_conceal = "" "latex关键字不进行自动隐藏

" 普通文件缩进4个字符
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set number      " 显示行号

set scrolloff=1 " 顶部始终有15行, 保持光标在中间

let g:solarized_termcolors = 256
let g:solarized_contrast   = "high"
let g:solarized_diffmode   = "low"

colorscheme solarized 
set background=light

set cc=80				" 80字符对齐线

"let g:solarized_hitrail   = 1

set showmatch             " 括号配对
set linebreak             " 整词换行
set whichwrap=b,s,<,>,[,] " 设置整词换行
set nocompatible          " 删除vi一致性

set matchtime=1 " 匹配括号高亮
set mouse=a     " 允许鼠标
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


"保存文件
nmap <c-s> :w<CR>

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


" 使用xterm运行
function! Xterm(cmd)
    silent exec "!xterm -e '". a:cmd ." ; read" ."'"
endfunction

" C C++ sh java的编译和运行  
map <S-F10> :call CompileAndRun()<CR>
func! CompileAndRun()
    exec "w"
    if &filetype == 'c'                         "C and C++
        call Xterm("gcc -g % -o %< && ./%<")
    elseif &filetype == 'cpp'
        call Xterm("g++ -g  % -o %< && ./%<")
    elseif &filetype == 'sh'                    "Shell Script
        call Xterm("chmod u+x % && ./%")
    elseif &filetype == 'java'                  "Java Source 
        call Xterm("javac % && java %<")
    elseif &filetype == 'md'                    "For MarkDown
        call Xterm("nemo .")
    elseif &filetype == 'asm'                   "For asm
        "call Xterm("nasm % -o %<.bin")
        call Xterm("make run")
    elseif &filetype == 'python'                "For Python
        call Xterm("python %")
    endif
endfunc


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

"markdown 
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
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-k>'
let g:UltiSnipsJumpBackwardTrigger='<c-s-k>'
let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'

" For Snippet
let g:snips_author = "corvo"
let g:snips_projectname = "default"

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

" Doxygen
let g:DoxygenToolkit_briefTag_pre="@Synopsis  " 
let g:DoxygenToolkit_paramTag_pre="@Param " 
let g:DoxygenToolkit_returnTag="@Returns   " 
"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------" 
"let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------" 
let g:DoxygenToolkit_authorName="corvo" 
"let g:DoxygenToolkit_licenseTag="My own license"  

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

