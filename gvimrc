set guifont=Source\ Code\ Pro\ Medium\ 11
let g:Powerline_colorscheme='solarized256'


set foldenable
set foldmethod=syntax
"set foldcolumn=2
"highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#76fd3d

" ALE 检查语法错误
let &runtimepath.=',~/.vim/bundle/ale'
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Some ListChars won't use
"set list 
"set listchars=tab:»·,trail:·
"set listchars=tab:┊\ 
"set listchars=tab:\ \ ,trail:·,eol:¶,extends:>,precedes:<
"set listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×

" vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

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

set statusline+=%{fugitive#statusline()}
highlight LeaderTab guifg=#666666
match LeaderTab /^\t/

set cursorline   " 突出显示当前行
set laststatus=2 " 显示状态栏

" runtime! ftplugin/man.vim

set lines=35 columns=90 

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


