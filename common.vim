" vim: foldmethod=marker foldcolumn=3
" 使用magic line, zR 打开全部折叠

" 基础设置 {{{

" echo "Before Vimrc"

syntax on

set cindent     "设置c自动缩进
set smartindent
set autoindent
set cursorline   " 突出显示当前行

set bg=light
set t_Co=256   " This is may or may not needed.
colorscheme NeoSolarized

" vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

" Some ListChars won't use
set list
set listchars=tab:▸-,trail:·,extends:>,precedes:<
"set listchars=tab:»·,trail:·
"set listchars=tab:┊\
"set listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×
hi NonText ctermfg=7 guifg=gray


set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
set statusline+=%-40f\                    " path
set statusline+=%=%1*%y%*%*\              " file type
set statusline+=%10((%l,%c)%)\            " line and column
set statusline+=%P                        " percentage of file
set laststatus=2

set foldlevel=1
" 自动识别UNIX格式和MS-DOS格式
set fileformats=unix,dos

set backspace=indent,eol,start  " more powerful backspacing

" 设置<Leader>键为',' 也可以设置为';'或是'/'
let mapleader=','

let g:tex_conceal = "" "latex关键字不进行自动隐藏

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimux 配置文件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:VimuxUseNearest=1
let g:VimuxRunnerIndex="vim_attach:1.1"

" 添加对于Tmux的支持
function! VimuxSlime()
    call VimuxSendText(@v)
    call VimuxSendKeys("Enter")
endfunction

 " If text is selected, save it in the v buffer and send that buffer it to tmux
vmap <S-F5>  "vy : call VimuxSlime()<CR>

" 命令行下的补全功能
set wildmode=list:longest

" 普通文件的补全
set completeopt=preview,menu

" 普通文件缩进4个字符
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set number      " 显示行号
set relativenumber " 相对行号设置

" set scrolloff=15 " 顶部始终有15行, 保持光标在中间

" let g:session_autosave = 'yes'
" let g:session_autoload = 'yes'

" let g:solarized_termcolors = 256
" let g:solarized_contrast   = "high"
" let g:solarized_diffmode   = "low"
" let g:solarized_hitrail   = 1

" colorscheme solarized
" set background=light

set cc=78               " 80字符对齐线

" 设置jedi为python3
let g:jedi#force_py_version=3

set showmatch             " 括号配对
set linebreak             " 整词换行
set whichwrap=b,s,<,>,[,] " 设置整词换行
set nocompatible          " 删除vi一致性

"set mouse=a     " 允许鼠标
set matchtime=1 " 匹配括号高亮
set clipboard+=unnamed

set hlsearch                    "高亮搜索
set incsearch                   "输入字符串就开始搜索

set autochdir                   " 自动切换目录

set showcmd

"设置命令行高度为1
set cmdheight=1

"粘贴时保持格式, 但是这样Ultisnip就不可以用了
" set paste

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
" autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType go set nolist "omnifunc=gocomplete#Complete nolist

" let g:vjde_completion_key='<c-space>'
au Filetype c,cpp setl sw=4 sts=4 ts=4 et " C, C++: 缩进8个字符
au Filetype json setl sw=2 sts=2 ts=2 et  " JSON: 缩进8个字符
au Filetype asm setl sw=8 sts=8 ts=8 et   " 汇编代码
au Filetype typescript setl sw=2 sts=2 ts=2 et  " typescript: 缩进2个字符

"au FileType java setl omnifunc=javacomplete#Complete sw=4 sts=4 et
"autocmd FileType javascrīpt set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Golang 配置文件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 0

let g:pydiction_location='/home/corvo/.vim/complete-dict'
"let g:pydiction_menu_height = 5
" if has("autocmd")
"     autocmd FileType python set complete+=k/home/corvo/.vim/pydiction iskeyword+=.,(
" endif " has("autocmd")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimWiki, 必须放置在vimrc中, 放在gvimrc中无法读入设置
" Save in  ls ~/Dropbox/Diary/vimwikidiary
" 有些配置需要在vimwiki之后进行设置, 请将其提前
" \ 'custom_wiki2html': 'vimwiki_markdown',
" \ 'custom_wiki2html': '~/.vim/misaka_md2html.py',
" \ 'template_path': '~/vimwiki/site_html/vimwiki-assets/',
" \ 'template_default': 'default',
" \ 'template_ext': '.html',
" \ 'custom_wiki2html_args': 'stuff',
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{
          \ 'path': '~/Dropbox/Diary/',
          \ 'template_path': '~/Dropbox/Diary/assets',
          \ 'template_default': 'default',
          \ 'template_ext': '.html',
          \ 'diary_rel_path': 'vimwikidiary/',
          \ 'syntax': 'markdown',
          \ 'ext': '.md',
          \ 'path_html': '~/vimwiki/site_html/',
          \ 'auto_toc': 1,
          \ 'custom_wiki2html': '~/.vim/wiki/wiki2html.sh',
          \ 'css_name': 'github-pandoc.css',
          \ }]

" 在Google clendar 中可以直接跳转到本日的日记
autocmd FileType calendar nmap <buffer> <CR> :<C-u>call vimwiki#diary#calendar_action(b:calendar.day().get_day(), b:calendar.day().get_month(), b:calendar.day().get_year(), b:calendar.day().week(), "V")<CR>


" Vimwiki使得所有的Markdown文件全部变成了vimwiki, 这里进行设置
" https://github.com/vimwiki/vimwiki/issues/292
let g:vimwiki_global_ext=0
let g:vimwiki_conceallevel=0        " 禁止文本转换

let g:vimwiki_ext2syntax = {'.md': 'markdown',
            \ '.mkd': 'markdown',
            \ '.wiki': 'media'}

autocmd FileType vimwiki,markdown hi VimwikiHeader1 guifg=#FF0000
autocmd FileType vimwiki,markdown hi VimwikiHeader2 guifg=#00FF00
autocmd FileType vimwiki,markdown hi VimwikiHeader3 guifg=#0000FF
autocmd FileType vimwiki,markdown hi VimwikiHeader4 guifg=#FF00FF
autocmd FileType vimwiki,markdown hi VimwikiHeader5 guifg=#00FFFF
autocmd FileType vimwiki,markdown hi VimwikiHeader6 guifg=#FFFF00
" hi link VimwikiHeader1 pandocBlockQuoteLeader1
" hi link VimwikiHeader2 pandocBlockQuoteLeader2
" hi link VimwikiHeader2 guifg=#00FF00
" hi link VimwikiHeader3 pandocBlockQuoteLeader3
" hi link VimwikiHeader4 pandocBlockQuoteLeader4
" hi link VimwikiHeader5 pandocBlockQuoteLeader5
" hi link VimwikiHeader6 pandocBlockQuoteLeader6



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown 语法的设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Markdown 禁止文本中转换
set conceallevel=0
let g:tex_conceal = ""
let g:vim_markdown_conceal = 0

" IndentLine插件会查看g:indentLine_conceallevel这一项来决定conceallevel
" 我这里直接进行了修改
autocmd FileType vimwiki,markdown let g:indentLine_conceallevel=0

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
imap <F3> <ESC>:NERDTreeToggle <CR>

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

" 设置Python文件tag显示
let tlist_python_settings = 'python;c:class;f:function;m:class_method;v:variables'
let tlist_golang_settings = 'golang;f:func;v:var;t:type'

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

nnoremap <silent> <F8> :TagbarToggle<CR>
nnoremap <silent> <F5> :ALEToggle<CR>


"打开所在文件夹或是终端
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
    silent exec "AsyncRun! -raw ". a:cmd .""
endfunction

" C C++ sh java的编译和运行
map <S-F10> :call CompileAndRun()<CR>

func! CompileAndRun()
    exec "w"
    if &filetype == 'c'                         "C and C++
        call AsRun("gcc -g % -o %< && ./%<")
    elseif &filetype == 'cpp'
        call AsRun("g++ -g % -o %< && ./%<")
    elseif &filetype == 'go'
        call AsRun("go run %")
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
" 将中文标点直接替换为英文标点 {{{
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
" }}}

""" {{{ For cscope, when I read the code  
"""
"""Add any cscope database in current directory
if filereadable("cscope.out")
    set noautochdir
    cs add cscope.out
""" else add the database pointed to by environment variable
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif

function! ReadCSCOPE()
    set noautochdir
endfunction

nmap <C-\>s :cs  find s <C-R>=expand("<cword>") <CR><CR>
nmap <C-\>g :cs  find g <C-R>=expand("<cword>") <CR><CR>
nmap <C-\>c :cs  find c <C-R>=expand("<cword>") <CR><CR>
nmap <C-\>t :cs  find t <C-R>=expand("<cword>") <CR><CR>
nmap <C-\>e :cs  find e <C-R>=expand("<cword>") <CR><CR>
nmap <C-\>f :cs  find f <C-R>=expand("<cword>") <CR><CR>
nmap <C-\>i :cs  find i <C-R>=expand("<cword>") <CR><CR>
nmap <C-\>d :cs  find d <C-R>=expand("<cword>") <CR><CR>

" }}}


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
" let g:syntastic_cpp_compiler = 'clang++'
" let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" map <C-F4> :mksession! ~/vim_session <cr> " Quick write session with F2
" map <C-F3> :source ~/vim_session <cr>     " And load session with F3

"markdown
let g:vim_markdown_folding_disabled        = 1 " 阻止Markdown折叠
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_math                    = 1
let g:vim_markdown_frontmatter             = 1

"YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
"let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_python_binary_path = '/usr/bin/python3'

" YouCompleteMe setup
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_filetype_blacklist={'unite': 1}
let g:ycm_min_num_of_chars_for_completion = 1
" nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>g :YcmCompleter GoToDefinition<CR>

autocmd FileType python set foldmethod=indent

" {{{ ALE 检查语法错误
" let &runtimepath.=',~/.vim/bundle/ale'
" "let g:ale_sign_error = '✗'
" "let g:ale_sign_warning = '⚡'
" "let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
" "let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" 对C/C++使用Clang进行语法检查
" 'python': ['pylint']
" \'python': ['pycodestyle', 'mypy']
" \'htmldjango': ['eslint'],
let g:ale_linters = {
            \'c': ['clang'],
            \'cpp': ['clangtidy','cpplint'],
            \'python': ['pycodestyle'],
            \'javascript': ['eslint'],
            \}

let g:ale_fixers = {'python': ['autopep8']}

let g:ale_cpp_gcc = 1
let ale_cpp_clang_options = '
    \ -std=c++14 -Wall
    \ `wx-config --cxxflags --libs std,aui`
    \ -I/usr/lib/wx/include/gtk2-unicode-3.0
    \ -I/usr/include/wx-3.0
    \ -D_FILE_OFFSET_BITS=64
    \ -D_FILE_OFFSET_BITS=64 -DWXUSINGDLL -D__WXGTK__ -pthread'

let g:ale_cpp_gcc_options = '
    \ -std=c++14 -Wall
    \`wx-config --cxxflags --libs std,aui`
    \ -I/usr/lib/wx/include/gtk2-unicode-3.0
    \ -I/usr/include/wx-3.0
    \ -D_FILE_OFFSET_BITS=64
    \ -D_FILE_OFFSET_BITS=64 -DWXUSINGDLL -D__WXGTK__ -pthread'
let g:ale_cpp_clangtidy_options = 'p ./build/'
let ale_c_build_dir='./build'

" C0111: 函数必须有注释, 暂时进行屏蔽
" C0326: 赋值号之前只能有一个空格, 我认为这样代码并不美观
" let g:ale_python_pyflakes_auto_pipenv=1
" let g:ale_python_pylint_options = '--disable=C0111'

let g:ale_echo_cursor = 1
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_format = '%s'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_enabled = 1
let g:ale_keep_list_window_open = 0
let g:ale_lint_delay = 200
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 0
let g:ale_lint_on_text_changed = 1
"let g:ale_linter_aliases = {}
"let g:ale_linters = {}
let g:ale_open_list = 0
let g:ale_set_highlights = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_set_signs = 1
let g:ale_sign_column_always = 0
let g:ale_sign_error = '💣'
let g:ale_sign_offset = 1000000
let g:ale_sign_warning = '🚩'
let g:ale_statusline_format = ['💣 %d', '🚩 %d', '']
let g:ale_warn_about_trailing_whitespace = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
"}}}


" {{{ UltiSnips setup
" 使用c-j 进行补全
" 使用c-b 可以由$1跳转至$2
" 使用c-z 可以由$2跳回$1
let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsListSnippets='<C-tab>'
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

    " \$HOME.'/.vim/plugged/vim-snippets',
let g:UltiSnipsSnippetDirectories=[
    \$HOME.'/.vim/plugged/vim-snippets/UltiSnips',
    \$HOME.'/.vim/UltiSnips']
let g:UltiSnipsEditSplit="vertical"

" 标准snip变量, 使用时不建议直接修改这里, 建议放在~/.vim/my.vim中进行
let g:snips_author="corvo"
let g:snips_projectname="default"
let g:ultisnips_python_style="sphinx"       " python注释风格

" 自定义: 周报相关的标签
let g:snip_zhoubao_sector="部门"
let g:snip_zhoubao_group="组"
let g:snip_zhoubao_author="姓名"

" 自定义: 邮件脚注
let g:snip_corp_group="部门"
let g:snip_corp_name="姓名"
let g:snip_corp_mail="邮箱"
let g:snip_corp_phone="手机号码"
" }}}

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

"{{{ For Tablur
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
"}}}

"For diff
if &diff
    highlight! link DiffText MatchParen
endif

" 折叠颜色设置
hi Folded ctermbg=7
hi Folded ctermbg=242
hi! link Folded SignColumn

" Doxygen 注释
"let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
"let g:DoxygenToolkit_paramTag_pre="@Param "
"let g:DoxygenToolkit_returnTag="@Returns   "
"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="corvo"
"let g:DoxygenToolkit_licenseTag="My own license"

" 在NERDTree中不显示某些后缀的文件
let NERDTreeIgnore = ['\.pyc$', '\.o$', 'pb2\.py$', 'pb2_grpc\.py$']

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

" 如果存在我自己的vim配置, 则进行加载
if glob('~/.vim/my.vim') != ""
    source ~/.vim/my.vim
endif

" Calendar-Vim
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" Used by winmanager {{{

let g:NERDTree_title = ""
let g:winManagerWindowLayout='NERDTree|TagList' "BufExplorer'

function! NERDTree_Start() 
    " exe 'NERDTree'
	exe 'q'
	exec 'NERDTreeToggle'
endfunction 

function! NERDTree_IsValid() 
	return 1 
endfunction
" }}}