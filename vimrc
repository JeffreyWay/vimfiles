filetype indent on
syntax on
colorscheme Tomorrow-Night
set background=dark
"set guifont=Menlo\ Regular:h18
set number
let mapleader=","
set laststatus=2
set hidden
set history=500
set nowrap
set nobackup
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set backspace=2
set encoding=utf-8
set wildmenu
set ignorecase
set splitbelow
set splitright
set expandtab
set autoread
set timeout ttimeout timeoutlen=200
set smartindent
set scrolloff=5
set autoindent
set autowriteall
set hlsearch
set showmatch
set noerrorbells visualbell t_vb=
set rtp+=/usr/local/opt/fzf

"map <leader>p :FZF<CR>
"map <C-p> :FZF<CR>
nnoremap <leader>p :FilesMru --tiebreak=index<cr>
map <C-p> :FilesMru --tiebreak=index<CR>

map <leader>s :source ~/.vimrc<CR>
map <leader>ev :e ~/.vimrc<CR>

autocmd BufWritePre * :%s/\s\+$//e
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

map <D-A-RIGHT> <C-w>l
map <D-A-LEFT> <C-w>h
map <D-A-DOWN> <C-w><C-w>
map <D-A-UP> <C-w>W

let g:lightline = {
\ 'colorscheme': 'seoul256',
\ }

nnoremap <silent><leader>f :call PhpCsFixerFixFile()<CR>

let $FZF_DEFAULT_COMMAND = 'ag --skip-vcs-ignores -g ""'

let g:fzf_filemru_bufwrite = 1
let g:fzf_filemru_git_ls = 1
let g:fzf_filemru_ignore_submodule = 1

"This runs the full PHPUnit suite.
nnoremap ,t :!phpunit<cr>

"This runs the test method under the cursor.
nmap ,tm ?functionwviwy:!phpunit --filter <c-r>"<CR>

nmap <leader>e :MRU<CR>

nmap <leader>w :bd<CR>

nmap ;w :w<CR>

nmap <C-]> g<C-]>

imap jj <Esc>

"Syntastic recommended default settings.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_checkers = ['php', 'phpmd']

"A list of regexes for phpcs messages to ignore. I don't care about any of
"these detections.
let g:syntastic_quiet_messages = { "regex": 'Missing @return\|Missing parameter comment\|Missing class doc comment\|Missing file doc comment' }

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>


function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>q <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>q :call PhpExpandClass()<CR>

imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

let g:indent_guides_default_mapping = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_exclude_filetypes = ['help', 'startify', 'man', 'rogue']

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-vinegar'
Plug 'StanAngeloff/php.vim'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'yegappan/mru'
Plug 'vim-syntastic/syntastic'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tweekmonster/fzf-filemru'

"Snipmate dependencies
Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'nathanaelkane/vim-indent-guides'
call plug#end()


"Tips
" If there are Syntastic errors on the page, do :Errors to read the list.
" ltag methodName and then lopen to view all symbols.

"regenerate tags with
" ctags -R --PHP-kinds=cfi --regex-php="/^[ \t]*trait[ \t]+([a-z0_9_]+)/\1/t,traits/i"
" gc will comment out the selection.
