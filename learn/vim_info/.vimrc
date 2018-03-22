" vim:shiftwidth=2:ts=8:et
colorscheme koehler
set nocompatible
syntax on
"set enc=gb2312
set nobackup

set autoindent
set cindent
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4
set clipboard=unnamed
"set paste

set backspace=indent,eol,start
set history=50
set showcmd
set number
set incsearch
set ignorecase
set hlsearch
set mouse=a
set wildmenu
set makeprg=~/.vim/maker\ %:p
" 折叠
":set fdm=indent
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview
filetype plugin indent on
set completeopt=longest,menu

" pydiction
"let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'
"defalut g:pydiction_menu_height == 15
"let g:pydiction_menu_height = 20
"pydiction 1.2 python auto complete

set fileencoding=uft-8 "使用utf-8或gbk打开文件
set helplang=cn             "帮助系统设置为中文
" 状态行支持显示文件编码
set laststatus=2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
if has('multi_byte') && v:version > 601
  if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    set ambiwidth=double
  endif
endif

" visul 模式下的* #搜索
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  else
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

"Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" taglist
let Tlist_Sort_Type="name"
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"let Tlist_Use_Right_Window = 1
nmap <silent> <F2>      :TlistToggle <CR>
imap <silent> <F2>      <C-O>:TlistToggle <CR>

"nmap <silent> <F3>      :nohlsearch<CR>
"imap <silent> <F3>      <C-O>:nohlsearch<CR>
nmap <silent> <F3>      :Project<CR>
imap <silent> <F3>      <C-O>:Project<CR>

nmap <silent> <F4>      :set nu <CR>
imap <silent> <F4>      <C-O>:set nu <CR>
nmap <silent> <F4><F4>  :set nonu <CR>
imap <silent> <F4><F4>  <C-O>:set nonu <CR>

nmap <F5>      :update<CR>:A<CR>
imap <F5>      <Esc>:update<CR>:A<CR>

"map  <F6>       :set mouse=a<CR>
"imap <F6>       <Esc>:set mouse=a<CR>
"map  <F6><F6>   :set mouse=<CR>
"imap <F6><F6>   <Esc>:set mouse=<CR>

"Doxygen
let g:DoxygenToolkit_authorName="Weigang Li <dimens@gmail.com>"
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:DoxygenToolkit_versionString="1.0"
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="---------------------------------------------------------------"
let g:DoxygenToolkit_licenseTag="Copyright (C) 2014 ."
map  <F9><F9>   :set syntax=cpp.doxygen<CR>
imap <F9><F9>   <C-O>:set syntax=cpp.doxygen<CR>
map  <F9>a      :DoxAuthor<CR>
imap <F9>a      <C-O>:DoxAuthor<CR>
map  <F9>l      :DoxLic<CR>
imap <F9>l      <C-O>:DoxLic<CR>
map  <F9>f      :Dox<CR>
imap <F9>f      <C-O>:Dox<CR>
map  <F9>b      :DoxBlock<CR>
imap <F9>b      <C-O>:DoxBlock<CR>
map  <F9>c      O/** */<Left><Left>
imap <F9>c      <Esc>O/** */<Left><Left>

map  <F10>      :set wrap<CR>
imap <F10>      <C-O>:set wrap<CR>
map  <F10><F10> :set nowrap<CR>
imap <F10><F10> <C-O>:set nowrap<CR>

map  <F10>u     :call SetEncodingUTF8() <CR>
imap <F10>u     <Esc>:call SetEncodingUTF8() <CR>
map  <F10>g        :call SetEncodingGBK() <CR>
imap <F10>g     <ESC>:call SetEncodingGBK() <CR>

let g:BASH_AuthorName='Weigang Li'
let g:BASH_Email='dimens@gmail.com'
let g:BASH_Company='Copyright (C) 2014'

"Make Quickfix
nmap <F11>    :cp<CR>
imap <F11>    <C-O>:cp<CR>
nmap <F12>    :cn<CR>
imap <F12>    <C-O>:cn<CR>

let mapleader=','
let g:C_MapLeader=','

"cscope
nmap <leader>ss :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>sg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>sc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>st :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>se :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <leader>si :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>si :cs find i <C-R>=expand("%:t")<CR><CR>
nmap <leader>sd :cs find d <C-R>=expand("<cword>")<CR><CR>

"hlsearch
nmap <leader>hl      :nohlsearch<CR>
imap <leader>hl      <C-O>:nohlsearch<CR>

"save & quit
nmap <leader>a  :confirm qa<CR>
nmap <leader>d  :confirm bd<CR>
nmap <leader>q  :confirm q<CR>
nmap <leader>w  :w<CR>
imap <leader>w  <C-O>:w<CR>

"make
nmap <leader>m :update<CR>:make<CR>
imap <leader>m <Esc>:update<CR>:make<CR>
nmap <leader>o :copen<CR>
nmap <leader>k :cclose<CR>

" Key mappings to ease browsing long lines
noremap  <Down>      gj
noremap  <Up>        gk
inoremap <Down> <C-O>gj
inoremap <Up>   <C-O>gk

"Smart way to move btw. windows
"nmap <C-o> <C-W>o
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

"buffer
nmap <leader>,  :bn<CR>
nmap <leader>.  :bp<CR>

"minibuffer
"解决关闭一个文件后,剩下的文件无语法高亮问题
"let g:miniBufExplForceSyntaxEnable = 1
"let g:miniBufExplMapWindowNavArrows = 1

if has('autocmd')
  function! SetFileEncodings(encodings)
    let b:my_fileencodings_bak=&fileencodings
    let &fileencodings=a:encodings
  endfunction

  function! RestoreFileEncodings()
    let &fileencodings=b:my_fileencodings_bak
    unlet b:my_fileencodings_bak
  endfunction

  function! CheckFileEncoding()
    if &modified && &fileencoding != ''
      exec 'e! ++enc=' . &fileencoding
    endif
  endfunction

  function! ConvertHtmlEncoding(encoding)
    if a:encoding ==? 'gb2312'
      return 'gbk'              " GB2312 imprecisely means GBK in HTML
    elseif a:encoding ==? 'iso-8859-1'
      return 'latin1'           " The canonical encoding name in Vim
    elseif a:encoding ==? 'utf8'
      return 'utf-8'            " Other encoding aliases should follow here
    else
      return a:encoding
    endif
  endfunction

  function! DetectHtmlEncoding()
    if &filetype != 'html'
      return
    endif
    normal m`
    normal gg
    if search('\c<meta http-equiv=\("\?\)Content-Type\1 content="text/html; charset=[-A-Za-z0-9_]\+">') != 0
      let reg_bak=@"
      normal y$
      let charset=matchstr(@", 'text/html; charset=\zs[-A-Za-z0-9_]\+')
      let charset=ConvertHtmlEncoding(charset)
      normal ``
      let @"=reg_bak
      if &fileencodings == ''
        let auto_encodings=',' . &encoding . ','
      else
        let auto_encodings=',' . &fileencodings . ','
      endif
      if charset !=? &fileencoding &&
            \(auto_encodings =~ ',' . &fileencoding . ',' || &fileencoding == '')
        silent! exec 'e ++enc=' . charset
      endif
    else
      normal ``
    endif
  endfunction

  function! GnuIndent()
    setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
    setlocal shiftwidth=2
    setlocal tabstop=8
  endfunction

  function! RemoveTrailingSpace()
    if $VIM_HATE_SPACE_ERRORS != '0' &&
          \(&filetype == 'c' || &filetype == 'cpp' || &filetype == 'vim')
      normal m`
      silent! :%s/\s\+$//e
      normal ``
    endif
  endfunction

  " Highlight space errors in C/C++ source files (Vim tip #935)
  if $VIM_HATE_SPACE_ERRORS != '0'
    let c_space_errors=1
  endif

  ".vimrc自动reload
  au BufWritePost .vimrc source ~/.vimrc

  au FileType cpp setlocal syntax=cpp.doxygen
  au FileType c setlocal syntax=c.doxygen

  " Automatically find scripts in the autoload directory
"  au FuncUndefined * exec 'runtime autoload/' . expand('<afile>') . '.vim'

  " Detect charset encoding in an HTML file
  au BufReadPost *.htm* nested      call DetectHtmlEncoding()

  " Recognize standard C++ headers
  au BufEnter /usr/include/c++/*    setf cpp
  au BufEnter /usr/include/g++-3/*  setf cpp

  " Setting for files following the GNU coding standard
  au BufEnter /usr/*                call GnuIndent()

  " Remove trailing spaces for C/C++ and Vim files
  au BufWritePre *                  call RemoveTrailingSpace()


endif

set path+=/usr/include/c++/,../inc/,../include,

"project
let g:proj_flags="imstn"
"------------------------------------------------------------------------------
"获取当前路径的上一级的路径
function! GET_UP_PATH(dir)
    let pos=len(a:dir)-1
    while pos>0
        if (a:dir[pos]=="/" )
            return  strpart(a:dir,0,pos)
        endif
        let pos=pos-1
    endwhile
    return  ""
endfunction

"设置相关tags
function! s:SET_TAGS()
    let dir = expand("%:p:h") "获得源文件路径
    "在路径上递归向上查找tags文件
    while dir!=""
        if findfile("tags",dir ) !=""
            "找到了就加入到tags
            exec "set tags+=" . dir . "/tags"
        endif
        "得到上级路径
        let dir=GET_UP_PATH(dir)
    endwhile
endfunction

autocmd BufEnter * call s:SET_TAGS()

"------------------------------------------------------------------------------

" 打开文件时，按照 viminfo 保存的上次关闭时的光标位置重新设置光标
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif


"==acp自动完成插件配置================================

let g:acp_completeoptPreview = 0 "关闭预览

"==配置omni全能补全====================================

let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std"]
set completeopt=longest,menu "关闭自动补全时的预览窗口

"==BufExplorer配置======================================

let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber

"au BufWrite *.cpp,*.h,*.c,*.rl,*.def call system("ctags -a  -f ~/.vim/tags/systags --extra=+q " . expand("%:p"))
"au BufWrite *.py call system("ctags -a -f ~/.vim/tags/pytags --extra=+q " . expand("%:p"))

au BufRead,BufNewFile *.cpp,*.h,*.c setlocal tags+=~/.vim/tags/systags
au BufRead,BufNewFile *.py setlocal tags+=~/.vim/tags/pytags

set tags+=./tags;${HOME}

"set tags+=~/.vim/systags
"set tags+=~/.vim/pytags
