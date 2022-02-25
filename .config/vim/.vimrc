let mapleader=" "
syntax on
set number relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set nocompatible
set expandtab
set cursorline
set noerrorbells
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set incsearch
set spell
set showmatch
set hlsearch
set wildmenu
set backspace=indent,eol,start
set splitright
set splitbelow
set virtualedit=onemore
"set background=dark
set viminfo+=n~/.config/vim/.viminfo
let g:rehash256 = 1
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

autocmd BufEnter * colorscheme paramount
autocmd BufEnter .*rc colorscheme paramount
autocmd BufEnter *.html colorscheme paramount
autocmd BufEnter *.sh colorscheme paramount
autocmd BufEnter *.css colorscheme paramount
autocmd BufEnter *.py colorscheme paramount

"        /-----------------/
">>-----/    FUNCTIONS    /------------>
"      /-----------------/
"
set background=dark
function! ToggleBG()
    let s:tbg = &background
    if s:tbg == "dark"
        set background=light
    else
        set background=dark
    endif
endfunction
noremap <leader>bg :call ToggleBG()<CR>


"        /------------/
">>-----/    HTML    /------------>
"      /------------/
"
autocmd FileType html inoremap ;h1 <h1></h1><Esc>2b i
autocmd FileType html inoremap ;h2 <h2><</h2><Esc>2b i
autocmd FileType html inoremap ;p <p></p><Esc>2b i
autocmd FileType html inoremap ;d <!DOCTYPE html><Return>
autocmd FileType html inoremap ;h <head><Return><Return></head><UP>
autocmd FileType html inoremap ;m <meta/><Esc>2h i
autocmd FileType html inoremap ;s <strong></strong><esc>F> i



autocmd FileType sh inoremap ;s #!/bin/bash<Return>


"        /--------------/
">>-----/    REMAPS    /----------->
"      /--------------/

nnoremap <silent> <C-Up> :wincmd k<CR>
nnoremap <silent> <C-Down> :wincmd j<CR> 
nnoremap <silent> <C-left> :wincmd h<CR>
nnoremap <silent> <C-Right> :wincmd l<CR>
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>nt <cmd>NERDTreeFind<cr>
map <C-z> :wq<CR>
nnoremap <leader>ff <cmd>FZF<cr>
nnoremap <C-u> :UndotreeToggle<cr>
nnoremap <leader>UP :wincmd k<cr>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
if has("persistent_undo")
    set undodir=$HOME/.vim/undodir
    set undofile
endif


"        /---------------/
">>-----/    PLUGINS    /----------->
"      /---------------/

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'dense-analysis/ale'
Plugin 'vim-syntastic/syntastic'
call vundle#end()
filetype plugin indent on


set laststatus=2
set showmode

set statusline+=\ %{mode()}
set statusline+=\ %l
set statusline+=\ <<
set statusline+=\ %F\ %*
set statusline+=\ >>
"set statusline+=\ %2*\ %F
set statusline+=\ %1*\ <<%{getbufvar(bufnr('%'),'&mod')?'Modified':'Saved'}>>
set statusline+=\ %m
set statusline+=%=
set statusline+=\ %1*\ <<
set statusline+=\ Line:\ %l
set statusline+=\ Col:\ %c
set statusline+=\ ::
set statusline+=\ %n
set statusline+=\ >>

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set colorcolumn=80
    autocmd WinLeave * set colorcolumn=0
augroup END

"hi statusline ctermbg=8  ctermfg=10
"hi User2 ctermbg=8  ctermfg=10


function! ModifiedColor()
    if &mod == 1
        hi statusline ctermfg=8 ctermbg=30
    else
        hi statusline ctermfg=0  ctermbg=38
    endif
endfunction

au InsertLeave,InsertEnter,BufWritePost   * call ModifiedColor()
" default the statusline when entering Vim
hi statusline ctermfg=8 ctermbg=15

