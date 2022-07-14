        syntax on
        set tabstop=2

        set breakindent
        set breakindentopt=shift:2
        set expandtab
        "make completion more aware 
        set infercase 
        set wildmenu
        set wildmode=full
        set ai
        set relativenumber
        set hlsearch
        set ruler
        " repeat an existing line 
        highlight Comment ctermfg=green
        "normal bindings 
        nnoremap vc :vs ~/.vimrc<CR>
        nnoremap tt :NERDTree<CR>
        nnoremap ;w :w<CR>
        nnoremap ;q :wq!<CR>
        nnoremap <return> :noh<return><esc>
        nnoremap cp :call CompileRunGcc()<CR>
        nnoremap <C-h> :tabprevious<CR>
        nnoremap <C-l> :tabnext<CR>
        "nnoremap <C-h> :RandomColorScheme<CR> 
        "vim Plugs 
        call plug#begin()
        Plug 'ycm-core/YouCompleteMe'
        nnoremap cp :call CompileRunGcc()<CR>
        func! CompileRunGcc()
                exec "w"
                exec "!clear"
                if &filetype == 'c'
                        exec "!gcc -g % -o %<"
                        exec "!time ./%<"
                elseif &filetype == 'cpp'
                        exec "!g++ % -o %<"
                        exec "!time ./%<"
                elseif &filetype == 'java'
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
                        exec "!pandoc % -f markdown -t html > %.html"
                        exec "!firefox %.html"
                        exec "!rm %.html"
                elseif &filetype == 'lua'
                        exec "!time lua %"
                endif 
        endfunc
        Plug 'http://github.com/morhetz/gruvbox'
        Plug 'tyru/open-browser.vim' " opens url in browser
        Plug 'tpope/vim-surround' " Surrounding ysw)
        Plug 'https://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle' }
        Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
        Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
        Plug 'honza/vim-snippets'
        Plug 'tmsvg/pear-tree'
        " let Vundle manage Vundle, required
        Plug 'preservim/nerdtree'
        Plug 'morhetz/gruvbox'
        Plug 'grvcoelho/vim-javascript-snippets'
        Plug 'xolox/vim-colorscheme-switcher'
        Plug 'xolox/vim-misc'
call plug#end()
"Exit vim if NERDTree is the only window remaining in the only tab
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
:set incsearch
"much better default behavior for editing line above cursor 
"colorscheme neodark 
"colorscheme materialbox 
"colorscheme alduin 
inoremap {<CR> {<CR>}<C-o>O
set foldmethod=indent
set foldlevel=99
