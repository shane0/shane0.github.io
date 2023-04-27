# bujo vim

```sh
syntax on
filetype plugin indent on
set nocompatible
" https://www.vim.org/docs.php

syntax enable
set t_Co=256
set number
set wildmenu
set wildmode=list:longest,full
"map <C-n> :NERDTreeToggle<CR>

set encoding=UTF-8

set colorcolumn=85
set nofoldenable

" gruvbox
colorscheme gruvbox
set bg=dark
"set background=dark
" colorscheme primary
" colorscheme solarized
let g:gruvbox_termcolors=16
let g:gruvbox_contrast_dark='hard'

" leader mappings
let mapleader=" "


" undotree.vim : Display your undo history in a graph.
nnoremap <Leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle=1 " if undotree is opened, it is likely
"                                     " wants to interact with it.
" gx fix?
:let g:netrw_browsex_viewer="xdg-open"


"let NERDTreeShowHidden=1

set cryptmethod=blowfish2

" limelight stuff
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
" let g:limelight_default_coefficient = 0.7
" 
" Number of preceding/following paragraphs to include (default: 0)
" let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
" let g:limelight_bop = '^\s'
" let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

nnoremap <Leader>ff :Goyo<CR>
nnoremap <Leader>fd :Limelight<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

nnoremap <Leader>fd :r !date +\%I<CR>
nnoremap <Leader>fg :r !date +\%F<CR>
nnoremap <Leader>fj :r !date +\%j<CR>
nnoremap <Leader>fk :r !date +\%V<CR>
nnoremap <Leader>fl :r !date +\%m<CR>
nnoremap <Leader>f; :r !date +\%Y<CR>
nnoremap <Leader>f' :r !date +\%B<CR>

nnoremap <Leader>ll \➜<CR>
 
map <leader>n I•
map <leader>d I✓
map <leader>e I⚡
map <leader>x I✖
map <leader>o I☻
map <leader>l I❤
map <leader>z I☯
map <leader>r I∞
map <leader>m I← 
map <leader>s I→
map <leader>p I
"✗
"✓ ✕  ❗ ❔ 
"✖   ∞ • 

" ☢   ☎ ⚡ 
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
"ysiwb bold 
let b:surround_{char2nr('b')} = "**\r**"
:map <leader>gf :e <cfile><cr>
set belloff=all


" macros - use qq to record then "q to paste it 
" surround links with <>
let @l='I<A>o'
"this quoter fails wtf 
"let @w='0I"'"A"'",j'
"nnoremap qw :silent! normal mpea'<Esc>bi'<Esc>`pl



" 2023-03-06 bujo

" Set bullet journaling macros
" In insert mode:
"    Ctrl-b inserts a bullet point and a space
"    Ctrl-t inserts a task bullet point and a space
"    Ctrl-e inserts an event bullet point and a space
"    Ctrl-d inserts a dot bullet point and a space
"    Ctrl-m inserts a month header

" Define bullet point macros
inoremap <C-b> • 
inoremap <C-t> □ 
inoremap <C-e> ○ 
inoremap <C-d> · 

" Define month header macro
" inoremap <C-m> <ESC>O<ESC>1h<C-R>=strftime("%B %Y")<CR><CR>j
inoremap <C-m> <C-o>O<C-R>=strftime("%B %Y")<CR><CR>
" noremap <Leader>h i# <C-R>=strftime("%j") . ' ' . strftime("%Y-%m-%d")<CR><CR><ESC>kA
nnoremap <leader>h i# day: <C-R>=strftime("%j")<CR> week: <C-R>=strftime("%U")<CR> <C-R>=strftime("%B")<CR> <C-R>=strftime("%F")<CR><CR><ESC>o
" nnoremap <leader>h i# day: <C-R>=strftime("%j")<CR> week: <C-R>=strftime("%U")<CR> <C-R>=strftime("%F")<CR><CR><ESC>o
" nnoremap <leader>h i# <C-R>=strftime("%j")<CR> (Week <C-R>=strftime("%U")<CR>) <C-R>=strftime("%F")<CR><CR><ESC>o


" inoremap <C-m> <ESC>O<ESC>1h<C-R>=strftime("%B %Y")<CR><CR>O
" qaO# DayOfYear - YYYY-MM-DD<Esc>^A<Ctrl-R>=strftime("%j - %Y-%m-%d")<CR><CR>q
" nnoremap <leader>dt :let today=strftime("%Y-%m-%d")<CR>
" nnoremap <leader>dm :let daynum=strftime("%j")<CR>
" nnoremap <leader>dw :let weeknum=strftime("%V")<CR>
" nnoremap <leader>dh :execute "normal O# " . daynum . " Week " . weeknum . " " . today . "<Esc>"<CR>
```
