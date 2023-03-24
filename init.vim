let &t_ut=''
set autochdir
set number
set relativenumber
set cursorline
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:\¦\ ,trail:▫
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

"silent !mkdir -p ~/.config/nvim/tmp/backup
"silent !mkdir -p ~/.config/nvim/tmp/undo
"set backupdir=~/.config/nvim/tmp/backup,.
"set directory=~/.config/nvim/tmp/backup,.
"if has('persistent_undo')
"       set undofile
"       set undodir=~/.config/nvim/tmp/undo,.
"endif
set colorcolumn=80
set updatetime=500
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

let mapleader = " "

noremap H ^
noremap L $

nmap S :w<CR>
map Q :q<CR>
map J 5j
map K 5k
"map tt :NERDTreeToggle<CR>
map <LEADER>tt :CocCommand explorer<CR>
map <LEADER>l <C-w>l
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>h <C-w>h

map sh :set nosplitright<CR>:vsplit<CR>
map sl :set splitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>

noremap C ciw
noremap ? :noh<CR>

noremap <C-j> :bn<CR>
noremap <C-k> :bp<CR>
noremap <LEADER>cc :bd<CR>
noremap <LEADER>/ :Ag<CR>

noremap <up>    : res +5<CR>
noremap <down>  : res -5<CR>
noremap <left>  : vertical resize-5<CR>
noremap <right> : vertical resize+5<CR>

"noremap <C-k> 5<C-y>
"noremap <C-j> 5<C-e>

nnoremap Y y$

call plug#begin('~/.config/nvim/plugged')
"界面配置插件
Plug 'vim-airline/vim-airline'        " 命令行显示
Plug 'mhinz/vim-startify'             " 开机界面
Plug 'vim-airline/vim-airline-themes' " 命令行显示
"Plug 'connorholyday/vim-snazzy' " vim主题插件
"Plug 'ajmwagar/vim-deus'        " 主题插件
"Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'         " 更多图标插件
"Plug 'junegunn/seoul256.vim'
Plug 'sainnhe/everforest'


"文件浏览插件
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }    " 文件树插件
"Plug 'francoiscabrol/ranger.vim'                          " ranger插件
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                                   " 文件模糊查找
"Plug 'fszymanski/fzf-quickfix', {'on': 'Quickfix'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }


"码字相关插件"
Plug 'petertriho/nvim-scrollbar'
Plug 'tpope/vim-surround'                              " 改变包围符插件
"Plug 'godlygeek/tabular'                              " 文本对齐插件
Plug 'junegunn/vim-easy-align'                         " 一款文本对齐插件
Plug 'Chiel92/vim-autoformat'                          " 代码格式化插件
Plug 'gcmt/wildfire.vim'                              " enter 选中最近的文本区
Plug 'neoclide/coc.nvim', {'branch': 'release'}        " 代码补全插件
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"Plug 'scrooloose/nerdcommenter'                       " 代码注释插件
Plug 'jiangmiao/auto-pairs'                            " 括号补全插件
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] } " 查找工具
"Plug 'SirVer/ultisnips'                               " 代码块插件
Plug 'rhysd/clever-f.vim'
Plug 'ggandor/lightspeed.nvim'

"编辑显示插件
Plug 'liuchengxu/vista.vim'                               " tags查看插件
"Plug 'mbbill/undotree/'                                   " 撤销树
"Plug 'nathanaelkane/vim-indent-guides'                    " 缩进显示插件
"Plug 'RRethy/vim-illuminate'
"Plug 'jaxbot/semantic-highlight.vim'                      " 高亮插件
Plug 'ludovicchabant/vim-gutentags'


"代码相关插件
Plug 'dense-analysis/ale'                                         " 纠错插件


" Git相关插件
"Plug 'tpope/vim-fugitive'                                         " vim中调用git指令插件
"Plug 'mhinz/vim-signify'                                          " git显示修改插件
Plug 'airblade/vim-gitgutter'                                     " git显示修改插件
"Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] } " git忽略文件插件


call plug#end()

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `g[` and `g]` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
"nnoremap <silent><LEADER> K :call ShowDocumentation()<CR>
"
"function! ShowDocumentation()
"  if CocAction('hasProvider', 'hover')
"    call CocActionAsync('doHover')
"  else
"    call feedkeys('K', 'in')
"  endif
"endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


command! SvBuildIndex call CocRequest("svlangserver", 'workspace/executeCommand', {'command': 'systemverilog.build_index'})
command! -range SvReportHierarchy call CocRequest("svlangserver", 'workspace/executeCommand', {'command': 'systemverilog.report_hierarchy', 'arguments': [input('Module/interface: ', <range> == 0 ? "" : expand("<cword>"))]})


"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "simple"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='bubblegum'

"colorscheme gruvbox
"set background=dark

" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
"let g:seoul256_background = 234
"colo seoul256-light

"everforest
" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'medium'

" For better performance
let g:everforest_better_performance = 1

colorscheme everforest
"everforest

"colors deus
set termguicolors	
let g:indent_guides_enable_on_vim_startup = 1
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
let g:easy_align_delimiters = {
\ '>': { 'pattern': '>>\|=>\|>' },
\ '/': {
\     'pattern':         '//\+\|/\*\|\*/',
\     'delimiter_align': 'l',
\     'ignore_groups':   ['!Comment'] },
\ ']': {
\     'pattern':       '[[\]]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ ')': {
\     'pattern':       '[()]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ 'd': {
\     'pattern':      ' \(\S\+\s*[;=]\)\@=',
\     'left_margin':  0,
\     'right_margin': 0
\   },
\ ';': {
\     'pattern':       '[;]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ }

map <nowait> " <Plug>Lightspeed_omni_s
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '!'

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

let g:vista_update_on_text_changed = 1

autocmd FileType verilog let g:AutoPairs = {'(':')', '[':']', '{':'}','"':'"', '```':'```', '"""':'"""', "'''":"'''"}

map <LEADER>te :set splitright<CR>:vsplit<CR>:ter<CR>a
