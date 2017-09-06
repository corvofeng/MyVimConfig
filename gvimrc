set guifont=Source\ Code\ Pro\ Medium\ 10
let g:Powerline_colorscheme='solarized256'
" colorscheme monokai
 colorscheme solarized


let g:livepreview_previewer = 'okular'

" 设置以空格打开和关闭折叠
nmap <space> @=((foldclosed(line('.'))<0)?'zc':'zo')<CR>

set foldenable
set foldmethod=syntax
"set foldcolumn=2
"highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#76fd3d

" ALE 检查语法错误
" let &runtimepath.=',~/.vim/bundle/ale'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
" let g:syntastic_c_include_dirs = ['/usr/include/wx-3.0', 'include']


" 对C/C++使用Clang进行语法检查
" let g:ale_linters = {'c': 'clang'}
"let g:ale_linters = {'cpp': ['clang', 'gcc', 'clangtidy', 'cppcheck', 'cpplint']}
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

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Enable ShowMarks 标记将会被显示出来
let showmarks_enable = 1

" Some ListChars won't use
set list 
set listchars=tab:▸-,trail:·,extends:>,precedes:<
hi NonText ctermfg=7 guifg=gray

"set listchars=tab:»·,trail:·
"set listchars=tab:┊\ 
"set listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×

" vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

" gvim 添加语法检查
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:statline_syntastic = 0


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" 添加对python的语法检查
let g:syntastic_python_checkers=['pylint']
let g:syntastic_python_pylint_args='--disable=C0111,R0903,C0301'


" convert spaces to tabs when reading file
"autocmd! bufreadpost * set noexpandtab | retab! 4

" convert tabs to spaces before writing file
"autocmd! bufwritepre * set expandtab | retab! 4

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

"set statusline+=%{fugitive#statusline()}
set statusline+=%{exists('g:loaded_syntastic_plugin')?SyntasticStatuslineFlag():''}
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

" 总是显示状态栏
set laststatus=2

