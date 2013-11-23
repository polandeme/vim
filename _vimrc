set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("win32")
  let $VIMFILES = $VIM.'/vimfiles'
else
  let $VIMFILES = $HOME.'/.vim'
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 set nocompatible               " 设置 vim 为不兼容 vi 模式

"自动打开nerdtree 
"autocmd vimenter * NERDTree

inoremap jj <esc>:w<CR>

"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

"Bundle"
filetype off

"规定bundle 路径" Add for go language filetype detect
set rtp+=$VIM/vimfiles/bundle/vundle/
"目前不懂" set runtimepath+=~/.vim/bundle/gocode/vim
call vundle#rc('$VIM/vimfiles/bundle/')
" required!
Bundle 'gmarik/vundle'

"my bundle plugin"
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'auto_mkdir'"创建没有的文件夹"
Bundle  'git@github.com:suan/vim-instant-markdown.git'
"Bundle  'vim-scripts/vimwiki' 
"Bundle  'plasticboy/vim-markdown'
"Bundle 'mattn/zencoding-vim'
Bundle 'vim-scripts/Auto-Pairs'
"日历，结合vimwiki使用
"Bundle 'vim-scripts/calendar.vim--Matsumoto'
"Bundle 'vim-scripts/The-NERD-Commenter'
Bundle 'git@github.com:motemen/git-vim.git'
"代码补全插件
"Bundle 'git@github.com:garbas/vim-snipmate.git'
"Bundle "MarcWeber/vim-addon-mw-utils"
"Bundle "tomtom/tlib_vim"

"Bundle 'git@github.com:vim-scripts/sessionman.vim.git'
"Bundle 'git@github.com:uguu-org/vim-matrix-screensaver.git'
Bundle 'vim-scripts/tComment'



filetype plugin indent on     " required!
"""""""""""""""""""""""""""""""""""""""""""""""""
"powerline 设置

"let g:Powerline_symbols = 'fancy'
"set nocompatible
"set laststatus=2
"set encoding=utf-8
"""""""""""""""""""""""""
"nerd_commenter"
"""""""""""""""""""""
let g:NERDCustomDelimiters = {
    \ 'html':  { 'left': '<!--', 'right': '-->', 'leftAlt': '//' },
    \ 'xhtml': { 'left': '<!--', 'right': '-->', 'leftAlt': '//' },
    \ 'js':    { 'left': '//', 'leftAlt': '<!--', 'rightAlt': '-->'},
\ }
let NERD_html_alt_style=1
let NERD_xhtml_alt_style=1
let NERD_js_alt_style=1


"自动编译python
"python需要加入path路径用<F12>编译
"% 代表当前文件
"map <F12> :!python.exe %



"共享剪切板
set clipboard+=unnamed

	"缩进
set smartindent
set autoindent
"<F10>新建标签 
map <F10> <Esc>:tabnew<CR>
"""""""""""""""""""""""""""""""""""""""""""""""
set guitablabel=%N.%t  "新建标签添加数字"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim7.1在windows下的编码设置。By Huadong.Liu
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages zh_CN.utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""
"快捷键"
"""""""""""""""""""""""""""""""""""""""""""""""""
"NERDTree
map <C-N> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} map <Leader>p :!start "C:\Program Files\Google\Chrome\Application\chrome.exe" "%:p"<CR>

"快速打开一个文件
map <C-I>  :e e:\myself\some-words\1.md <CR>
"  按 <F5>插入当前时间
nnoremap <F5> "=strftime("%c")<CR>P
inoremap <F5> <C-R>=strftime("%c")<CR>
"""""""""""""""
"zendcoding"
"let g:user_zen_settings = {
""\  'lang' : 'ja',
""\  'html' : {
""\    'filters' : 'html',
""\    'indentation' : ' '
""\  },
""\  'perl' : {
""\    'indentation' : '  ',
""\    'aliases' : {
""\      'req' : "require '|'"
""\    },
""\    'snippets' : {
""\      'use' : "use strict\nuse warnings\n\n",
""\      'w' : "warn \"${cursor}\";",
""\    },
""\  },
""\  'php' : {
""\    'extends' : 'html',
""\    'filters' : 'html,c',
""\  },
""\  'css' : {
""\    'filters' : 'fc',
""\  },
""\  'javascript' : {
""\    'snippets' : {
""\      'jq' : "$(function() {\n\t${cursor}${child}\n});",
""\      'jq:each' : "$.each(arr, function(index, item)\n\t${child}\n});",
""\      'fn' : "(function() {\n\t${cursor}\n})();",
""\      'tm' : "setTimeout(function() {\n\t${cursor}\n}, 100);",
""\    },
""\  },
""\ 'java' : {
""\  'indentation' : '    ',
""\  'snippets' : {
""\   'main': "public static void main(String[] args) {\n\t|\n}",
""\   'println': "System.out.println(\"|\");",
""\   'class': "public class | {\n}\n",
""\  },
""\ },
""\}




""""""""""""""""""""""""""""""""
"powerline"
"set encoding=utf-8
set laststatus=2
"set guifont=Consolas\ for\ Powerline
"let g:Powerline_symbols = 'fancy'

set encoding=utf-8
set guifont=Consolas\ for\ Powerline\ FixedD:h9
let g:Powerline_symbols="fancy"


"""""""""""""""""""""""""""""""""""""""""""""""
 "nerdtree 默认
cd d:\
"搜索忽略大小写
"set guifont=Courier\ New:h10 " 设置字体
"set guifont=Inconsolata:h12 " 设置字体
set ignorecase 
"始终显示行号
set nu!
" 覆盖文件时不备份禁止生成临时文件
set nobackup
set noswapfile


"高亮当前列"
"set cursorcolumn

"高亮当前行
set cursorline

"设置tab键长度
 set tabstop=4
"缩进的空格数
 set shiftwidth=4
 set expandtab
"set terminal shell 256 colors
set t_Co=256
"高亮特定列"
set cc=80
set showtabline=2
syntax on "高亮
set showcmd         " 输入的命令显示出来，看的清楚些
" 自动切换当前目录为当前文件所在的目录
set autochdir
if has("gui_running") 
    set guioptions-=m " 隐藏菜单栏 
    set guioptions-=T " 隐藏工具栏 
    set guioptions-=L " 隐藏左侧滚动条 
    set guioptions-=r " 隐藏右侧滚动条 
    set guioptions-=b " 隐藏底部滚动条 
    set showtabline=1 " 隐藏Tab栏 
endif 
"最大化"
autocmd GUIEnter * simalt ~x

au FocusLost * silent! up  "失去焦点自动保存"

let mapleader=","

"
" Omni Complete 自动补全
"-----------------------------------------------------------------
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete

"设置帮助文档为中文
set helplang=cn  


" {{{ Win平台下窗口全屏组件 gvimfullscreen.dll
" Alt + Enter 全屏切换
" Shift + t 降低窗口透明度
" Shift + y 加大窗口透明度
" Shift + r 切换Vim是否总在最前面显示
" Vim启动的时候自动使用当前颜色的背景色以去除Vim的白色边框
if has('gui_running') && has('gui_win32') && has('libcall')
    let g:MyVimLib = 'gvimfullscreen.dll'
    function! ToggleFullScreen()
        call libcall(g:MyVimLib, 'ToggleFullScreen', 1)
    endfunction

    let g:VimAlpha = 250
    function! SetAlpha(alpha)
        let g:VimAlpha = g:VimAlpha + a:alpha
        if g:VimAlpha < 180
            let g:VimAlpha = 180
        endif
        if g:VimAlpha > 255
            let g:VimAlpha = 255
        endif
        call libcall(g:MyVimLib, 'SetAlpha', g:VimAlpha)
    endfunction

    let g:VimTopMost = 0
    function! SwitchVimTopMostMode()
        if g:VimTopMost == 0
            let g:VimTopMost = 1
        else
            let g:VimTopMost = 0
        endif
        call libcall(g:MyVimLib, 'EnableTopMost', g:VimTopMost)
    endfunction
    "映射 Alt+Enter 切换全屏vim
    map <a-enter> <esc>:call ToggleFullScreen()<cr>
    "切换Vim是否在最前面显示
    nmap <s-r> <esc>:call SwitchVimTopMostMode()<cr>
    "增加Vim窗体的不透明度
    nmap <s-t> <esc>:call SetAlpha(10)<cr>
    "增加Vim窗体的透明度
    nmap <s-y> <esc>:call SetAlpha(-10)<cr>
    " 默认设置透明
    autocmd GUIEnter * call libcallnr(g:MyVimLib, 'SetAlpha', g:VimAlpha)
endif
" }}}

if has('win32')
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>    #非插入模式下F11全屏
imap <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>    #插入模式下F11全屏
endif

" 折叠空格控制
set foldenable
set foldmethod=manual
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo') <cr>
"保存上次折叠
au BufWinLeave *.* silent mkview
au BufWinLeave *.* silent! loadview

"主题"
colorscheme solarized
"改变高亮颜色只能放在最后？"
"依次为行列对齐线"
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=yellow guibg=#528bc5 guifg=yellow
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=blue guifg=white
"hi ColorColumn ctermbg=lightblue guibg=lightblue
"hi Cursor cterm=NONE ctermbg=darkred ctermfg=white guibg=red guifg=white
"改变行号数字颜色，只能能放到最后？
highlight LineNr guifg= yellow
 


"powweline setting
set encoding=utf-8
set guifont=Consolas\ for\ Powerline\ FixedD:h10
let g:Powerline_symbols="fancy"


autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} map <Leader>p :!start "C:\Program Files\Google\Chrome\Application\chrome.exe" "%:p"<CR>


