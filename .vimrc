
   set nocompatible              " 去除VI一致性,必须
   filetype off                  " 必须

   " 设置包括vundle和初始化相关的runtime path
   set rtp+=~/.vim/bundle/Vundle.vim
   call vundle#begin()
   " 另一种选择, 指定一个vundle安装插件的路径
   "call vundle#begin('~/some/path/here')

   " 让vundle管理插件版本,必须
   Plugin 'VundleVim/Vundle.vim'

   " 以下范例用来支持不同格式的插件安装.
   " 请将安装插件的命令放在vundle#begin和vundle#end之间.
   " Github上的插件
   " 格式为 Plugin '用户名/插件仓库名'

   Plugin 'Yggdroot/LeaderF'
   Plugin 'sickill/vim-monokai'
   Plugin 'preservim/nerdtree'
   Plugin 'Mark'
   Plugin 'tpope/vim-commentary'
   Plugin 'terryma/vim-smooth-scroll'
   Plugin 'nanotech/jellybeans.vim'



   " 你的所有插件需要在下面这行之前
   call vundle#end()            " 必须
   filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
   " 忽视插件改变缩进,可以使用以下替代:
   "filetype plugin on
   "
   " 简要帮助文档
   " :PluginList       - 列出所有已配置的插件
   " :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
   " :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
   " :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
   "
   " 查阅 :h vundle 获取更多细节和wiki以及FAQ
   " 将你自己对非插件片段放在这行之后
   "
   "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 隐藏GVIM菜单及设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "," "定义<leader>键
set nocompatible    "设置不兼容原始vi模式
filetype on     "设置开启文件类型侦测
filetype plugin on  "加载对应文件类型插件
set noeb        "关闭错误提示
syntax enable       "开启语法高亮功能
syntax on       "自动语法高亮
set t_Co=256        "开启256色支持
set cmdheight=2     "设置命令行高度
set showcmd     "select模式下显示选中的行数
set ruler       "总是显示光标的位置
set laststatus=2    "总是显示状态栏
set number      "开启行号显示
set ignorecase "搜索不区分大小写"


set whichwrap+=<,>,h,l  "设置光标键跨行
set virtualedit=block,onemore   "允许光标出现在最后一个字符的后面
set guioptions=acg
" set guioptions-=e
set scrolloff=16
" set scroll=1
"set noundofile
map <BS> gcc
vmap <BS> gc


set mousehide "hide mouse when key
" set mouse=h  "disable mouse
set mouse=
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
set clipboard=unnamed
autocmd GUIEnter * simalt ~x   "全屏
set nowrapscan
set ignorecase

" save exit position
autocmd BufReadPost *
\ if line("'\"")>0&&line("'\"")<=line("$") |
\ exe "normal g'\"" |
\ endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu        "vim自身命令行模式智能补全
set completeopt-=preview    "补全时不显示窗口，只显示补全列表

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"代码折叠
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=syntax       "设置基于语法进行代码折叠
set nofoldenable            "关闭代码折叠


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进与排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent      "设置自动缩进
set cindent     "设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0 "设置使用C/C++语言的具体缩进方式
set smartindent     "智能选择对齐方式
filetype indent on  "自适应不同语言的智能缩进
set expandtab       "将制表符扩展为空格
set tabstop=4       "设置编辑时制表符所占的空格数
set shiftwidth=4    "设置格式化时制表符占用的空格数
set softtabstop=4       "设置4个空格为制表符
set smarttab        "在行和段开始处使用制表符
"set nowrap     "禁止折行
set backspace=2     "使用回车键正常处理indent.eol,start等



"自动补全
function! AutoPair(open, close)        
    let line = getline('.')        
    if col('.') > strlen(line) || line[col('.') - 1] == ' '
                return a:open.a:close."\<ESC>i"
        else
                return a:open
        endif
endf
function! ClosePair(char)        
    if getline('.')[col('.') - 1] == a:char                
                return "\<Right>"
        else
                return a:char
        endif
endf
function! SamePair(char)        
    let line = getline('.')        
    if col('.') > strlen(line) || line[col('.') - 1] == ' '
                return a:char.a:char."\<ESC>i"
        elseif line[col('.') - 1] == a:char               
                 return "\<Right>"
        else
                return a:char
        endif
endf

inoremap ( <c-r>=AutoPair('(', ')')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { <c-r>=AutoPair('{', '}')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ <c-r>=AutoPair('[', ']')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " <c-r>=SamePair('"')<CR>
inoremap ' <c-r>=SamePair("'")<CR>
inoremap ` <c-r>=SamePair('`')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup        "设置不备份
set noswapfile      "禁止生成临时文件
set autoread        "文件在vim之外修改过，自动重新载入
set autowrite       "设置自动保存
set confirm         "在处理未保存或只读文件时，弹出确认

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set the menu & the message to English
set helplang=cn
"set langmenu=en_US
"let $LANG = 'en_US'
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 主题设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme monokai
colorscheme jellybeans
syntax on
set hlsearch
set guifont=Consolas:h12:cANSI:qDRAFT
set cursorline      "高亮显示当前行
set nocursorcolumn
highlight CursorLine   cterm=NONE ctermbg=DarkGrey ctermfg=none guibg=white guifg=white
" set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
" highlight TrailingSpace ctermbg=red guibg=red
" highlight Search term=bold cterm=underline ctermfg=Red ctermbg=black  guifg=Red




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plug设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用快捷键设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap mm <leader>m
map <F7> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
nmap <silent> ,nf :NERDTreeFind<CR>
let NERDTreeIgnore=['\.pyc','\~$','\.swp']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim配置root,f4
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:autotagsdir = $HOME . "/.autotags/byhash"


fu! s:PathHash(val)
    retu substitute(system("sha1sum", a:val), " .*", "", "")
endf

fu! g:GetProjectRootHash()
    let a:rootDir = ""
    " find autotags subdir
    if !exists("g:autotagsdir")
        let g:autotagsdir = $HOME . "/.autotags/byhash"
    endif

    let l:dir = getcwd()
    wh l:dir != "/"
        if getftype(g:autotagsdir . '/' . s:PathHash(l:dir)) == "dir"
            let a:autotagsroot = g:autotagsdir . '/' . s:PathHash(l:dir)
            " echomsg "autotags root exist: " . a:autotagsroot
            break
        endif
        " get parent directory
        let l:dir = fnamemodify(l:dir, ":p:h:h")
    endw

    if !exists("a:autotagsroot") ||
                \ !isdirectory(a:autotagsroot) ||
                \ !isdirectory(a:autotagsroot . '/origin') ||
                \ !isdirectory(resolve(a:autotagsroot . '/origin'))
        " echomsg "Invalid Autotags' root directory!"
        retu
    en

    retu a:autotagsroot
endf

fu! g:GetProjectRoot(...)
    let a:hashRoot = a:0 ? a:1 : g:GetProjectRootHash()
    if empty(a:hashRoot)
        retu
    en

    retu resolve(a:hashRoot . "/origin")
endf

fu! g:GetWorkfile()
    let l:hashRoot = g:GetProjectRootHash() 
    if empty(l:hashRoot)
        retu getcwd()
    en

    retu resolve(l:hashRoot)
endf

if !hasmapto('AutotagsUpdate')
    map <F4> :call AutotagsUpdate()<CR>
endif

fu! s:PathHash(val)
    retu substitute(system("sha1sum", a:val), " .*", "", "")
endf

fu! g:GetProjectRootHash()
    let l:rootDir = ""
    " find autotags subdir
    if !exists("g:autotagsdir")
        let g:autotagsdir = $HOME . "/.autotags/byhash"
    endif

    let l:dir = getcwd()
    wh l:dir != "/"
        if getftype(g:autotagsdir . '/' . s:PathHash(l:dir)) == "dir"
            let l:autotagsroot = g:autotagsdir . '/' . s:PathHash(l:dir)
            echomsg "autotags root exist: " . l:autotagsroot
            break
        endif
        " get parent directory
        let l:dir = fnamemodify(l:dir, ":p:h:h")
    endw

    if !exists("l:autotagsroot") ||
                \ !isdirectory(l:autotagsroot) ||
                \ !isdirectory(l:autotagsroot . '/origin') ||
                \ !isdirectory(resolve(l:autotagsroot . '/origin'))
        " echomsg "Invalid Autotags' root directory!"
        retu 
    en

    retu l:autotagsroot
endf


fun! s:AutotagsInit()
    let l:dir = getcwd()
    while l:dir != "/"
        if getftype(g:autotagsdir . '/' . s:PathHash(l:dir)) == "dir"
            let s:autotags_subdir = g:autotagsdir . '/' . s:PathHash(l:dir)
            echomsg "autotags subdir exist: " . s:autotags_subdir
            break
        endif
        " get parent directory
        let l:dir = fnamemodify(l:dir, ":p:h:h")
    endwhile

    if exists("s:autotags_subdir")
        call s:AutotagsReload(s:autotags_subdir)
    " else
    "     call s:AutotagsSearchLoadTags()
    endif
endfun

fun! s:AutotagsIsLoaded()
    if !exists("s:autotags_subdir") ||
       \ !isdirectory(s:autotags_subdir) ||
       \ !isdirectory(s:autotags_subdir . '/origin')
        return 0
    else
        return 1
    endif
endfun


fun! s:AutotagsValidatePath(path)
    if a:path == ""
        echomsg "no directory specified"
        return ""
    endif

    let l:fullpath = fnamemodify(a:path, ":p")

    if !isdirectory(l:fullpath)
        echomsg "directory " . l:fullpath . " doesn't exist"
        return ""
    endif

    let l:fullpath = substitute(l:fullpath, "\/$", "", "")
    return l:fullpath
endfun

fun! s:AutotagsAskPath(hint, msg)
    call inputsave()
    let l:path = input(a:msg, a:hint, "file")
    call inputrestore()
    echomsg " "

    return s:AutotagsValidatePath(l:path)
endfun

fun! AutotagsUpdate()
    if s:AutotagsIsLoaded() == 0
        let l:sourcedir = s:AutotagsAskPath(getcwd(), "Select project root: ")
        if l:sourcedir == ""
            return
        endif
    else
        let l:sourcedir = resolve(s:autotags_subdir . "/origin")
    endif

    call AutotagsUpdatePath(l:sourcedir)
endfun


fun! s:AutotagsMakeTagsDir(sourcedir)
    let l:tagsdir = g:autotagsdir . '/' . s:PathHash(a:sourcedir)
    if !isdirectory(l:tagsdir) && !mkdir(l:tagsdir, "p")
        echomsg "cannot create dir " . l:tagsdir
        return ""
    endif
" xiehs commentary 
    call system("ln -s '" . a:sourcedir . "' '" . l:tagsdir . "/origin'") "
    " call system("mkdir '" . a:sourcedir . "' '" . l:tagsdir . "/origin'") "
    return l:tagsdir
endfun

fun! s:AutotagsMakeRootTagsDir(sourcedir)
    let l:tagsdir = g:autotagsdir . '/' . s:PathHash(a:sourcedir)
    if !isdirectory(l:tagsdir) && !mkdir(l:tagsdir, "p")
        echomsg "cannot create dir " . l:tagsdir
        return ""
    endif
" xiehs commentary 
    " call system("ln -s '" . a:sourcedir . "' '" . l:tagsdir . "/origin'") "
    call system("mkdir '" . a:sourcedir . "' '" . l:tagsdir . "/origin'") "
    return l:tagsdir
endfun


"happy added start
fu! AutotagsSubdirExist(subdir)
    let l:exist = 0

    let l:tagsdir = s:autotags_subdir
    for l:entry in split(system("ls " . l:tagsdir), "\n")
        if stridx(l:entry, "include_") == 0
            let l:path = l:tagsdir . "/" . l:entry
            if getftype(l:path) == 'link' && isdirectory(l:path)
                let l:subtagdir = resolve(l:path)
                let l:srcdir = resolve(l:path . "/origin")
                if a:subdir == l:srcdir
                    echomsg "subdir tags exist !"
                    let l:exist = 1
                    brea
                en
            en
        en
    endfo

    retu l:exist
endf


fun! AutotagsAddPath(sourcedir)
    if s:AutotagsIsLoaded() == 0
        echomsg "call AutotagsUpdate first"
        return
    endif

    let l:sourcedir = s:AutotagsValidatePath(a:sourcedir)
    if l:sourcedir == "" ||
       \ l:sourcedir == resolve(s:autotags_subdir . "/origin")
        return
    endif

    let l:tagsdir = s:AutotagsMakeTagsDir(l:sourcedir)
    if l:tagsdir == ""
        return
    endif

    " call s:AutotagsGenerate(l:sourcedir, l:tagsdir)

    call system("ln -s '" . l:tagsdir . "' '" . s:autotags_subdir .
        \ "/include_" . s:PathHash(l:sourcedir) . "'")
    call s:AutotagsReload(s:autotags_subdir)
endfun

" Add dependent source directory, tags for that directory will be loaded to
" current project
fun! AutotagsAdd()
    if s:AutotagsIsLoaded() == 0
        call s:AutotagsUpdate()
    endif

    echomsg "autotags  subdif=" s:autotags_subdir
    let l:sourcedir = s:AutotagsAskPath(getcwd(), "Select additional directory: ")
    if l:sourcedir == ""
        return
    endif
    echomsg "sourcedir=" l:sourcedir
    if AutotagsSubdirExist(l:sourcedir) == 1 " happy added
        retu
    en

    call AutotagsAddPath(l:sourcedir)
endfun


if !hasmapto('AutotagsAdd')
    map <F3> :call AutotagsAdd()<CR>
endif

" fun! s:AutotagsGenerateGlobal()
"     echomsg "updating global ctags " . g:autotags_global . " for " .
"         \ g:autotags_ctags_global_include
"     echomsg system("nice -15 " . g:autotags_ctags_exe . " " .
"         \ g:autotags_ctags_opts . " -f '" . g:autotags_global . "' " .
"         \ g:autotags_ctags_global_include)
" endfun

" fun! s:AutotagsGenerate(sourcedir, tagsdir)
"     let l:ctagsfile = a:tagsdir . "/tags"
"     echomsg "updating " . a:tagsdir ." for " . a:sourcedir
"     " echomsg "updating ctags " . l:ctagsfile ." for " . a:sourcedir
"     call system("nice -15 " . g:autotags_ctags_exe . " -R " .
"         \ g:autotags_ctags_opts .
"         \ " '--languages=" . g:autotags_ctags_languages .
"         \ "' '--langmap=" . g:autotags_ctags_langmap .
"         \ "' -f '" . l:ctagsfile . "' '" . a:sourcedir ."'")

"     let l:cscopedir = a:tagsdir
"     " echomsg "updating cscopedb in " . l:cscopedir ." for " . a:sourcedir
"     call system("cd '" . l:cscopedir . "' && nice -15 find '" . a:sourcedir . "' " .
"         \ "-not -regex '.*\\.git.*' -regex '" . s:cscope_file_pattern . "' -fprint cscope.files")
"     if getfsize(l:cscopedir . "/cscope.files") > 0
"         call system("cd '" . l:cscopedir . "' && nice -15 " . g:autotags_cscope_exe . " -b -k -q")
"     endif
" endfun

fun! s:AutotagsReload(tagsdir)
    "set nocsverb
    "exe "cs kill -1"
    "if g:autotags_no_global == 0 && filereadable(g:autotags_global)
    "    exe "set tags=" . g:autotags_global
    "else
    "    exe "set tags="
    "endif

    ""happy modified start
    "if g:autotags_gen_full == 0 
    "    let l:subExist = 0
    "    for l:entry in split(system("ls " . a:tagsdir), "\n")
    "        if stridx(l:entry, "include_") == 0
    "            let l:path = a:tagsdir . "/" . l:entry
    "            if getftype(l:path) == 'link' && isdirectory(l:path)
    "                let l:subExist = 1
    "                call s:AutotagsLoad(l:path)
    "            endif
    "        endif
    "    endfor

    "    if l:subExist == 0
    "        call s:AutotagsLoad(a:tagsdir)
    "    en
    "else
    "    call s:AutotagsLoad(a:tagsdir)
    "endif
    ""happy modified end
endfun

fun! AutotagsUpdatePath(sourcedir)
    if s:AutotagsIsLoaded() == 0
        let l:sourcedir = s:AutotagsValidatePath(a:sourcedir)
        if l:sourcedir == ""
            return
        endif

        let s:autotags_subdir = s:AutotagsMakeRootTagsDir(l:sourcedir)
        if s:autotags_subdir == ""
            unlet s:autotags_subdir
            return
        endif
        "happy modified start
        " if g:autotags_gen_full == 0 

        " else
        "     if g:autotags_no_global == 0 && !filereadable(g:autotags_global)
        "         call s:AutotagsGenerateGlobal()
        "     endif
        "     call s:AutotagsGenerate(l:sourcedir, s:autotags_subdir)
        "     call s:AutotagsReload(s:autotags_subdir)
        " endif
        "happy modified end
    else
        ""happy modified start
        "if g:autotags_gen_full == 0 
        "    call s:AutotagsGenerateSubdir(s:autotags_subdir)
        "else
        "    let l:sourcedir = resolve(s:autotags_subdir . "/origin")
        "    call s:AutotagsGenerate(l:sourcedir, s:autotags_subdir)
        "endif
        "happy modified end
        call s:AutotagsReload(s:autotags_subdir)
    endif
endfun


call s:AutotagsInit()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" leaderf设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:Lf_PopupPalette = {
    \  'light': {
    \      'Lf_hl_match': {
    \                'gui': 'NONE',
    \                'font': 'NONE',
    \                'guifg': 'NONE',
    \                'guibg': '#303136',
    \                'cterm': 'NONE',
    \                'ctermfg': 'NONE',
    \                'ctermbg': '236'
    \              },
    \      'Lf_hl_cursorline': {
    \                'gui': 'NONE',
    \                'font': 'NONE',
    \                'guifg': 'NONE',
    \                'guibg': '#303136',
    \                'cterm': 'NONE',
    \                'ctermfg': 'NONE',
    \                'ctermbg': '236'
    \              },
    \      },
    \  }

" Show icons, icons are shown by default
let g:Lf_ShowDevIcons = 0
" For GUI vim, the icon font can be specify like this, for example
"let g:Lf_DevIconsFont = "DroidSansMono Nerd Font Mono"
" If needs
set ambiwidth=double


" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_FollowLinks = 1 " allow soft link
let g:Lf_GtagsSkipSymlink = ''
let g:Lf_WorkingDirectory = g:GetWorkfile()
echomsg "working dif " g:Lf_WorkingDirectory
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
"let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
"noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <space>m :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg -L --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-H> :<C-U><C-R>=printf("Leaderf! rg -Le %s ", expand("<cword>"))<CR>
noremap <S-F> :<C-U><C-R>=printf("Leaderf! rg -Lw %s ", expand("<cword>"))<CR>
" noremap <S-F> :<C-U><C-R>=printf("Leaderf! rg -Lw ")<CR>
nmap <C-F> :<C-U><C-R>=printf("Leaderf! rg -Lw ")<CR>
" noremap <S-F> :printf("Leaderf! rg -Lw ")<CR>

" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -LF -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
"noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <C-]> :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

