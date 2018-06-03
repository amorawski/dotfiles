
"###### vim-plug ######
call plug#begin('~/.vim/plugged')

Plug 'w0rp/ale' "async Lint engine
Plug 'ternjs/tern_for_vim' "js Lint support - js analysis engine
Plug 'majutsushi/tagbar'
Plug 'joshdick/onedark.vim'
Plug 'schickling/vim-bufonly'
Plug 'NLKNguyen/papercolor-theme'
Plug 'chriskempson/base16-vim'
Plug 'roosta/srcery'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'easymotion/vim-easymotion'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' | Plug 'amorawski/vim-javascript-ultisnips'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --tern-completer --clang-completer'}
"Plug 'OmniSharp/omnisharp-vim', {'do': './git submodule update --init --recursive; cd server; xbuild'}
Plug 'OmniSharp/omnisharp-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kshenoy/vim-signature' "display marks
Plug 'bkad/CamelCaseMotion' "better navigation on camelcase / snake
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace' "display trailing whitespace
Plug 'gorodinskiy/vim-coloresque' "css-like color preview
Plug 'chrisbra/Colorizer' "rgb color preview
"Plug 'airblade/vim-gitgutter'
Plug 'habamax/vim-skipit'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-expand-region'
Plug 'tomtom/tcomment_vim'
"Plug 'Raimondi/delimitMate'
"Plug 'jiangmiao/auto-pairs' "auto close tags in source code
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-endwise'
Plug 'alvan/vim-closetag' "auto close tags in html/xml
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-easy-align'
Plug 'haya14busa/incsearch.vim'
Plug 'sheerun/vim-polyglot'
Plug 'dracula/vim'
Plug 'guns/xterm-color-table.vim'
Plug 'altercation/vim-colors-solarized'
"Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'suan/vim-instant-markdown'

call plug#end()
"###### vim-plug ######

"###### basic setup ######
filetype plugin indent on
syntax on
set autoindent
set copyindent
set nowrap
set number
set relativenumber
set smarttab
set cindent
set smartindent
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set nocompatible
set hlsearch
set cursorline cursorcolumn
set ignorecase
set showmatch
set smartcase
set ignorecase
set incsearch
set backspace=indent,eol,start
set wildignore=*.swp,*.bak,*.pyc,*.class
set undolevels=1000
set history=1000
set nobackup
set noswapfile
set clipboard=unnamed
set nocompatible
set autoread
set splitbelow
let mapleader = "\<Space>"
"###### basic setup ######

"###### buffers ######
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>bn :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bo :BufOnly <CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>
"###### buffers ######

"###### UI ######
set t_Co=256
"let base16colorspace=256
set background=light
colorscheme solarized

if "dark" == &background
  highlight EndOfBuffer ctermfg=8 ctermbg=8 guifg=#808080 guibg=#808080
else
  highlight EndOfBuffer ctermfg=7 ctermbg=7 guifg=#c0c0c0 guibg=#c0c0c0
end

" Remove windows split character (no border between windows :)
set encoding=utf-8
set termencoding=utf-8
set fillchars=vert:\ ,stl:\ ,stlnc:\ " select splitter rendering
"hi statusline cterm=NONE ctermfg=blue ctermbg=NONE
"hi vertsplit cterm=NONE ctermfg=blue ctermbg=NONE

"clear cursor line/column on window leave
augroup CursorLine
  au!
  au VimEnter * setlocal cursorline
  au WinEnter * setlocal cursorline
  au BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline

  au VimEnter * setlocal cursorcolumn
  au WinEnter * setlocal cursorcolumn
  au BufWinEnter * setlocal cursorcolumn
  au WinLeave * setlocal nocursorcolumn
augroup END
":hi CursorLine ctermbg=55 guibg=#5f00af
":hi CursorColumn ctermbg=55 guibg=#5f00af

" mark line when too long
set colorcolumn=90
" clear search with escape
nnoremap <silent> <Enter> :nohlsearch<Bar>:echo<CR>
"###### UI ######
"
"###### vim-airline ######

set laststatus=2               " enable airline even if no splits
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1
let g:Powerline_symbols='unicode'
"let g:airline_enable_branch=1 let g:airline_enable_syntastic=1
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline_mode_map = {
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'R',
      \ 'v' : 'V',
      \ 'V' : 'VL',
      \ 'c' : 'CMD',
      \ '': 'VB',
      \ }
" Show full filepath relative to current root dir
let g:airline#extensions#tabline#fnamemod = ':.'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_nr_type = 1
"###### vim-airline ######

"###### fzf ######
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fm :Marks<CR>
nnoremap <Leader>ff :Files .<CR>
nnoremap <Leader>fg :Ag 
"###### fzf ######
"
"###### vim-indent-guides ######
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg='#FFFFFF'   ctermbg=231
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg='#FFFFFF'   ctermbg=231
"###### vim-indent-guides ######

"###### CamelCaseMotion ######
call camelcasemotion#CreateMotionMappings(',')
"###### CamelCaseMotion ######
"
"###### bindings ######
nnoremap <Leader>w :w<CR>
" center view on the search result
noremap n nzz
noremap N Nzz
"###### bindings ######
"
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_key_list_previous_completion = ['<C-p>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" UltiSnips triggering
" let g:UltiSnipsExpandTrigger = '<C-o>'
" let g:UltiSnipsJumpForwardTrigger = '<C-n>'
" let g:UltiSnipsJumpBackwardTrigger = '<C-p>'

" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"###### ultisnips ######
let g:UltiSnipsExpandTrigger="<c-o>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"###### ultisnips ######
"
"###### YouCompleteMe ######
" let g:ycm_key_list_select_completion = ['\<c-n>']
" let g:ycm_key_list_previous_completion = ['\<c-p>']
" "let g:SuperTabDefaultCompletionType = '\<c-n>'
 let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_min_num_of_chars_for_completion = 1
"###### YouCompleteMe ######
"
"###### delimitMate ######
let delimitMate_expand_cr = 1
"###### delimitMate ######
"
"###### incsearch.vim ######
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
"###### incsearch.vim ######

"###### easy-align ######
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"###### easy-align ######

"###### netrw ######
let g:netrw_banner = 0
let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END
"###### netrw ######

"###### easy-motion ######
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
"###### easy-motion ######

"###### nerdtree #####
nmap <silent> <Leader>e :NERDTreeToggle<CR>
"let g:NERDTreeWinPos = "right"

"How can I open NERDTree automatically when vim starts up on opening a directory?
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"###### nerdtree ######

"###### vim-expand-region ######
" Hit v to select one character
" Hit v again to expand selection to word
" Hit v again to expand to paragraph
" ...
" Hit <C-v> go back to previous selection if I went too far
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
"###### vim-expand-region ######

hi VertSplit ctermbg=NONE guibg=NONE

command -nargs=1 -range RegRem :s/<args>//gc
map <leader>z :RegRem<space>

"let vim_markdown_preview_toggle=2
"let vim_markdown_preview_hotkey='<C-s>'

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.xml'

let g:airline#extensions#tagbar#enabled = 0
