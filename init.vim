inoremap jk <ESC>
set encoding=UTF-8 " let mapleader="\<Space>"
let mapleader="'"
syntax on
set number
set hlsearch
set ignorecase
set incsearch
" set autoindent
" set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" set spell spelllang=en_us


" 使用vim-plug管理插件
call plug#begin('~/.config/nvim/plugged')

" 主题
Plug 'morhetz/gruvbox'
" Plug 'NLKNguyen/papercolor-theme'
Plug 'rust-lang/rust.vim'
" 文件夹相关
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons' " 增加图标
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " 文件夹高亮图标
" rust相关
Plug 'racer-rust/vim-racer'
" common lisp dev environment
" Plug 'vlime/vlime', {'rtp': 'vim/'}
" doc文件生成 <leader>d => 生成doc  Tab S-Tab => 切换TODO位置
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
" 搜索插件 C-p 开启搜索
Plug 'ctrlpvim/ctrlp.vim'
" 状态栏 airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" git相关
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim' " git lens
Plug 'tpope/vim-fugitive'

" 代码调试
" 安装 :CocInstall coc-snippets
" 查看 :CocList extensions
" 服务 :CocInfo
"
" tailwindcss安装->  CocInstall coc-tailwindcss
" 插件 -> coc-prettier | coc-snippets
" rust -> coc-rls
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 字符串包裹
" ysiw 包裹单词
" yss 包裹行
" cs 改变
" ds 删除
Plug 'tpope/vim-surround'

" eslint
" Plug 'eslint/eslint'
Plug 'vim-syntastic/syntastic'

" 缩进对齐
Plug 'Yggdroot/indentLine'
" Plug 'lukas-reineke/indent-blankline.nvim'

" snippets
Plug 'honza/vim-snippets'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate' " 代码片段 使用tab补全

" auto close tag
Plug 'alvan/vim-closetag'

" haskell 安装需要按官网
Plug 'neovimhaskell/haskell-vim'

" 模糊搜索
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" 代码跳转
Plug 'pechorin/any-jump.vim'

" javascript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" 色彩
" Plug 'norcalli/nvim-colorizer.lua'

" 等号对其 强迫症福利
" :EasyAlign *=
Plug 'junegunn/vim-easy-align'

" 自动import
Plug 'hrsh7th/nvim-compe'
" latex
" 需要配合安装:CocInstall coc-vimtex 提供语法提示
Plug 'lervag/vimtex'

" markdown语法高亮和快捷键
" zr 打开下一级
" zR 打开所有折叠
" zm 折叠当前
" zM 折叠所有
" :Toc 显示目录
" [[  ]]跳转标题
" 使用起来有````丢失的情况，难用
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
"
" toml 语法高亮
Plug 'cespare/vim-toml', { 'branch': 'main' }
call plug#end()

" gruvbox主题色
colorscheme gruvbox" gruvbox PaperColor
set background=dark "dark or light

" =================================
" 键位映射
" =================================
"vnoremap <D-c> y
" 选中情况下复制
vnoremap <C-c> "+y
nmap <leader>o o<ESC>
nmap <leader>O O<ESC>
" 下一页，buffer翻页
map gn :bn<cr>
" 上一页，buffer翻页
map gp :bp<cr>
" 关闭当前buffer
map <leader>w :bd<cr>


" nerdtree 设置
let NERDTreeShowHidden=1
" let NERDTreeWinSize=20

" ctrlp 设置
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git' " 忽略文件夹

" 状态栏设置
let g:airline#extensions#tabline#enabled = 1 " 打开tabline
let g:airline_powerline_fonts = 1 " 字体设置
" 字体设置
set guifont=DroidSansMono\ Nerd\ Font:h16

" syntastic 配置
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" ===============================
" coc.nvim 配置
" ===============================
" :CocInstall coc-eslint

" Use <c-m> to trigger completion. 代码补全
" if has('nvim')
"   inoremap <silent><expr> <c-m> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif

" Highlight the symbol and its references when holding the cursor. cursor高亮
autocmd CursorHold * silent call CocActionAsync('highlight')
" Formatting selected code. 格式化
" xmap <C-f>  <Plug>(coc-format-selected)
" nmap <C-f>  <Plug>(coc-format-selected)
imap <M-S-f> <ESC>:CocCommand prettier.formatFile<CR>
nmap <M-S-f> <ESC>:CocCommand prettier.formatFile<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" tab选择
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
" 补全
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" 回车自动选中第一个选项
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                              \: "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" [g ]g 切换warning、error之类的诊断信息
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
" 跳转代码
" 跳转定义
nmap <silent> gd <Plug>(coc-definition)
" 跳转类型定义
nmap <silent> gy <Plug>(coc-type-definition)
" 跳转实现
nmap <silent> gi <Plug>(coc-implementation)
" 跳转引用
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
" K调用查看文档注释
" 文档显示滚动 coc显示了一个popup，用c-j / c-k 滚动
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction



" Formatting selected code.
" 选中的代码格式化
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" 快速选中一个片段 <leader>aap 快速选中当前段
" 比如执行格式化、添加注释、应用hints
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
" 应用代码 action
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
" 自动修复 quick fix
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" 浮窗滚动
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(2) : "\<C-j>"
  nnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-k>"
  inoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-j>"
  vnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-k>"
endif
" Mappings for CoCList
" Show all diagnostics.
" 显示诊断
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" 管理插件
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
" 显示命令
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" ===============================
"


" snippets
let g:snipMate = { 'snippet_version' : 1 }

" coc-tailwindcss

" rust配置 
let g:rustfmt_autosave = 1


" rust-racer配置
au FileType rust nmap <buffer> gd <Plug>(rust-def)
au FileType rust nmap <buffer> gs <Plug>(rust-def-split)
au FileType rust nmap <buffer> gx <Plug>(rust-def-vertical)
au FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)


" fzf配置 模糊搜索
" 需要装the_silver_searcher 和fzf
" brew install the_silver_searcher
" brew install fzf
" export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
" nmap <D-S-f> :Ag<space>
nmap <C-f> :Ag<space>


" git/blamer配置
let g:blamer_enabled = 1

" nvim配置
" inoremap <Enter> <M-Enter>
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
" 使用ctrl + s保存
imap <C-s> <Esc>:w<CR>

" indentLine配置
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_leadingSpaceEnabled = 0 " 有点难看，先禁用
let g:indentLine_leadingSpaceChar = '·'
" 这两个没有生效，indentLine_setConceal=0生效了
" let g:vim_markdown_conceal = 0
" let g:vim_markdown_conceal_code_blocks = 0
" au FileType markdown let g:indentLine_setConceal= 0
let g:indentLine_fileTypeExclude = ['markdown', 'latex']


" latex配置
"
let g:tex_flavor = 'xelatex' " 使用latex风格
let g:vimtex_quickfix_mod = 0 " 自动打开错误提示

" 需要安装skim.app
let g:vimtex_view_general_viewer
\ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'

" This adds a callback hook that updates Skim after compilation
" 这个命令deprecated了
" let g:vimtex_compiler_callback_hooks = ['UpdateSkim']
" 忽略编译警告
let g:vimtex_quickfix_open_on_warning = 0

function! UpdateSkim(status)
if !a:status | return | endif

let l:out = b:vimtex.out()
let l:tex = expand('%:p')
let l:cmd = [g:vimtex_view_general_viewer, '-r']

if !empty(system('pgrep Skim'))
call extend(l:cmd, ['-g'])
endif

if has('nvim')
call jobstart(l:cmd + [line('.'), l:out, l:tex])
elseif has('job')
call job_start(l:cmd + [line('.'), l:out, l:tex])
else
call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
endif
endfunction

" -shell-escape方便在命令中调用python的代码格式化工具
"  相关的latex宏包markdown、minted
let g:vimtex_compiler_latexmk = { 'executable': 'latexmk', 'options': ['-xelatex', '-file-line-error', '-synctex=1', '-interaction=nonstopmode', '-shell-escape'] }
let g:syntastic_tex_checkers = ['lacheck', 'chktex', 'language_check']
" 关掉vimtex conceal
let g:vimtex_syntax_conceal_default = 0
let g:vimtex_view_automatic = 0



" 自动编译 latexmk会检测tex文件变更后自动执行编译，这里的命令没有用
" autocmd FileType tex imap <buffer> <leader>s <ESC>:w<CR>\ll
" autocmd FileType tex nmap <buffer> <leader>s :w<CR>\ll
" 查看效果 等待compile completed就可以查看文件了
autocmd FileType tex nmap <buffer> <leader>v \lv
" lacheck有问题
function! LatexCloseCheck()
  execute ':SyntasticToggleMode'
endfunction
autocmd FileType tex call LatexCloseCheck()

let NERDTreeIgnore=['\.aux$', '\.fls$', '\.fdb_latexmk', '\.synctex.gz', '\.synctex(busy)', '\.xdv', 'missfont.log', '.*-.*.log$', '\.pdf$', '\.DS_Store$', '_.*-.*[[path]]', '\.lua$', '\.out$', '\.in$']


" vim-markdown配置
" let g:vim_markdown_conceal = 0
