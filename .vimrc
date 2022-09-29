if has('gui_running')
  " 下面两行仅为占位使用；请填入你自己的字体
  set guifont=DejaVuSansMonoPowerline:h14
  " 不延迟加载菜单（需要放在下面的 source 语句之前）
  let do_syntax_sel_menu = 1
  let do_no_lazyload_menus = 1
endif

" 是否打开复杂字体
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#overflow_marker = '…'
let g:airline#extensions#tabline#show_tab_nr = 0
" 语法高亮
syntax on

" system clipboard would be used as the unnamed clipboard 
set clipboard=unnamed
" 关闭vim的提示音
set noerrorbells
set belloff=all
set enc=utf-8
source $VIMRUNTIME/vimrc_example.vim
set scrolloff=1
set nobackup
set tags=./tags;,tags,/usr/local/etc/systags
" 添加行号
set nu
set autochdir
set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/undodir
  if !isdirectory(&undodir)
    call mkdir(&undodir, 'p', 0700)
  endif
endif


if has('termguicolors') &&
      \($COLORTERM == 'truecolor' || $COLORTERM == '24bit')
  set termguicolors
endif
colorscheme gruvbox
set bg=dark

if has('mouse')
  if has('gui_running') || (&term =~ 'xterm' && !has('mac'))
    set mouse=a
  else
    set mouse=nvi
  endif
endif



if !has('gui_running')
  " 设置文本菜单
  if has('wildmenu')
    set wildmenu
    set cpoptions-=<
    set wildcharm=<C-Z>
    nnoremap <F10>      :emenu <C-Z>
    inoremap <F10> <C-O>:emenu <C-Z>
  endif
endif

if exists('g:loaded_minpac')
  " Minpac is loaded.
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Other plugins
  "call minpac#add('tpope/vim-eunuch')
  " 下方的指示条插件，需要配合powerline字体食用
  call minpac#add('vim-airline/vim-airline')
  " 主题
  call minpac#add('mbbill/desertEx')
  " 主题
  call minpac#add('morhetz/gruvbox')
  " 最近使用的文件，使用F10可以唤出菜单（在gui中不可用）
  call minpac#add('yegappan/mru')
  " 文件树,  e . to use 
  call minpac#add('preservim/nerdtree')
  " 根据ctags生成的文件显示信息，按F9可以使用
  "call minpac#add('majutsushi/tagbar')
  " 自动加括号去括号
  call minpac#add('tpope/vim-surround')
  " 撤回树，可以直接看到所有的历史编缉树UndotreeToggle https://github.com/mbbill/undotree
  call minpac#add('mbbill/undotree')
  " 模糊搜索，使用命令忘了
  call minpac#add('junegunn/fzf', {'do': {-> fzf#install()}})
  call minpac#add('junegunn/fzf.vim')
  " 用于自动生成ctags，不用自己去打命令了
  "call minpac#add('ludovicchabant/vim-gutentags')
  " 用于在写函数的时候，打左括号的时候直接在下方显示函数原型
  "call minpac#add('mbbill/echofunc')

  " 用于查找到一个函数名对应的调用处。在代码根目录指行cscope -b进行初始化。
  " 对应的命令包括：
  "g：查找一个符号的全局定义（global definition）
  "s：查找一个符号（symbol）的引用
  "d：查找被这个函数调用（called）的函数
  "c：查找调用（call）这个函数的函数
  "t：查找这个文本（text）字符串的所有出现位置
  "e：使用 egrep 搜索模式进行查找
  "f：按照文件（file）名查找（和 Vim 的 gf、<C-W>f 命令相似）
  "i：查找包含（include）这个文件的文件
  "a：查找一个符号被赋值（assigned）的地方
 " call minpac#add('adah1972/cscope_maps.vim')
 " call minpac#add('vim-scripts/autoload_cscope.vim')
  call minpac#add('tpope/vim-fugitive')


endif

if has('eval')
  " Minpac commands
  command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
  command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
  command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()
  " copy all matches to system clipboard
endif


if v:version >= 800
  packadd! editexisting
endif



" 停止搜索高亮的键映射
nnoremap <silent> <F2>      :nohlsearch<CR>
inoremap <silent> <F2> <C-O>:nohlsearch<CR>


"set expandtab shiftwidth=4 softtabstop=4 tabstop=4
au FileType c,cpp,objc  setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4 cinoptions=:0,g0,(0,w1
au FileType json        setlocal expandtab shiftwidth=2 softtabstop=2
au FileType vim         setlocal expandtab shiftwidth=2 softtabstop=2
au FileType js          setlocal expandtab shiftwidth=4 softtabstop=4
au FileType help        nnoremap <buffer> q <C-W>c
au BufRead /usr/include/*  call GnuIndent()


if has('autocmd')
  function! GnuIndent()
    setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
    setlocal shiftwidth=2
    setlocal tabstop=8
  endfunction
endif


" 开关 Tagbar 插件的键映射
nnoremap <F9>      :TagbarToggle<CR>
inoremap <F9> <C-O>:TagbarToggle<CR>


" 启用 man 插件
source $VIMRUNTIME/ftplugin/man.vim

" 替换光标下单词的键映射
nnoremap <Leader>v viw"0p
vnoremap <Leader>v "0p

set keywordprg=:Man



"复制搜索匹配结果到系统粘贴板，非常好用
" Copy matches of the last search to a register (default is the clipboard).
" Accepts a range (default is whole file).
" 'CopyMatches'   copy matches to clipboard (each match has \n added).
" 'CopyMatches x' copy matches to register x (clears register first).
" 'CopyMatches X' append matches to register x.
" We skip empty hits to ensure patterns using '\ze' don't loop forever.
command! -range=% -register CM call s:CopyMatches(<line1>, <line2>, '<reg>')
function! s:CopyMatches(line1, line2, reg)
  let hits = []
  for line in range(a:line1, a:line2)
    let txt = getline(line)
    let idx = match(txt, @/)
    while idx >= 0
      let end = matchend(txt, @/, idx)
      if end > idx
	call add(hits, strpart(txt, idx, end-idx))
      else
	let end += 1
      endif
      if @/[0] == '^'
        break  " to avoid false hits
      endif
      let idx = match(txt, @/, end)
    endwhile
  endfor
  if len(hits) > 0
    let reg = empty(a:reg) ? '+' : a:reg
    execute 'let @'.reg.' = join(hits, "\n") . "\n"'
  else
    echo 'No hits'
  endif
endfunction
