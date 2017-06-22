" Vim plugin file
" Purpose:	Create a template for new rmtoo files
" Author:	Mathieu Anquetin <mathieu@anquetin.eu>
" Copyright:	Copyright (C) 2017 Mathieu Anquetin <mathieu@anquetin.eu>
"
" This file is licensed under the MIT license, see COPYING.MIT in
" this source distribution for the terms.
"
" Based on the gentoo-syntax package
"
" Will try to use git to find the user name and email

if &compatible || v:version < 600
    finish
endif

fun! NewReqTemplate()
    let l:paste = &paste
    set nopaste

    " The requirement template

    " Current name conversion comes from Tim Pope's Abolish Plugin
    " https://github.com/tpope/tpope-vim-abolish
    let l:current_file = expand("%:t:r")
    let l:current_name = substitute(l:current_file, '\(\u\+\)\(\u\l\)','\1 \2','g')
    let l:current_name = substitute(l:current_name, '\(\l\|\d\)\(\u\)','\1 \2','g')
    let l:current_name = substitute(l:current_name,'[.-]',' ','g')

    let l:current_user = system("id -un")
    let l:current_date = strftime("%Y-%m-%d")

    0 put ='# Id: ' . l:current_file
    put ='Name: ' . l:current_name
    put ='Type: requirement'
    put ='Invented on: ' . l:current_date
    put ='Invented by: ' . l:current_user
    put ='Description: '
    put ='#Rationale:'
    put ='#Note:'
    put ='Owner: '
    put ='Topic: '
    put ='#Class: detailable'
    put ='#Solved by:'
    put ='Status: not done'
    put ='#Priority:'
    put ='#Effort estimation:'
    put ='#Constraints:'

    " Go to the first place to edit
    0
    /^Description: /
    exec "normal $"

    if paste == 1
        set paste
    endif
endfun

if !exists("g:rmtoo_create_on_empty")
    let g:rmtoo_create_on_empty = 1
endif

" disable in case of vimdiff
if v:progname =~ "vimdiff"
    let g:rmtoo_create_on_empty = 0
endif

augroup NewRmtooFile
    au BufNewFile *.req
                \ if g:rmtoo_create_on_empty |
                \    call NewReqTemplate() |
                \ endif
augroup END

