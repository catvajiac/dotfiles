" set tab key/spacing
set backspace=indent,eol,start
set tabstop=2
set softtabstop=2
set expandtab
set autoindent
set tw=79
" ignore case except with capital letters
set ignorecase
set smartcase
set title
set background=dark

" other
set showmatch
set relativenumber
set noswapfile

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

" set text width
augroup Text
    autocmd!
    autocmd FileType text setlocal textwidth=80
augroup END

" Highlight current line
set cursorline
highlight CursorLine cterm=bold

" Commenting blocks of code
" http://stackoverflow.com/questions/1676632/whats-a-quick-way-to-comment-uncomment-lines-in-vim
augroup Comment
    autocmd!
    autocmd FileType c,cpp,java,scala,go  let b:comment_leader = '// '
    autocmd FileType sh,ruby,python       let b:comment_leader = '# '
    autocmd FileType conf,fstab           let b:comment_leader = '# '
    autocmd FileType tex                  let b:comment_leader = '% '
    autocmd FileType mail                 let b:comment_leader = '> '
    autocmd FileType vim                  let b:comment_leader = '" '
    autocmd FileType scheme               let b:comment_leader = ';; '
    noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
    noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
augroup END

syntax on
let $t_Co=256
colorscheme haron-prime
inoremap jk <ESC>
vnoremap jk <ESC>
