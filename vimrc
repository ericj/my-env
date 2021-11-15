"--------------------------------------------------------------------
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" BundleInstall!
"--------------------------------------------------------------------
set smartindent
set ignorecase
set tabstop=4
set shiftwidth=4
set expandtab
set bg=dark
set encoding=utf-8

set hlsearch
hi MatchParen cterm=bold ctermbg=none ctermfg=yellow

" list chars 
set list lcs=tab:\|_
set tags=./tags,tags;$HOME

" Let backspace can delete char
set backspace=indent,eol,start
set nocompatible

filetype off
syntax enable
set t_Co=256
filetype plugin indent on     " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'chrisbra/vim-diff-enhanced'
Plugin 'garbas/vim-snipmate'
Plugin 'gmarik/vundle'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/seoul256.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'mileszs/ack.vim'
Plugin 'Pydiction'
"Plugin 'rickhowe/diffchar.vim'
"Plugin 'shawncplus/phpcomplete.vim'
Plugin 'taglist.vim'
Plugin 'The-NERD-tree'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-scripts/highlight.vim'
Plugin 'xml.vim'
"Plugin 'xolox/vim-lua-ftplugin'
"Plugin 'xolox/vim-misc'

let g:seoul256_background = 233
colorschem seoul256

" vimpowerline
set laststatus=2

"" vim bracketed paste
"if &term =~ "xterm.*"
"    let &t_ti = &t_ti . "\e[?2004h"
"    let &t_te = "\e[?2004l" . &t_te
"    function XTermPasteBegin(ret)
"        set pastetoggle=<Esc>[201~
"        set paste
"        return a:ret
"    endfunction
"    map <expr> <Esc>[200~ XTermPasteBegin("i")
"    imap <expr> <Esc>[200~ XTermPasteBegin("")
"    cmap <Esc>[200~ <nop>
"    cmap <Esc>[201~ <nop>
"endif

" EnhanceDiff started In Diff-Mode set diffexpr (plugin not loaded yet)
if &diff
"    set diffopt+=iwhite
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" NERDTree
nmap <leader>e :<C-u>NERDTree<CR>

" Toggle paste with <ins>
set pastetoggle=<ins>

" Go to insert mode when <ins> pressed in normal mode
nnoremap <silent> <ins> :setlocal paste!<CR>i

" Switch paste mode off whenever insert mode is left
autocmd InsertLeave <buffer> setlocal nopaste

" Fix crontab edit
autocmd filetype crontab setlocal nobackup nowritebackup

" Restore Last Position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Setup pydict
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'

" Syntastic 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Fix for syntastic c and YCM
let g:ycm_show_diagnostics_ui = 0

" modeline search line at beginning and ending
set modeline
set modelines=10

" force tab
:inoremap <S-Tab> <C-V><Tab>

"ack searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

" Fix escapestring + f not move cursor to next work
map f w

" Add $ as keyword, so that ciw can include it
set iskeyword +=$

let g:snipMate = { 'snippet_version' : 1 }
