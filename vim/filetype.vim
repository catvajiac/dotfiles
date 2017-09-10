if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  " au! commands to set the filetype
  au BufRead,BufNewFile *.cminor setfiletype cminor
  au BufRead,BufNewFile *.c setfiletype c
augroup END
