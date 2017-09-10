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
" set showcmd

""""""" Currently broken
" toggle paste mode
" set pastetoggle=<F3>

" toggle spellcheck
" :map <F4> :setlocal spell! spelllang=en_us<cr>
" imap <F4> <C-o>:setlocal spell! spelllang=en_us<cr>

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
