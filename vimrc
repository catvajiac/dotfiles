
" set tab key spacing
set backspace=indent,eol,start
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set autoindent
set tw=79

" set text width
augroup Text
    autocmd!
    autocmd FileType text setlocal textwidth=80
augroup END

" ignore case except with capital letters
set ignorecase smartcase

" other useful things
set title
set background=dark
set showmatch
set relativenumber
set noswapfile
set spelllang=en

" remove whitespace from end of lines
autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> %s/\s\+$//e


" automatically use paste mode when pasting items, wrapped for tmux
" source: https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()"toggle paste mode


" highlight current line
set cursorline
highlight CursorLine cterm=bold

" basic settings
syntax on
let $t_Co=256
colorscheme haron-prime
inoremap jk <ESC>
nmap x ml


" plugins: vim-plug
filetype on
filetype plugin indent on

call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'svermeulen/vim-easyclip'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/csapprox'
Plug 'rafi/awesome-vim-colorschemes'
call plug#end()

" lightline settings
set laststatus=2
let g:lightline = {'colorscheme': 'Dracula'}

" ale settings
let g:ale_sign_column_always = 1
highlight clear ALEErrorSign cterm=bold
highlight clear ALEWarningSign cterm=bold

" easy-clip settings
let g:EasyClipShareYanks = 1
