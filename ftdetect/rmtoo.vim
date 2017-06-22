" Vim filetype detection file
" Language:     Rmtoo
" Author:       Mathieu Anquetin <mathieu@anquetin.eu>
" Copyright:    Copyright (C) 2017 Mathieu Anquetin <mathieu@anquetin.eu>
" Licence:      You may redistribute this under the same terms as Vim itself
"
" This sets up the syntax highlighting for Rmtoo files, like .req, .tec, .tic
" and .ctr

if &compatible || version < 600
    finish
endif

" .req, .tec, .tic, .ctr
au BufNewFile,BufRead *.{req,tec,tic,ctr}  set filetype=rmtoo
