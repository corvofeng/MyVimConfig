" vim: foldmethod=marker foldcolumn=3
" 使用magic line, zR 打开全部折叠

"echomsg "Before gvimrc"

" set guifont=Source\ Code\ Pro\ Medium\ 11
set guifont=Fira\ Code\ Medium\ 11
" let g:Powerline_colorscheme='solarized256'
" colorscheme monokai
" colorscheme solarized
" colorscheme NeoSolarized
colorscheme one
" colorscheme monokai

let g:livepreview_previewer = 'okular'

" 设置以空格打开和关闭折叠
" nmap <space> @=((foldclosed(line('.'))<0)?'zc':'zo')<CR>

set foldenable
" set foldmethod=syntax
"set foldcolumn=2
" highlight Folded  guibg=#0A0A0A guifg=#76fd3d
" 折叠颜色设置
" highlight NonText guibg=#060606
hi Folded ctermbg=7
hi Folded ctermbg=242
hi! link Folded SignColumn 
let g:tlist_markdown_settings = 'markdown;h:Headlins'
let g:tlist_tex_settings = 'latex;l:labels;s:sections;t:subsections;u:subsubsections'

" 全屏
function! ToggleFullScreen()
    call system("wmctrl -r :ACTIVE: -b toggle,fullscreen")
endfunction
map <silent> <F7> :call ToggleFullScreen()<CR>

" Markdown的折叠
" https://stackoverflow.com/questions/3828606/vim-markdown-folding
function! MarkdownLevel()
    let curline = getline(v:lnum)
    if curline =~ '^# .*$'
        return ">1"
    endif
    if curline =~ '^## .*$'
        return ">2"
    endif
    if curline =~ '^### .*$'
        return ">3"
    endif
    if curline =~ '^#### .*$'
        return ">4"
    endif
    if curline =~ '^##### .*$'
        return ">5"
    endif
    if curline =~ '^###### .*$'
        return ">6"
    endif
    return "="
endfunction

function! MarkdownFoldText()
    let foldsize = v:foldend - v:foldstart
    return getline(v:foldstart).' ('.foldsize.' lines)'
endfunction

au BufEnter *.md setlocal foldexpr=MarkdownLevel()
au BufEnter *.md setlocal foldmethod=syntax
au BufEnter *.md setlocal foldtext=MarkdownFoldText()

autocmd FileType python set foldmethod=indent

" ALE 检查语法错误
" let &runtimepath.=',~/.vim/bundle/ale'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'


" 对C/C++使用Clang进行语法检查
let g:ale_linters = {'c': 'clang'}
let g:ale_linters = {
            \'cpp': ['clangtidy','cpplint'],
            \'python': ['pylint']
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
let g:ale_python_pylint_options = '--disable=C0111'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" gvim 添加语法检查, 曾经使用syntastic, 现已使用ALE
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:statline_syntastic = 0

" let g:syntastic_c_include_dirs = ['/usr/include/wx-3.0', 'include']

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" 添加对python的语法检查
" let g:syntastic_python_checkers=['pylint']
" let g:syntastic_python_pylint_args='--disable=C0111,R0903,C0301'

" convert spaces to tabs when reading file
" autocmd! bufreadpost * set noexpandtab | retab! 4

" convert tabs to spaces before writing file
" autocmd! bufwritepre * set expandtab | retab! 4

" convert spaces to tabs after writing file (to show guides again)
" autocmd! bufwritepost * set noexpandtab | retab! 4

let g:indentLine_color_gui = '#A4E57E'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

" 使用airline的顶栏buffer替换minibufexplore
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1 " 显示buffer编号
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

"set statusline+=%{fugitive#statusline()}
"set statusline+=%{exists('g:loaded_syntastic_plugin')?SyntasticStatuslineFlag():''}
highlight LeaderTab guifg=#666666
match LeaderTab /^\t/

set cursorline   " 突出显示当前行

" runtime! ftplugin/man.vim

set lines=35 columns=120

"复制和粘贴
vmap<C-c> "+y
vmap<C-x> "+c
vmap<C-v> <ESC>+p
imap<C-v> <C-r><C-o>+
nmap<C-v> "+p


" 禁止光标闪烁
""set gcr=a:block-blinkon0

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
