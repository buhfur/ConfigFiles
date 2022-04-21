let g:go_highlight_trailing_whitespace_error=0
set mouse=a
set ttymouse=xterm
set nocompatible              " be iMproved, required
set number
set clipboard=unnamedplus
set background=dark
"colorscheme onedark
syntax on
"filetype off 
filetype plugin on 
"smart indent 
"set smartindent:
set cindent

nnoremap ;w :w<CR>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
:set incsearch

nnoremap cp :call CompileRunGcc()<CR>
func! CompileRunGcc()
	
	exec "!clear"
	if &filetype == 'c'
		exec "!gcc -Wall -g % -o %<"
		exec "!time %<"

	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java -cp %:p:h %:t:r"
	elseif &filetype == 'sh'
		exec "!time bash %"
	elseif &filetype == 'python'
		exec "!time python3 %"
	elseif &filetype == 'html'
		exec "!firefox % &"
	elseif &filetype == 'go'
		exec "!go build %<"
		exec "!time go run %"
	elseif &filetype == 'md'
		exec "!pandoc -s -o %.html %"
		"pandoc -o output.html input.txt
		exec "!firefox %"
	elseif &filetype == 'rs'
		exec "!cargo build %<"
		exec "!cargo run %<"
	endif
endfunc

"Easy access to vimrc
nnoremap vc :vsplit ~/.vimrc<cr>

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
call plug#end()  

map <C-L> gt
map <C-H> gT


"my custom mappings for auto completion with brackets and quotes
map tt :NERDTreeToggle<CR>
inoremap {<space> {<space>}<Esc>hi
inoremap {<CR> {<CR>}<Esc>ko
"copy to system clipboard
noremap <C-c> "+y
vnoremap <C-c> "+y
" boilerplate code for common langs I use 
nnoremap <leader>c i#include<stdio.h><Esc>o<CR>int main(void){<Esc>o<Esc>oreturn 0;<Esc>o}<Esc>kki
nnoremap <C-j> iclass <ESC>"%pxxxxxa {<ESC>opublic static void main(String args[]){<Esc>o<Esc>o}<Esc>o}<Esc>kki<Tab><Tab>

nnoremap cpf i#include<iostream><Esc>ousing namespace std;<Esc>o<CR>int main(){<Esc>o<Esc>oreturn 0;<Esc>o}<Esc>kki
