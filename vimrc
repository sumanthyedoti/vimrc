" Enable filetype plugins
filetype plugin on
filetype indent on

syntax on  " syntax hightlighting

"map Esc key to 'jj'
imap jj <Esc>
imap <buffer> <C-o> <esc>o
imap <buffer> <C-;> <esc>A;  " add semicolon
let mapleader = " "  " map leader key (\) to Space bar
" Disbale 'ZZ' command to save and quit
nnoremap Z <C-o>:echom "--> :w :q <-- "<CR>
nnoremap ZZ <C-o>:echom "--> :w :q <-- "<CR>
" Date with F3
nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
" disable arrow in insert mode
inoremap <Up>     <C-o>:echom "--> k <-- "<CR>
inoremap <Down>   <C-o>:echom "--> j <-- "<CR>
inoremap <Right>  <C-o>:echom "--> l <-- "<CR>
inoremap <Left>   <C-o>:echom "--> h <-- "<CR>
" move file up and down with arrows
nnoremap <Up> <C-y>
nnoremap <Down> <C-e>
" Switch between tabs
nnoremap <Right> gt
nnoremap <Left>  gT
" close tabs
nnoremap <C-e> :tabclose<CR>
" split window navigation
"nnoremap <leader>h :wincmd h<CR>
"nnoremap <leader>j :wincmd j<CR>
"nnoremap <leader>k :wincmd k<CR>
"nnoremap <leader>l :wincmd l<CR>
" Slect block remap
nnoremap <C-q> g CTRL-H
" Sizing window horizontally
nnoremap <C-[> <C-W><
nnoremap <C-]> <C-W>>
nnoremap <leader>. :vertical resize +5<CR>
nnoremap <leader>, :vertical resize -5<CR>
" Sizing window vertically
nnoremap <C-i> :resize +2<CR>
nnoremap <C-u> :resize -2<CR>
" hide search(find) highlight
" Clear search (highlight)
"nnoremap <leader>h :nohl<CR>:echo "Search Cleared"<CR>
map <leader><space> :let @/=''<CR><bar>:<CR>" clear search
" toggle line number between relative and norelative
nnoremap <leader>n :set norelativenumber<CR>:echo "Reletive numbers turned off."<CR>
nnoremap <leader>r :set relativenumber<CR>:set number<CR>:echo "Relative numbers turned on."<CR>
" tabs
nnoremap <C-n> :tabnew<Space>
" open File Explorer
nnoremap <leader>ex :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
" closing brace {}
"inoremap {} {<CR>}<Esc>ko
"inoremap { {   }<Escn>hhi
"inoremap {{   {{   }}<Esc>hhhi
"inoremap ( ()<Esc>i

" Make windows to be basically the same size
nnoremap <leader>= <C-w>=
" Insert mode navigation
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
" Moving lines up or down
nnoremap <C-j> Vh :m .+1<CR>gv=gv
nnoremap <C-k> Vh :m .-2<CR>gv=gv
inoremap <leader>j <Esc>:m .+1<CR>==gi
inoremap <leader>k <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" Easier Moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
function! BreakHere()
    s/^\(\s*\)\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\2\r\1\4\6
    call histdel("/", -1)
endfunction
nnoremap <key> :<C-u>call BreakHere()<CR>

" tabs
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set number  " line number
set nocompatible   "no compatibility to Vi
set hidden  " Allow hidden buffers. Buffer becomes hidden when it is abandonedj
set ruler " Show file stats
set relativenumber  " reletive line numbers
set nrformats+=alpha  " increment and decrement alphabets also
set nowrap "no wrap when line exceeds screen
set smartcase "case-sensitive search if search patter contains uppercase character
" Persist changes in undodir. Can access the changes even after reboot
set noswapfile
set nobackup
set undofile
set undodir=~/.vim/undodir
set wildmenu  " command-line completion operates in an enhanced mode
set colorcolumn=80
set textwidth=79
set hlsearch  " Highlight search results
set incsearch " incremental search
set ignorecase
set showmatch  " Show matching brackets when text indicator is over them
set mat=2  " How many tenths of a second to blink when matching brackets
set scrolloff=4  " scroll offset
set cmdheight=2
set signcolumn=yes
set completeopt=menuone
set visualbell
set list
set listchars=tab::\ ,eol:¬,extends:>,precedes:<

" sycn with system clipboard
set clipboard=unnamed
set clipboard=unnamedplus
" map delete without copying to <leader>dd
nnoremap <leader>dd "_dd
"set foldcolumn=1  " Add a bit extra margin to the left
"set spell
"set spelllang=en_us
"set cursorline  " highlight current line with underline
"set exrc  " execute project specific .vimrc
"set guicursor=  " use block cursor
set magic  " For regular expressions turn magic on
highlight CursorLine ctermbg=red

" To derive project root
if executable('rg')
    let g:rg_derive_root='true'
endif
" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
function! ToggleRelativeNumber()
    if &relativenumber
        set norelativenumber
        echo "Reletive numbers turned off."
    else
        set relativenumber
        echo "Relative numbers turned on."
    endif
endfunction
nnoremap <silent> <leader>ren :call ToggleRelativeNumber()<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup SUMANTH_YEDOTI
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
    " auto save
    "autocmd TextChanged,TextChangedI <buffer> silent write
augroup END

let g:netrw_banner = 0  " no help information at top for netrw
let loaded_netrwelugin = 1  " disable netrw
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'chemzqm/vim-jsx-improve'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'machakann/vim-highlightedyank'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'vim-test/vim-test'

" Themes
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
call plug#end()

" let g:airline_powerline_fonts = 1  " arrowed blocks in status line
let g:coc_global_extensions = [
    \ 'coc-emmet',
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-prettier',
    \ 'coc-tsserver',
    \ 'coc-snippets',
    \ 'coc-pairs',
    \]

nnoremap <leader>ut :UndotreeToggle<CR>
nnoremap <C-p> :GFiles<CR>

nmap <leader>gd <Plug>(coc-defination)
nmap <leader>gr <Plug>(coc-references)

source $HOME/.vim/nerdcommenter.vim
if has('nvim')
    highlight Normal guibg=none
    source $HOME/.vim/coc.vim
endif

colorscheme gruvbox " 'nord', 'gruvbox'
set bg=dark  " 'dark', 'light'

" Toggle NERDTree
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
" Close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
" enable line numbers
let NERDTreeShowLineNumbers=1
let g:UltiSnipsExpandTrigger="<tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

let g:highlightedyank_highlight_duration = 350

" vim-test mappings
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-v> :TestVisit<CR>
" make test commands execute using dispatch.vim
let test#strategy = "dispatch"
