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
 set nocompatible               " ���� vim Ϊ������ vi ģʽ

"�Զ���nerdtree 
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

"�涨bundle ·��" Add for go language filetype detect
set rtp+=$VIM/vimfiles/bundle/vundle/
"Ŀǰ����" set runtimepath+=~/.vim/bundle/gocode/vim
call vundle#rc('$VIM/vimfiles/bundle/')
" required!
Bundle 'gmarik/vundle'

"my bundle plugin"
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'auto_mkdir'"����û�е��ļ���"
Bundle  'git@github.com:suan/vim-instant-markdown.git'
"Bundle  'vim-scripts/vimwiki' 
"Bundle  'plasticboy/vim-markdown'
"Bundle 'mattn/zencoding-vim'
Bundle 'vim-scripts/Auto-Pairs'
"���������vimwikiʹ��
"Bundle 'vim-scripts/calendar.vim--Matsumoto'
"Bundle 'vim-scripts/The-NERD-Commenter'
Bundle 'git@github.com:motemen/git-vim.git'
"���벹ȫ���
"Bundle 'git@github.com:garbas/vim-snipmate.git'
"Bundle "MarcWeber/vim-addon-mw-utils"
"Bundle "tomtom/tlib_vim"

"Bundle 'git@github.com:vim-scripts/sessionman.vim.git'
"Bundle 'git@github.com:uguu-org/vim-matrix-screensaver.git'
Bundle 'vim-scripts/tComment'



filetype plugin indent on     " required!
"""""""""""""""""""""""""""""""""""""""""""""""""
"powerline ����

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


"�Զ�����python
"python��Ҫ����path·����<F12>����
"% ����ǰ�ļ�
"map <F12> :!python.exe %



"������а�
set clipboard+=unnamed

	"����
set smartindent
set autoindent
"<F10>�½���ǩ 
map <F10> <Esc>:tabnew<CR>
"""""""""""""""""""""""""""""""""""""""""""""""
set guitablabel=%N.%t  "�½���ǩ�������"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim7.1��windows�µı������á�By Huadong.Liu
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif
"����˵�����
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"���consle�������
language messages zh_CN.utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""
"��ݼ�"
"""""""""""""""""""""""""""""""""""""""""""""""""
"NERDTree
map <C-N> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} map <Leader>p :!start "C:\Program Files\Google\Chrome\Application\chrome.exe" "%:p"<CR>

"���ٴ�һ���ļ�
map <C-I>  :e e:\myself\some-words\1.md <CR>
"  �� <F5>���뵱ǰʱ��
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
 "nerdtree Ĭ��
cd d:\
"�������Դ�Сд
"set guifont=Courier\ New:h10 " ��������
"set guifont=Inconsolata:h12 " ��������
set ignorecase 
"ʼ����ʾ�к�
set nu!
" �����ļ�ʱ�����ݽ�ֹ������ʱ�ļ�
set nobackup
set noswapfile


"������ǰ��"
"set cursorcolumn

"������ǰ��
set cursorline

"����tab������
 set tabstop=4
"�����Ŀո���
 set shiftwidth=4
 set expandtab
"set terminal shell 256 colors
set t_Co=256
"�����ض���"
set cc=80
set showtabline=2
syntax on "����
set showcmd         " �����������ʾ�������������Щ
" �Զ��л���ǰĿ¼Ϊ��ǰ�ļ����ڵ�Ŀ¼
set autochdir
if has("gui_running") 
    set guioptions-=m " ���ز˵��� 
    set guioptions-=T " ���ع����� 
    set guioptions-=L " ������������ 
    set guioptions-=r " �����Ҳ������ 
    set guioptions-=b " ���صײ������� 
    set showtabline=1 " ����Tab�� 
endif 
"���"
autocmd GUIEnter * simalt ~x

au FocusLost * silent! up  "ʧȥ�����Զ�����"

let mapleader=","

"
" Omni Complete �Զ���ȫ
"-----------------------------------------------------------------
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete

"���ð����ĵ�Ϊ����
set helplang=cn  


" {{{ Winƽ̨�´���ȫ����� gvimfullscreen.dll
" Alt + Enter ȫ���л�
" Shift + t ���ʹ���͸����
" Shift + y �Ӵ󴰿�͸����
" Shift + r �л�Vim�Ƿ�������ǰ����ʾ
" Vim������ʱ���Զ�ʹ�õ�ǰ��ɫ�ı���ɫ��ȥ��Vim�İ�ɫ�߿�
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
    "ӳ�� Alt+Enter �л�ȫ��vim
    map <a-enter> <esc>:call ToggleFullScreen()<cr>
    "�л�Vim�Ƿ�����ǰ����ʾ
    nmap <s-r> <esc>:call SwitchVimTopMostMode()<cr>
    "����Vim����Ĳ�͸����
    nmap <s-t> <esc>:call SetAlpha(10)<cr>
    "����Vim�����͸����
    nmap <s-y> <esc>:call SetAlpha(-10)<cr>
    " Ĭ������͸��
    autocmd GUIEnter * call libcallnr(g:MyVimLib, 'SetAlpha', g:VimAlpha)
endif
" }}}

if has('win32')
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>    #�ǲ���ģʽ��F11ȫ��
imap <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>    #����ģʽ��F11ȫ��
endif

" �۵��ո����
set foldenable
set foldmethod=manual
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo') <cr>
"�����ϴ��۵�
au BufWinLeave *.* silent mkview
au BufWinLeave *.* silent! loadview

"����"
colorscheme solarized
"�ı������ɫֻ�ܷ������"
"����Ϊ���ж�����"
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=yellow guibg=#528bc5 guifg=yellow
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=blue guifg=white
"hi ColorColumn ctermbg=lightblue guibg=lightblue
"hi Cursor cterm=NONE ctermbg=darkred ctermfg=white guibg=red guifg=white
"�ı��к�������ɫ��ֻ���ܷŵ����
highlight LineNr guifg= yellow
 


"powweline setting
set encoding=utf-8
set guifont=Consolas\ for\ Powerline\ FixedD:h10
let g:Powerline_symbols="fancy"


autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} map <Leader>p :!start "C:\Program Files\Google\Chrome\Application\chrome.exe" "%:p"<CR>


