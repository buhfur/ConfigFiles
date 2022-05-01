syntax on

set tabstop=2

set shiftwidth=2

set expandtab

set ai

set number

set hlsearch

set ruler

colorscheme peachpuff

highlight Comment ctermfg=green


nnoremap ;w :w<CR>
nnoremap ;q :q<CR>
nnoremap <return> :noh<return><esc>

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

call plug#begin()
 
 Plug 'tyru/open-browser.vim' " opens url in browser
 Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
 Plug 'https://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle' }
 Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
 Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
  
call plug#end()

set foldmethod=indent
set foldlevel=99
