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
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'gmarik/vundle'
Plugin 'Pydiction'
Plugin 'xml.vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'The-NERD-tree'
Plugin 'taglist.vim'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'junegunn/seoul256.vim'
Plugin 'bling/vim-airline'
"Plugin 'edkolev/tmuxline.vim'
Plugin 'chrisbra/vim-diff-enhanced'
Plugin 'Valloric/YouCompleteMe'

let g:seoul256_background = 233
colorschem seoul256

" vimpowerline
set laststatus=2

"" vim bracketed paste
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif

" EnhanceDiff started In Diff-Mode set diffexpr (plugin not loaded yet)
if &diff
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

" Restore Last Position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Setup pydict
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'

