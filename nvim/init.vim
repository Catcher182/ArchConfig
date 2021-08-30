" ===
" === 首次使用时自动加载
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if empty(glob('~/.config/nvim/plugged/wildfire.vim/autoload/wildfire.vim'))
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'

let g:mkdp_browser = 'chromium'
let g:mkdp_browserfunc = 'open '


" ====================
" === 编辑器设置 ===
" ====================
" ===
" === 系统
" ===
"set clipboard=unnamedplus
let &t_ut=''
set autochdir


" ===
" === 编辑器行为
" ===
set exrc
set secure
set number
set relativenumber
set cursorline
set hidden
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
"silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
set colorcolumn=100
set updatetime=100
set virtualedit=block

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === 终端行为
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>


" ===
" === 基本映射
" ===
" 设置 <LEADER> 为 <SPACE>
let mapleader=" "

" 保存 退出
noremap Q :q<CR>
noremap <C-q> :qa<CR>
noremap S :w<CR>

" 随时打开vimrc文件
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>
noremap <LEADER>rv :e .nvimrc<CR>

" 使 Y 复制到行尾
nnoremap Y y$

" 复制到系统剪贴板
vnoremap Y "+y


" Delete find pair
nnoremap dy d%

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" 相邻的重复词
noremap<LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
nnoremap <LEADER>tt :%s/    /\t/g
vnoremap <LEADER>tt :s/    /\t/g

" 折叠式
noremap <silent> <LEADER>o za



" ===
" === Window 管理
" ===
" 使用'\'+新箭头键在窗口周围移动光标
noremap ;w <C-w>w
noremap ;k <C-w>k
noremap ;j <C-w>j
noremap ;h <C-w>h
noremap ;l <C-w>l
noremap ;o <C-w>o

" 禁用默认的s键
noremap s <nop>

" 将屏幕拆分为上（水平）、下（水平）、左（垂直）、右（垂直）
noremap sh :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sl :set splitbelow<CR>:split<CR>
noremap sj :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sk :set splitright<CR>:vsplit<CR>

" 使用箭头键调整拆分大小
noremap <LEADER><up> :res +5<CR>
noremap <LEADER><down> :res -5<CR>
noremap <LEADER><left> :vertical resize-5<CR>
noremap <LEADER><right> :vertical resize+5<CR>


" 旋转屏幕
noremap <C-left> <C-w>b<C-w>K
noremap <C-right> <C-w>b<C-w>H

" 按 <SPACE> + q 关闭当前窗口下方的窗口
noremap <LEADER>q <C-w>j:q<CR>


" ===
" === 标签管理
" ===
" 用 tx 创建一个新标签
noremap tx :tabe<CR>
noremap tX :tab split<CR>
" 使用 th 和 tl 移动选项卡
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
" 使用 tmh 和 tml 移动选项卡
noremap tmh :-tabmove<CR>
noremap tml :+tabmove<CR>


" ===
" === Markdown设置
" ===
" Snippets
source ~/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell


" ===
" === 其他有用的东西
" ===
" 打开st
nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>

" 打开终端
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>

" 按空格键两次可跳转到下一个“<++>”并对其进行编辑
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

"使用<space>sc进行拼写检查
noremap <LEADER>sc :set spell!<CR>

" 按`更改大小写（而不是~）
noremap ` ~


" 自动将目录更改为当前目录
autocmd BufEnter * silent! lcd %:p:h

" 打开figlet
noremap fi :r !figlet

" 查找并替换
noremap \s :%s//g<left><left>


" 按f10以显示hlgroup
function! SynGroup()
	let l:s = synID(line('.'), col('.'), 1)
	echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
map <F10> :call SynGroup()<CR>

" 编译功能
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc


" ===
" === 使用 Vim-Plug 安装插件
" ===

call plug#begin('~/.config/nvim/plugged')


" Treesitter
" 目标既是提供一种简单易用的方法来使用 Neovim 中的 tree-sitter 界面，并提供一些基本功能
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'

" 主题
Plug 'theniceboy/nvim-deus'
Plug 'arcticicestudio/nord-vim'
Plug 'tomasr/molokai'
Plug 'rakr/vim-one'

" 状态行
" 另一个优雅的 vim 状态栏，从 space-vim 中提取。
Plug 'liuchengxu/eleline.vim'
" Vim 状态行的滚动条
Plug 'ojroques/vim-scrollstatus'

" General Highlighter
" 最快的 (Neo)Vim 插件，用于异步显示文件中的颜色
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
" Vim 插件，用于自动突出显示光标下当前单词的其他用途
Plug 'RRethy/vim-illuminate'

" 文件导航
Plug 'junegunn/fzf.vim'
"一个高效的模糊查找器，有助于快速定位文件、缓冲区、mrus、gtags 等
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
"跳转到任何定义和引用
Plug 'pechorin/any-jump.vim'
"Rnvimr 是一个 NeoVim 插件，它允许您在浮动窗口中使用 Ranger
Plug 'kevinhwang91/rnvimr'
"当您打开文件或目录时，Rooter 会将工作目录更改为项目根目录
Plug 'airblade/vim-rooter'


" 标签列表
Plug 'liuchengxu/vista.vim'

" Debugger
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wellle/tmux-complete.vim'


" 代码片段
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'



" 撤销树
Plug 'mbbill/undotree'

" Git
Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'
Plug 'kdheepak/lazygit.nvim'

" Autoformat
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'


" HTML, CSS, JavaScript, Typescript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'neoclide/jsonc.vim'
Plug 'othree/html5.vim'
Plug 'alvan/vim-closetag'
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'pantharshit00/vim-prisma'

" Go
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }

" Python
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }


" Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'


" 编辑器增强
" 成对括号
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi'
" 在 <space>cn 中注释一行
Plug 'tomtom/tcomment_vim'
" 输入 ysiw' 用 '' 包裹单词或输入 cs" ' 将 ''word'' 更改为 `word`
Plug 'tpope/vim-surround'
" 在可视模式下，键入 k' 以选择 '' 中的所有文本，或键入 k) k] k} kp
Plug 'gcmt/wildfire.vim'
" da= 删除后面的内容 =
Plug 'junegunn/vim-after-object'
" ga, 或 :Tabularize <regex> 对齐
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
Plug 'svermeulen/vim-subversive'
Plug 'rhysd/clever-f.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Yggdroot/indentLine'


" Find & Replace
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }

" Mini Vim-APP
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'


" 其他视觉增强
Plug 'luochen1990/rainbow'
Plug 'mg979/vim-xtabline'
Plug 'ryanoasis/vim-devicons'
Plug 'wincent/terminus'

" Other useful utilities
" 做类似的事情：sudowrite
Plug 'lambdalisue/suda.vim' 

Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}

call plug#end()













set re=0

" experimental
set lazyredraw
"set regexpengine=1


" ===
" === 装扮我的 vim
" ===
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"set background=dark
"let ayucolor="mirage"
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"let g:one_allow_italics = 1

"color dracula
"color one
color deus
"color nord
"let ayucolor="light"
"color ayu
"color xcodelighthc
"set background=light
"set cursorcolumn

hi NonText ctermfg=gray guifg=grey10
"hi SpecialKey ctermfg=blue guifg=grey70

" ===================== 插件设置开始 =====================


" ===
" === eleline.vim
" ===
let g:airline_powerline_fonts = 0


" ==
" == GitGutter
" ==
" let g:gitgutter_signs = 0
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
" autocmd BufWritePost *GitGutter
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap H :GitGutterPreviewHunk<CR>
nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
nnoremap <LEADER>g= :GitGutterNextHunk<CR>


" ===
" === coc.nvim
" ===
let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-diagnostic',
	\ 'coc-docker',
	\ 'coc-eslint',
	\ 'coc-explorer',
	\ 'coc-flutter-tools',
	\ 'coc-gitignore',
	\ 'coc-html',
	\ 'coc-import-cost',
	\ 'coc-jest',
	\ 'coc-json',
	\ 'coc-marketplace',
	\ 'coc-lists',
	\ 'coc-prettier',
	\ 'coc-prisma',
	\ 'coc-pyright',
	\ 'coc-python',
	\ 'coc-snippets',
	\ 'coc-sourcekit',
	\ 'coc-stylelint',
	\ 'coc-syntax',
	\ 'coc-tailwindcss',
	\ 'coc-tasks',
	\ 'coc-translator',
	\ 'coc-tslint-plugin',
	\ 'coc-tsserver',
	\ 'coc-vetur',
	\ 'coc-vimlsp',
	\ 'coc-yaml',
	\ 'coc-yank']
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"<c-space> 调出补全
inoremap <silent><expr> <c-space> coc#refresh()

" 使用 `[g` 和 `]g` 导航诊断
" 使用 `:CocDiagnostics` 获取位置列表中当前缓冲区的所有诊断信息
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo 代码导航。
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


function! Show_documentation()
	call CocActionAsync('highlight')
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
nnoremap <LEADER>h :call Show_documentation()<CR>


nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
nnoremap <c-c> :CocCommand<CR>
" Text Objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)


" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap tt :CocCommand explorer<CR>

" coc-translator
nmap ts <Plug>(coc-translator-p)

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w
noremap <silent> <leader>ts :CocList tasks<CR>

" coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-e> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-e>'
let g:coc_snippet_prev = '<c-n>'
imap <C-e> <Plug>(coc-snippets-expand-jump)
let g:snips_author = 'David Chen'
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc


" ===
" === vim-instant-markdown
" ===
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
let g:instant_markdown_autoscroll = 1


" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>
let g:table_mode_cell_text_object_i_map = 'k<Bar>'


" ===
" === FZF
" ===
set rtp+=/usr/local/opt/fzf
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
set rtp+=/home/david/.linuxbrew/opt/fzf
nnoremap <c-p> :Leaderf file<CR>
	noremap <silent> <C-f> :Rg<CR>
noremap <silent> <C-h> :History<CR>
noremap <silent> <C-w> :Buffers<CR>
noremap <leader>; :History:<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

noremap <c-d> :BD<CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }


" ===
" === Leaderf
" ===
" let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewCode = 1
let g:Lf_ShowHidden = 1
let g:Lf_ShowDevIcons = 1
let g:Lf_CommandMap = {
\   '<C-k>': ['<C-u>'],
\   '<C-j>': ['<C-e>'],
\   '<C-]>': ['<C-v>'],
\   '<C-p>': ['<C-n>'],
\}
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WildIgnore = {
        \ 'dir': ['.git', 'vendor', 'node_modules'],
        \ 'file': ['__vim_project_root', 'class']
        \}
let g:Lf_UseMemoryCache = 0
let g:Lf_UseCache = 0




" ===
" === Undotree
" ===
noremap <leader><F6> :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> u <plug>UndotreeNextState
	nmap <buffer> e <plug>UndotreePreviousState
	nmap <buffer> U 5<plug>UndotreeNextState
	nmap <buffer> E 5<plug>UndotreePreviousState
endfunc



" ===
" === vim-visual-multi
" ===
let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_maps                       = {}
let g:VM_custom_motions             = {'n': 'h', 'i': 'l', 'u': 'k', 'e': 'j', 'N': '0', 'I': '$', 'h': 'e'}
let g:VM_maps['i']                  = 'k'
let g:VM_maps['I']                  = 'K'
let g:VM_maps['Find Under']         = '<C-k>'
let g:VM_maps['Find Subword Under'] = '<C-k>'
let g:VM_maps['Find Next']          = ''
let g:VM_maps['Find Prev']          = ''
let g:VM_maps['Remove Region']      = 'q'
let g:VM_maps['Skip Region']        = '<c-n>'
let g:VM_maps["Undo"]               = 'l'
let g:VM_maps["Redo"]               = '<C-r>'

" ===
" === Bullets.vim
" ===
" let g:bullets_set_mappings = 0
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'scratch'
			\]


" ===
" === Vista.vim
" ===
noremap <LEADER>v :Vista!!<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }


let g:scrollstatus_size = 15

" ===
" === fzf-gitignore
" ===
noremap <LEADER>gi :FzfGitignore<CR>




" ===
" === vim-go
" ===
let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0


" ===
" === AutoFormat
" ===
augroup autoformat_settings
	" autocmd FileType bzl AutoFormatBuffer buildifier
	" autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
	" autocmd FileType dart AutoFormatBuffer dartfmt
	" autocmd FileType go AutoFormatBuffer gofmt
	" autocmd FileType gn AutoFormatBuffer gn
	" autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
	autocmd FileType java AutoFormatBuffer google-java-format
	" autocmd FileType python AutoFormatBuffer yapf
	" Alternative: autocmd FileType python AutoFormatBuffer autopep8
	" autocmd FileType rust AutoFormatBuffer rustfmt
	" autocmd FileType vue AutoFormatBuffer prettier
augroup END



" ===
" === vim-easymotion
" ===
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 0
let g:EasyMotion_smartcase = 1



" ===
" === jsx
" ===
let g:vim_jsx_pretty_colorful_config = 1


" ===
" === tabular
" ===
vmap ga :Tabularize /


" ===
" === vim-after-object
" ===
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')


" ===
" === rainbow
" ===
let g:rainbow_active = 1


" ===
" === xtabline
" ===
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
noremap to :XTabCycleMode<CR>
noremap \p :echo expand('%:p')<CR>



" ===
" === suda.vim
" ===
cnoreabbrev sudowrite w suda://%
cnoreabbrev sw w suda://%


" ===
" === vimspector
" ===
let g:vimspector_enable_mappings = 'HUMAN'
function! s:read_template_into_buffer(template)
	" has to be a function to avoid the extra space fzf#run insers otherwise
	execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
			\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
			\   'down': 20,
			\   'sink': function('<sid>read_template_into_buffer')
			\ })
" noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=☛ texthl=Normal
sign define vimspectorBPDisabled text=☞ texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad

" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval



sign define vimspectorPC text=🔶 texthl=SpellBad



" ===
" === vim-markdown-toc
" ===
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'



" ===
" === rnvimr
" ===
" 让 Ranger 取代 Netrw 成为文件浏览器
let g:rnvimr_enable_ex = 1
"选择文件后隐藏 Ranger
let g:rnvimr_enable_picker = 1
" 禁用浮动窗口的边框
let g:rnvimr_draw_border = 0
" 将 CursorLine 链接到浮动窗口中的 RnvimrNormal 高亮显示
highlight link RnvimrNormal CursorLine
nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': &columns,
            \ 'height': &lines,
            \ 'col': 0,
            \ 'row': 0,
            \ 'style': 'minimal' }
let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]






" ===
" === vim-subversive
" ===
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)


" ===
" === vim-illuminate
" ===
let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl


" ===
" === vim-rooter
" ===
let g:rooter_patterns = ['__vim_project_root', '.git/']
let g:rooter_silent_chdir = 1


" ===
" === AsyncRun
" ===
noremap gp :AsyncRun git push<CR>


" ===
" === AsyncTasks
" ===
let g:asyncrun_open = 6



" ===
" === tcomment_vim
" ===
nnoremap ci cl
let g:tcomment_textobject_inlinecomment = ''
nmap <LEADER>cn g>c
vmap <LEADER>cn g>
nmap <LEADER>cu g<c
vmap <LEADER>cu g<


" ===
" === vim-move
" ===
let g:move_key_modifier = 'C'


" ===
" === any-jump
" ===
nnoremap <LEADER>aj :AnyJump<CR>
let g:any_jump_window_width_ratio  = 0.8
let g:any_jump_window_height_ratio = 0.9


" ===
" === typescript-vim
" ===
let g:typescript_ignore_browserwords = 1


" ===
" === Agit
" ===
nnoremap <LEADER>gl :Agit<CR>
let g:agit_no_default_mappings = 1


" ===
" === nvim-treesitter
" ===
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"typescript", "dart", "java"},     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
EOF


" ===
" === lazygit.nvim
" ===
noremap <c-g> :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 1.0 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " for neovim-remote support


" ===================== End of Plugin Settings =====================

" ===
" === Terminal Colors
" ===

let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'



