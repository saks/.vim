call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


" remove toolbar
set guioptions-=T

" Shift+Insert will paste from system buffer (Control+C)
cmap <S-Insert>		<C-R>+
exe 'inoremap <script> <S-Insert>' paste#paste_cmd['i']



" setup persisent undo
set undofile
set undodir=/tmp

filetype on  " Automatically detect file types.
set nocompatible  " We don't want vi compatibility.


" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1


syntax enable
set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
set wrap  " Line wrapping on
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)

" Formatting (some of these are for coding in C and C++)
set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab

set noexpandtab

" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
" set list
" Show $ at end of line and trailing space as ~
set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<
set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.

" gvim specific
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes



" remember folding
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview



" handle the irb + vim

if has("autocmd")
  " Enable filetype detection
  filetype plugin indent on

  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif
if &t_Co > 2 || has("gui_running")
  " Enable syntax highlighting
  syntax on
endif


" from vimcast 1
" set list

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:·
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>


colorscheme railscasts


"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

set hlsearch
map <M-k> :nohl <cr>
set cursorline
set guifont=Monaco\ 10


" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab

  " Treat .thor files as Ruby
  autocmd BufNewFile,BufRead *.thor setfiletype ruby

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif


" Text indentation with Alt+[ and so on
nmap <M-Left> <<
nmap <M-Right> >>
vmap <M-Left> <gv
vmap <M-Right> >gv

map <M-1> :b1<CR>
map <M-2> :b2<CR>
map <M-3> :b3<CR>
map <M-4> :b4<CR>
map <M-5> :b5<CR>
map <M-6> :b6<CR>
map <M-7> :b7<CR>
map <M-8> :b8<CR>
map <M-9> :b9<CR>

map <M-.> :bn<CR>
map <M-,> :bp<CR>

nmap <silent> <M-o> :CommandT<CR>

" ignore folllowing files
set wildignore+=*.bak,*~,*.tmp,*.backup,*swp,*.o,*.obj,.git,*.rbc


" save file on Contrl-S
nmap <C-s> :w<CR>


" Text movimg with plugin unimpaired.vim
" Bubble single lines

nmap <M-Up> [e
nmap <M-Down> ]e

" Bubble multiple lines
vmap <M-Up> [egv
vmap <M-Down> ]egv


" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " Do the business:
        %s/\s\+$//e
        " Clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()



" right margin ruller
set colorcolumn=80
