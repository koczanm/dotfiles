"----------------------------------- Plugins -----------------------------------
call plug#begin()

" Aesthetics
Plug 'dracula/vim', { 'as': 'dracula' }                   " Adds Dracula theme
Plug 'vim-airline/vim-airline'                            " Makes the statusline lean & mean
Plug 'vim-airline/vim-airline-themes'                     " Colorizes vim-airline with the current colorscheme
Plug 'ryanoasis/vim-devicons'                             " Adds file type icons
Plug 'bryanmylee/vim-colorscheme-icons'                   " Colorizes vim-devicons with the current colorscheme
Plug 'junegunn/rainbow_parentheses.vim'                   " Provides rainbow colors for brackets/parentheses
Plug 'mhinz/vim-startify'                                 " Provides a fancy start screen

" Functionalities
Plug 'tpope/vim-fugitive'                                 " Executes git commands
Plug 'tpope/vim-surround'                                 " Changes/deletes surrondings in pairs
Plug 'preservim/tagbar'                                   " Displays TagBar (classes, functions, vars list)
Plug 'preservim/nerdtree'                                 " Displays NERDTree (a sidebar filetree viewer)
Plug 'Xuyuanp/nerdtree-git-plugin'                        " Shows git status flags in NERDTree
Plug 'preservim/nerdcommenter'                            " Comments/Uncomments selected lines
Plug 'mhinz/vim-signify'                                  " Indicates changed lines
Plug 'jiangmiao/auto-pairs'                               " Inserts/deletes brackets/parentheses/quotes in pairs
Plug 'junegunn/vim-easy-align'                            " Aligns lines
Plug 'sheerun/vim-polyglot'                               " Provides a collection of language packs
Plug 'Yggdroot/indentLine'                                " Displays the indentation levels with thin vertical lines
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }       " Performs fuzzy search
Plug 'junegunn/fzf.vim'
Plug 'psliwka/vim-smoothie'                               " Makes scrolling nice and smooth
Plug 'antoinemadec/FixCursorHold.nvim'                    " Fixes CursorHold performance
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }  " Provides symantic highlighting for Python
Plug 'heavenshell/vim-pydocstring', 
  \ { 'do': 'make install', 'for': 'python' }

" CoC
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'neoclide/coc-git', { 'do': 'yarn install --frozen-lockfile' }
Plug 'fannheyward/coc-pyright', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-json', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-yaml', { 'do': 'yarn install --frozen-lockfile' }

" Entertainment
Plug 'dansomething/vim-hackernews'

call plug#end()


"---------------------------- Main configuration -------------------------------
filetype plugin indent on       " Enable the file type based indentation
set tabstop=4                   " Set the size of a hard tabstop
set softtabstop=4               " Set the size of an indentation
set shiftwidth=4                " Set the size of the auto-indentation
set expandtab                   " Expand tabs to spaces
set smarttab                    " Insert tabs on the start of a line according to shiftwidth
set autoindent                  " Copy indent from the current line when staring a new line
set encoding=utf-8              " Set the default encoding to UTF-8
set incsearch                   " Show the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set wrap                        " Enable automatic word wrapping
set breakindent                 " Indent wrapped lines
set textwidth=0                 " Disable hard wrapping
set wildmenu                    " Enable command line completion
set wildmode=longest:list,full  " Show a list of completions and complete the command to the longest commond command
                                " on the 1st tab, show up the wildmenu with all the completions on the 2nd tab
set ruler                       " Show the line and column numbers of the cursor
set laststatus=2                " Always display the status line
set showcmd                     " Show partial commands in the last line of the screen
set showmode                    " Highlight matching brackets/parentheses
set number relativenumber       " Enable hybrid line number mode
set hidden                      " Hides buffers instead of closing them
set title                       " Enable setting the title
set list                        " Show ALL whitespace characters according to the mapping below
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set showbreak=↪\ 
set fillchars+=vert:\ 


"---------------------------------- Coloring -----------------------------------

" Set Dracula as the main color scheme
syntax on
color dracula

" Set Dracula for the popup menu too
highlight Pmenu guibg=#363948
highlight PmenuSbar guibg=#363948

" Enable true color support
set termguicolors


"---------------------------- Plugin configurations ----------------------------

" Neovim :Terminal
tmap <Esc> <C-\><C-n>
tmap <C-w> <Esc><C-w>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" Startify
let g:startify_fortune_use_unicode = 1

" NERDTree
let NERDTreeShowHidden=1
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * 
  \ if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()
  \ | quit
  \ | endif

" Startify + NERDTree on start when no file is specified
autocmd VimEnter *
  \   if !argc()
  \ |   Startify
  \ |   NERDTree
  \ |   wincmd w
  \ | endif

" Airline
let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''

" TagBar
let g:tagbar_width = 30

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_defaultGroup = 'NonText'
let g:vim_json_syntax_conceal = 0           " Disable indentLine from concealing json ...
let g:vim_markdown_conceal = 0              " and markdown syntax (e.g. ```)
let g:vim_markdown_conceal_code_blocks = 0

" fzf-vim
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'Type'],
  \ 'border':  ['fg', 'Constant'],
  \ 'prompt':  ['fg', 'Character'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Apply base16 color scheme when viewing files in fzf
let $BAT_THEME='base16'

" signify
let g:signify_sign_add = '│'
let g:signify_sign_delete = '│'
let g:signify_sign_change = '│'
hi DiffDelete guifg=#ff5555 guibg=none

" FixCursorHold
let g:cursorhold_updatetime = 100

" pydocstring
let g:pydocstring_formatter = 'google'

" coc.vim START

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
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

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" coc.vim END


"------------------------------ Custom functions -------------------------------


" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction


"------------------------------- Custom mappings -------------------------------

let mapleader=","

" Open a new term in horizontal split
nmap <leader>$s <C-w>s<C-w>j:terminal<CR>:set nonumber<CR><S-a>

" Open a new term in vertical split
nmap <leader>$v <C-w>v<C-w>l:terminal<CR>:set nonumber<CR><S-a>

" Go to the next buffer
nmap <Tab> :bnext<CR>

" Go to the previous buffer
nmap <S-Tab> :bprevious<CR>

" Refresh neovim configs
nmap <leader>r :so ~/.config/nvim/init.vim<CR>

" Toggle NERDTree
nmap <leader>q :NERDTreeToggle<CR>
nmap \\ <leader>q

" Toggle Tagbar
nmap <leader>w :TagbarToggle<CR>
nmap \| <leader>w

" Toggle Rainbow Parenthesess
nmap <leader>h :RainbowParentheses!!<CR>

" Auto align variables
xmap <leader>a gaip*
nmap <leader>a gaip*

" Fuzzy find for a string in tbe current workdir
nmap <leader>s :Rg<CR>

" Fuzzy find a file
nmap <leader>d :Files<CR>

" Fuzzy find for a string in the current file/buffer 
nmap <leader>f :BLines<CR>

" Generate Python docstring
nmap <leader>p <Plug>(pydocstring)

" Trim all trailing whitespaces
nmap <leader>t :call TrimWhitespace()<CR>

" Open HackerNews
nmap <leader>y <C-w>v<C-w>l:HackerNews best<CR>J
