" basic settings
set title
set showmatch
set relativenumber
set noswapfile
set spelllang=en
syntax on
let $t_Co=256
inoremap jk <ESC>
set ignorecase smartcase " ignore case when searching


" set tab key spacing
set backspace=indent,eol,start
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set autoindent


" set text width
set tw=99
augroup Text
    autocmd!
    autocmd FileType text setlocal textwidth=99
augroup END


" remove whitespace from end of lines
autocmd FileType c,cpp,java,php,python autocmd BufWritePre <buffer> %s/\s\+$//e


" automatically use paste mode when pasting items, wrapped for tmux
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


"Keep place in file across many files
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
"inoremap = is finna be " <3 8bit
augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END


" plugins: using vim-plug
filetype on
filetype plugin indent on

call plug#begin()
  Plug 'itchyny/lightline.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-repeat'
  Plug 'junegunn/goyo.vim'
  Plug 'reedes/vim-pencil'
  Plug 'dylanaraps/wal.vim'
call plug#end()


" use colorscheme from xrdb
colorscheme wal
hi Normal ctermbg=235


" lightline settings
set laststatus=2
let g:lightline = {'colorscheme': 'jellybeans'}
