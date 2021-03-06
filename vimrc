runtime! debian.vim

if has("syntax")
  syntax on
endif

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Vim-plug/*{{{*/
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'calviken/vim-gdscript3'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
"/*}}}*/
" Editor configs, small tweaks here and there "/*{{{*/
let mapleader = ","
set path+=**		" Recursive path search
set number		" Line indexing
set relativenumber	" Display relative line
set title		" Display filename on title bar
set ignorecase		" Search case-insensitive
set smartcase		" Search case-sensitive when using capital letter
set hlsearch incsearch        " Highlight search results
set autoindent		" Auto indent on newline
set tabstop=4
set softtabstop=4       " Remove 4 space when press <BS> to delete a <Tab>
set shiftwidth=4
set expandtab
set tags=tags
set foldmethod=syntax
set foldcolumn=4
set statusline=%F%=[%4l/%4L]
color molokai
let g:netrw_liststyle = 3
let g:netrw_banner = 0
"/*}}}*/
" Mappings
" For all FileType "/*{{{*/

" Rebind esc "/*{{{*/
inoremap <esc> <nop>

nnoremap <leader> <nop>
inoremap <leader><leader> <esc>
vnoremap <leader><leader> <esc>
cnoremap <leader><leader> <esc>

inoremap jk <esc>
cnoremap jk <esc>
"/*}}}*/
" Toggle: relativenumber, hlsearch "/*{{{*/
inoremap <leader>re <esc>:setlocal<space>relativenumber!<cr>a
nnoremap <leader>re :setlocal<space>relativenumber!<cr>
inoremap <leader>hl <esc>:call ToggleHlSearch()<cr>a
nnoremap <leader>hl :call ToggleHlSearch()<cr>

function! ToggleHlSearch()
   if &hlsearch
        setlocal nohlsearch
   else
        setlocal hlsearch incsearch
   endif
endfunction
"/*}}}*/
" Open and source vimrc" "/*{{{*/
nnoremap <leader>rc :tabedit $VIM/vimrc<cr>
nnoremap <leader>src :source $VIM/vimrc<cr>
"/*}}}*/
" Template files "/*{{{*/
nnoremap <leader>lorem :-1read ~/.vim/templates/others/lorem.txt<CR>
nnoremap <leader>table :read ~/.vim/templates/others/table-throw.txt<CR>
"/*}}}*/
" Move to markers: <++> "/*{{{*/
inoremap <leader>m <esc>/<++><cr>4cl
nnoremap <leader>m /<++><cr>4x
"/*}}}*/
" Move to markers (without deleting it)/*{{{*/
inoremap <leader>M <esc>/<++><cr>
nnoremap <leader>M /<++><cr>
"/*}}}*/
" Create markers: <++> "/*{{{*/
inoremap <leader>cm <++>
nnoremap <leader>cm i<++><esc>
inoremap <leader>co <esc>mmo<++><esc>`ma
nnoremap <leader>co mmo<++><esc>`m
inoremap <leader>cO <esc>mmO<++><esc>`ma
nnoremap <leader>cO mmO<++><esc>`m
"/*}}}*/
" Remove markers without jumping: <++> "/*{{{*/
inoremap <leader>rm <esc>mm/<++><cr>4x`ma
nnoremap <leader>rm mm/<++><cr>4x`m
inoremap <leader>rM <esc>mm?<++><cr>4x`ma
nnoremap <leader>rM mm?<++><cr>4x`m
"/*}}}*/
" Auto closing brackets in insert mode "/*{{{*/
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

inoremap ) <right>
inoremap ] <right>
inoremap } <right>

inoremap {<CR> {<CR>}<++><ESC>O<tab>
inoremap (<CR> (<CR>)<++><ESC>O<tab>
inoremap [<CR> [<CR>]<++><ESC>O<tab>
"/*}}}*/
" Wrap whole word in bracket or qoutes "/*{{{*/
inoremap <leader>" <esc>viw<esc>a"<esc>bi"<esc>leli
inoremap <leader>' <esc>viw<esc>a'<esc>bi'<esc>leli
inoremap <leader>( <esc>viw<esc>a)<esc>bi(<esc>leli
inoremap <leader>[ <esc>viw<esc>a]<esc>bi[<esc>leli
inoremap <leader>{ <esc>viw<esc>a}<esc>bi{<esc>leli

nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>( viw<esc>a)<esc>bi(<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>bi[<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>bi{<esc>lel
"/*}}}*/
" Wrap whole text area in bracket or qoutes "/*{{{*/
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>
"/*}}}*/
" Scrolling using j and k "/*{{{*/
nnoremap <C-k> <C-y>
nnoremap <C-j> <C-e>
inoremap <C-k> <C-x><C-y>
inoremap <C-j> <C-x><C-e>
"/*}}}*/
" Splitting windows "/*{{{*/
nnoremap <leader>w <C-w>
nnoremap <leader>wv <C-w>v<C-w>l
nnoremap <leader>ws <C-w>s<C-w>j
nnoremap <leader>wo :only<cr>
"/*}}}*/
" Add newline from normal mode "/*{{{*/
nnoremap <leader>o mmo<esc>`m
nnoremap <leader>O mmO<esc>`m
"/*}}}*/
" Open new tab and switch tab "/*{{{*/
nnoremap <leader>t :tabedit<cr>
nnoremap gl gt
nnoremap gh gT
"/*}}}*/
" Find file with name/*{{{*/
nnoremap <leader>f :find<space>
" /*}}}*/
" Indent whole file "/*{{{*/
inoremap <leader>g <esc>mmgg=G`ma
nnoremap <leader>g mmgg=G`m
"/*}}}*/
" Break line/*{{{*/
nnoremap K i<cr><esc>
" /*}}}*/
" Toggle paste mode "/*{{{*/
inoremap <leader>p <esc>:setlocal<space>paste!<cr>:setlocal<space>paste?<cr>a
nnoremap <leader>p :setlocal<space>paste!<cr>:setlocal<space>paste?<cr>
"/*}}}*/
" Replace Ctrl-n for autocomplete, cuz it hurts my wrist "/*{{{*/
inoremap JK <C-n>
inoremap KJ <C-p>
"/*}}}*/
" Search for definitions using tags/*{{{*/
nnoremap gp <c-]>
" /*}}}*/
" Move to older/newer cursor position "/*{{{*/
nnoremap go <c-o>
nnoremap gi <c-i>
"/*}}}*/
" Rearrange tabs/*{{{*/
nnoremap t- :tabm -
nnoremap t+ :tabm +
" /*}}}*/
" Move a window to a new tab/*{{{*/
nnoremap <leader>wt <C-w><S-t>
"/*}}}*/

"/*}}}*/
" For specific FileType "/*{{{*/
" Filetype Vim " /*{{{*/
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
	autocmd FileType vim setlocal foldcolumn=4
augroup end
" /*}}}*/
" Filetype Html "/*{{{*/
augroup filetype_html
    autocmd!
    autocmd FileType html nnoremap <buffer> <leader>html :-1read ~/.vim/templates/html/index.html<CR>3jwf>a
    autocmd FileType html inoremap <buffer> /> />
    autocmd FileType html inoremap <buffer> > ><esc>F<lyiwA</><esc>PF<i
augroup end
"/*}}}*/
" Filetype Javascript " /*{{{*/
augroup filetype_js
	autocmd!
    autocmd FileType javascript inoremap <buffer> <expr> <leader>/ getline('.') =~ '^\s*//' ? "\<esc>mm\^dw`ma" : "\<esc>mmI//<space>\<esc>`ma"
    autocmd FileType javascript nnoremap <buffer> <expr> <leader>/ getline('.') =~ '^\s*//' ? "mm\^dw`m" : "mmI//<space>\<esc>`m"
    autocmd FileType javascript iabbrev <buffer> fori for (let i = 0; i <; i++) {<cr><++><up><right><right><right><right><right><right><right><right><right><right><right>
    autocmd FileType javascript iabbrev <buffer> forj for (let j = 0; j <; j++) {<cr><++><up><right><right><right><right><right><right><right><right><right><right><right>
augroup end
"/*}}}*/
" Filetype Python " /*{{{*/
augroup filetype_py
	autocmd!
    autocmd FileType python inoremap <buffer> <expr> <leader>/ getline('.') =~ '^\s*#' ? "\<esc>mm\^dw`ma" : "\<esc>mmI#<space>\<esc>`ma"
    autocmd FileType python nnoremap <buffer> <expr> <leader>/ getline('.') =~ '^\s*#' ? "mm\^dw`m" : "mmI#<space>\<esc>`m"
    autocmd FileType python vnoremap <buffer> <leader>/ :normal!<space>I#<space><cr>
    autocmd FileType python vnoremap <buffer> <leader>. :normal!<space>^dw<cr>
augroup end
" /*}}}*/
" Filetype Php "/*{{{*/
augroup filetype_php
    autocmd FileType php nnoremap <buffer> <leader>php :-1read ~/.vim/templates/php/bracket.php<CR>o
    autocmd FileType php inoremap <buffer> <expr> <leader>/ getline('.') =~ '^//' ? "\<esc>mm\^2x`ma" : "\<esc>mmI//\<esc>`ma"
    autocmd FileType php nnoremap <buffer> <expr> <leader>/ getline('.') =~ '^//' ? "mm\^2x`m" : "mmI//\<esc>`m"
augroup end
"/*}}}*/
" Filetype Cpp /*{{{*/
augroup filetype_cpp
    autocmd FileType cpp inoremap <buffer> <expr> <leader>/ getline('.') =~ '^\s*//' ? "\<esc>mm\^dw`ma" : "\<esc>mmI//<space>\<esc>`ma"
    autocmd FileType cpp nnoremap <buffer> <expr> <leader>/ getline('.') =~ '^\s*//' ? "mm\^dw`m" : "mmI//<space>\<esc>`m"
    autocmd FileType cpp vnoremap <buffer> <leader>/ :normal!<space>I//<space><cr>
    autocmd FileType cpp vnoremap <buffer> <leader>. :normal!<space>^dw<cr>
    autocmd FileType cpp iabbrev <buffer> fori for (int i = 0; i <; i++) {<cr><++><up><right><right><right><right><right><right><right><right><right><right><right>
    autocmd FileType cpp iabbrev <buffer> forj for (int j = 0; j <; j++) {<cr><++><up><right><right><right><right><right><right><right><right><right><right><right>
augroup end
"/*}}}*/
" Filetype GDscript " /*{{{*/
augroup filetype_gdscript3
	autocmd!
    autocmd FileType gdscript3 inoremap <buffer> <expr> <leader>/ getline('.') =~ '^\s*#' ? "\<esc>mm\^dw`ma" : "\<esc>mmI#<space>\<esc>`ma"
    autocmd FileType gdscript3 nnoremap <buffer> <expr> <leader>/ getline('.') =~ '^\s*#' ? "mm\^dw`m" : "mmI#<space>\<esc>`m"
    autocmd FileType gdscript3 vnoremap <buffer> <leader>/ :normal!<space>I#<space><cr>
    autocmd FileType gdscript3 vnoremap <buffer> <leader>. :normal!<space>^dw<cr>
augroup end
" /*}}}*/
"/*}}}*/
