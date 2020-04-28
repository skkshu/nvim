" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Credits:
"   @theniceboy
"   @skkshu

" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/plugged/'))
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ====================
" === Editor Setup ===
" ====================
set fileencodings=utf8,cp936,gb18030,big5

" use <C-c> to use calculator
inoremap <C-c> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

" %%a
inoremap <C-a> <ESC>%%a

" ===
" === now
" ===
" set writedelay=3
set autoread
noremap <F3> :set signcolumn=no<CR>
noremap <F2> :set signcolumn=auto<CR>

set nocompatible " vimwiki required
filetype plugin on " vimwiki required


" ===
" === System
" ===
set mouse=a
set clipboard+=unnamedplus
let &t_ut=''
set autochdir

set pyx=3 "pythonx

" ===
" === Editor behavior
" ===
set number
set relativenumber
set cursorline
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:\┆\ ,trail:▫ "|
" set listchars=space:·,tab:│\ ,eol:¬

"==                       st: shiftwidth
"== Settings by filetype  et: expandtab --> tab->whitespace
"==                       tw: textwidth ts: textwidth
" au FileType mail setlocal sw=2 sts=2 textwidth=0 wrapmargin=0 wrap linebreak nolist "mutt
" au FileType vimwiki  setlocal tabstop=2 shiftwidth=2 expandtab
au FileType javascript setlocal tabstop=2 shiftwidth=2 sts=2 expandtab
au FileType json       setlocal tabstop=2 shiftwidth=2 expandtab
au FileType typescript setlocal tabstop=2 shiftwidth=2 expandtab
au FileType markdown   setlocal tabstop=2 shiftwidth=2 expandtab
au FileType text       setlocal tabstop=2 shiftwidth=2 expandtab
au FileType html       setlocal tabstop=2 shiftwidth=2 sts=2 expandtab
au FileType yaml       setlocal tabstop=2 shiftwidth=2 expandtab
au Filetype css        setlocal tabstop=2 shiftwidth=2 sts=2
au Filetype c          setlocal tabstop=4 shiftwidth=4 sts=4 textwidth=4 noexpandtab

" autocmd BufRead,BufNewFile *.c setlocal tabstop=4 shiftwidth=4 softtabstop=4

set scrolloff=5
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set textwidth=0 "default
set indentexpr=
" set foldmethod=indent
set foldmethod=marker
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

" set ttyfast "should make scrolling faster
set lazyredraw "same as above

set visualbell

" store the edit history even you quit
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif

" milliseconds swap files will be written to the disk
" cursorhold
" <plug>vim-gitgutter
set updatetime=100 

" when you enter a file, your cursor will jump to the place you edit last time.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
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


" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
noremap ; :

" Save & quit
noremap q :q<CR>
noremap Q :q!<CR>
noremap S :w<CR>

" ===
" === Open sth
" ===
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR> "Open the vimrc file anytime
noremap <LEADER>st :Startify<CR>

" Undo operation
noremap l u
noremap <C-l> U

" Insert
noremap k i
noremap K I

" make <nno>Y more logical, but not vi-compatible
nnoremap Y y$

" Copy to system clipboard "I do need that
vnoremap Y "+y

" Indentation
nnoremap < <<
nnoremap > >>

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
"nnoremap <LEADER>tt :%s/    /\t/g
"vnoremap <LEADER>tt :s/    /\t/g

" Folding
noremap <silent> <LEADER>o za

" Open up lazygit
" noremap \lg :term lazygit<CR>
" noremap <C-g> :term lazygit<CR>


" ===
" === Cursor Movement
" ===
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     u
" < n   i >
"     e
"     v
noremap <silent> u k
noremap <silent> n h
noremap <silent> e j
noremap <silent> i l

" U/E keys for 5 times u/e (faster navigation)
noremap <silent> U 5k
noremap <silent> E 5j

" N: to the 1st non-blank character of the line
noremap <silent> N 0
noremap <silent> I 78l

" Faster in-line navigation
noremap W 5w
noremap B 5b

" use h and H to search next.
noremap h nzz
noremap H Nzz

" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>

" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
" noremap <LEADER>w <C-w>w
noremap <LEADER>u <C-w>k
noremap <LEADER>e <C-w>j
noremap <LEADER>n <C-w>h
noremap <LEADER>i <C-w>l

" Disable the default s key
" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap s <nop>
"noremap S <nop>
noremap su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap se :set splitbelow<CR>:split<CR>
noremap sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap si :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <up> :res +2<CR>
noremap <down> :res -2<CR>
noremap <left> :vertical resize-2<CR>
noremap <right> :vertical resize+2<CR>

" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" Close the window below the current
noremap <LEADER>q <C-w>j:q<CR>


" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tu :tabe<CR>
" Move around tabs with tn and ti
noremap tn :-tabnext<CR>
noremap ti :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmn :-tabmove<CR>
noremap tmi :+tabmove<CR>


" ===
" === Markdown Settings
" ===
" Snippets
source ~/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell
" noremap <C-x>s <C-x>

" ===
" === Other useful stuff
" ===
" \p to show the current buffer file path
nnoremap \p 1<C-G>

" Move the next character to the end of the line with ctrl+9
"inoremap <C-u> <ESC>lx$p

" Opening a terminal window
noremap <LEADER>/ :term<CR>

" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>"-c4l
noremap \\ <Esc>a<++><Esc>

" Spelling Check with <space>sc
noremap ss :set spell!<CR>

" Press ` to toggle case (instead of ~)
noremap ` ~

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
"noremap tx :r !figlet

"noremap <LEADER>- :lN<CR>
"noremap <LEADER>= :lne<CR>

" find and replace
"noremap \s :%s//g<left><left>

" Compile function
noremap <F5> :call CompileRunGcc()<CR>
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
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!chromium % &"
	elseif &filetype == 'xhtml'
		silent! exec "!chromium % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run %
	endif
endfunc


" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.config/nvim/plugged')
" Plug '<++>'
" Plug 'vimwiki/vimwiki'
" Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar' " Ctags <F6>
Plug 'skkshu/vim-copyright' " orig: nine2
Plug 'frazrepo/vim-rainbow'
Plug 'lambdalisue/suda.vim'
Plug 'h-youhei/vim-fcitx'
Plug 'jiangmiao/auto-pairs'

Plug 'junegunn/vim-peekaboo'
"Plug 'makerj/vim-pdf'
"Plug 'theniceboy/vim-leader-mapper'

" Testing my own plugin
"Plug 'theniceboy/vim-calc'

" Pretty Dress
Plug 'vim-airline/vim-airline'
"Plug 'theniceboy/eleline.vim'
"Plug 'bling/vim-bufferline'
"Plug 'liuchengxu/space-vim-theme'
" Plug 'morhetz/gruvbox'
"Plug 'ayu-theme/ayu-vim'
"Plug 'rakr/vim-one'
"Plug 'mhartington/oceanic-next'
"Plug 'kristijanhusak/vim-hybrid-material'
" Plug 'ajmwagar/vim-deus'

" Genreal Highlighter
Plug 'jaxbot/semantic-highlight.vim'
"Plug 'chrisbra/Colorizer' " Show colors with :ColorHighlight

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf.vim'
"Plug 'yuki-ycino/fzf-preview.vim'
"Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
"Plug 'junegunn/fzf'
"Plug 'francoiscabrol/ranger.vim'

" Taglist
" Plug 'liuchengxu/vista.vim'

" Error checking
"Plug 'dense-analysis/ale'
"Plug 'fszymanski/fzf-quickfix', {'on': 'Quickfix'}

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Undo Tree
Plug 'mbbill/undotree'

" Git
"Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
"Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
"Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'

" Tex
"Plug 'lervag/vimtex'

" CSharp
"Plug 'OmniSharp/omnisharp-vim'
"Plug 'ctrlpvim/ctrlp.vim' , { 'for': ['cs', 'vim-plug'] } " omnisharp-vim dependency

" HTML, CSS, JavaScript, PHP, JSON, etc.
" Plug 'elzr/vim-json'
"Plug 'hail2u/vim-css3-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
"Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'jaxbot/browserlink.vim'

" Go
"Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }

" Python
"Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
"Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
"Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
"Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
"Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
"Plug 'tweekmonster/braceless.vim'

" Markdown
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'theniceboy/bullets.vim'

" Editor Enhancement
"Plug 'Raimondi/delimitMate'
"Plug 'cohama/lexima.vim'
"Plug 'terryma/vim-multiple-cursors'
Plug 'tyru/caw.vim' "comment
Plug 'AndrewRadev/switch.vim' " gs to switch
Plug 'tpope/vim-surround'
"Plug 'gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp
"Plug 'junegunn/vim-after-object' " da= to delete what's after =
Plug 'junegunn/vim-easy-align' " gaip= to align the = in paragraph, 
"Plug 'tpope/vim-capslock'	" Ctrl+L (insert) to toggle capslock
"Plug 'easymotion/vim-easymotion'
"Plug 'Konfekt/FastFold'

" Input Method Autoswitch
"Plug 'rlue/vim-barbaric'

" Formatter
"Plug 'Chiel92/vim-autoformat'

" For general writing
Plug 'junegunn/goyo.vim'
"Plug 'reedes/vim-wordy'
"Plug 'ron89/thesaurus_query.vim'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Find & Replace
"Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }
"Plug 'osyo-manga/vim-anzu'

" Documentation
"Plug 'KabbAmine/zeavim.vim' " <LEADER>z to find doc

" Mini Vim-APP
"Plug 'voldikss/vim-floaterm'
"Plug 'liuchengxu/vim-clap'
"Plug 'jceb/vim-orgmode'
Plug 'mhinz/vim-startify'

" Vim Applications
"Plug 'itchyny/calendar.vim'

" Other visual enhancement
Plug 'ryanoasis/vim-devicons'

" Other useful utilities
" Plug 'tpope/vim-eunuch' " do stuff like :SudoWrite

" Dependencies
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'kana/vim-textobj-user'
"Plug 'roxma/nvim-yarp'
"Plug 'rbgrouleff/bclose.vim' " For ranger.vim

call plug#end()


" ===
" === Dress up my vim
" ===
set termguicolors "use true color in the terminal
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set background=dark
"let ayucolor="mirage"
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"let g:one_allow_italics = 1

"color dracula
"color one
" color deus
" color gruvbox
"let ayucolor="light"
"color ayu
"set background=light
"color xcodedark

"===
"=== hi
"===
hi SpellBad cterm =underline

" hi Title guifg=Red
hi LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
hi CursorLineNr guifg=white
hi NonText ctermfg=gray guifg=grey10
set colorcolumn=80
hi ColorColumn ctermbg=NONE guibg=#808080
" hi ColorColumn ctermbg=lightgrey guibg=lightgrey
" hi ColorColumn ctermbg=241 guibg=#665c54
" hi ColorColumn ctermbg=NONE guibg=NONE

" hi SpecialKey ctermfg=66 guifg=#649A9A " junegunn
hi SpecialKey ctermfg=blue guifg=grey70

hi Normal ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE

hi SignColumn ctermbg=none  " terminal Vim
hi SignColumn guibg=none    " gVim/MacVim

" Better Whitespace
hi ExtraWhitespace guibg=#E06C75
" ===================== Start of Plugin Settings =====================

let g:airline_powerline_fonts = 0
" let g:airline_theme='alduin'
" let g:airline_theme='cool'


" ===
" === NERDTree
" ===
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
noremap tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = "N"
let NERDTreeMapUpdirKeepOpen = "n"
let NERDTreeMapOpenSplit = ""
let NERDTreeMapOpenVSplit = "I"
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapOpenInTabSilent = "O"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = ""
let NERDTreeMapChangeRoot = "l"
let NERDTreeMapMenu = ","
let NERDTreeMapToggleHidden = "zh"


" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
			\ "Modified"	: "✹",
			\ "Staged"		: "✚",
			\ "Untracked" : "✭",
			\ "Renamed"	 : "➜",
			\ "Unmerged"	: "═",
			\ "Deleted"	 : "✖",
			\ "Dirty"		 : "✗",
			\ "Clean"		 : "✔︎",
			\ "Unknown"	 : "?"
			\ }


" ===
" === coc
" ===
" fix the most annoying bug that coc has
silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-lists', 'coc-gitignore', 'coc-vimlsp', 'coc-tailwindcss', 'coc-stylelint']
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]	=~ '\s'
endfunction
inoremap <silent><expr> <Tab>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<Tab>" :
			\ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <c-space> coc#refresh()
" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)



" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = '127.0.0.1'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_preview_options = {
			\ 'mkit': {},
			\ 'katex': {},
			\ 'uml': {},
			\ 'maid': {},
			\ 'disable_sync_scroll': 0,
			\ 'sync_scroll_type': 'middle',
			\ 'hide_yaml_meta': 1
			\ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = '2020'
let g:mkdp_page_title = '「${name}」'


" ===
" === Python-syntax
" ===
"let g:python_highlight_all = 1
" let g:python_slow_sync = 0


" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'

" ===
" === vim-gitgutter
" ===
set signcolumn=auto " yes
let g:gitgutter_max_signs = 500 " Default: 500
let g:gitgutter_map_keys = 0 " Disable all key mappings
highlight GitGutterAdd    guifg=#009900 guibg=NONE ctermfg=2 ctermbg=NONE
highlight GitGutterChange guifg=#bbbb00 guibg=NONE ctermfg=3 ctermbg=NONE
highlight GitGutterDelete guifg=#ff2222 guibg=NONE ctermfg=1 ctermbg=NONE
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
" let g:gitgutter_sign_removed_first_line = '^^'
" let g:gitgutter_sign_modified_removed = 'ww'
nmap <c-[> <Plug>(GitGutterPrevHunk)
nmap <c-]> <Plug>(GitGutterNextHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
" let g:gitgutter_preview_win_floating = 1
" let g:gitgutter_use_location_list = 0 " 1: load all hunks in the current buffer

let g:gitgutter_highlight_lines = 0
let g:gitgutter_highlight_linenrs = 1

" ===
" === vim-signature
" ===
let g:SignatureMap = {
			\ 'Leader':"m",
			\ 'PlaceNextMark':"m,",
			\ 'ToggleMarkAtLine':"m.",
			\ 'PurgeMarksAtLine':"dm",
			\ 'DeleteMark':"mu",
			\ 'PurgeMarks':"",
			\ 'PurgeMarkers':"",
			\ 'GotoNextLineAlpha':"m<LEADER>",
			\ 'GotoPrevLineAlpha':"",
			\ 'GotoNextSpotAlpha':"m<LEADER>",
			\ 'GotoPrevSpotAlpha':"",
			\ 'GotoNextLineByPos':"",
			\ 'GotoPrevLineByPos':"",
			\ 'GotoNextSpotByPos':"",
			\ 'GotoPrevSpotByPos':"",
			\ 'GotoNextMarker':"",
			\ 'GotoPrevMarker':"",
			\ 'GotoNextMarkerAny':"",
			\ 'GotoPrevMarkerAny':"",
			\ 'ListLocalMarks':"m/",
			\ 'ListLocalMarkers':"m?"
			\ }


" ===
" === Goyo
" ===
map <leader>gy :Goyo<CR>

" ===
" === Undotree
" ===
noremap L :UndotreeToggle<CR>
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
" === suda.vim
" ===
let g:suda#prefix = ['suda://', 'sudo://', '_://']
let g:suda_smart_edit = 1

" ===
" === vim-rainbow
" ===
" let g:rainbow_active = 1
au FileType c,cpp,objc,objcpp,py call rainbow#load()

let g:rainbow_guifgs = ['yellow', 'cyan', 'magenta', 'red', 'white']
let g:rainbow_ctermfgs = ['yellow', 'cyan', 'magenta', 'red', 'white']


"===
"=== skkshu/vim-copyright " orig: nine2
"===
let g:file_copyright_name = "Joey Lee"
let g:file_copyright_email = "skkshu@gmail.com"

let g:file_copyright_auto_filetypes = ['sh', 'plx', 'pl', 'pm', 'py', 'python', 'h', 'hpp', 'c', 'cpp', 'java', 'ruby', 'rb', 'rake', 'uml', 'plantuml']




nmap <F4> :TagbarToggle<CR>
nnoremap <Leader>sm :SemanticHighlightToggle<cr>

" ===
" === FZF
" ===
set rtp+=/usr/local/opt/fzf
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
noremap <C-p> :Files<CR>
noremap <C-f> :Rg<CR>
noremap <C-h> :History<CR>
noremap <C-t> :BTags<CR>
noremap <C-l> :Lines<CR>
noremap <C-w> :Buffers<CR>
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

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7 } }




" ===================== End of Plugin Settings =====================

" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"

let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'
let g:ruby_host_prog='/usr/bin/ruby'
