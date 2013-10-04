syntax on
filetype indent plugin on
set tabstop=4
set shiftwidth=4
set expandtab
colorscheme vividchalk
"remap leader comma
let mapleader = ","

" Better command-line completion
set wildmenu

" allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Line numbers
set number

"Pretty Colors
if &term =~ "xterm"
  "256 color --
  let &t_Co=256
  " restore screen after quitting
  set t_ti=ESC7ESC[rESC[?47h t_te=ESC[?47lESC8
  if has("terminfo")
    let &t_Sf="\ESC[3%p1%dm"
    let &t_Sb="\ESC[4%p1%dm"
  else
    let &t_Sf="\ESC[3%dm"
    let &t_Sb="\ESC[4%dm"
  endif
endif

"Control P = same again
noremap <C-P> @:<CR>

"Dogreps in vim
command -nargs=1 Dogrep :execute "vimgrep <args> **/*.c* **/*.h*" | copen
command -nargs=1 Dogrepweb :execute "vimgrep <args> **/*.js **/*.css **/*.py **/*.html" | copen

"Easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"reselect after indent
vnoremap < <gv
vnoremap > >gv

"smash escape
inoremap jk <Esc>
inoremap kj <Esc>

"Ctrl-a home, Ctrl-e End
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Highlight trailing whitespace in vim on non empty lines, but not while
" typing in insert mode!
highlight ExtraWhitespace ctermbg=red guibg=Brown
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\S\zs\s\+$/
au InsertEnter * match ExtraWhitespace /\S\zs\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\S\zs\s\+$/

if &diff
    colorscheme evening
endif
" no swap files
set noswapfile

" NERDtree settings when in gVim
if has("gui_running")
    autocmd VimEnter * NERDTree
    autocmd BufEnter * NERDTreeMirror
    " and move cursor to main window
    autocmd VimEnter * wincmd p

    " Remove scrollbars from gVim
    set guioptions-=L
endif

" ctrl + space for autocorrect
if has("gui_running")
     "C-Space seems to work under gVim on both Linux and win32
     inoremap <C-Space> <C-n>
else " no gui
    if has("unix")
        inoremap <Nul> <C-n>
    else
        " I have no idea of the name of Ctrl-Space elsewhere
    endif
endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" TagList in F3 and right side
nnoremap <F3> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
