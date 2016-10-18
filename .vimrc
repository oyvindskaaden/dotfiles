set nocompatible              " required
filetype off                  " required
filetype plugin on

" Plugins {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'lifepillar/vim-solarized8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'terryma/vim-expand-region'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vimwiki/vimwiki'
Plugin 'rking/ag.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'junegunn/goyo.vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'JamshedVesuna/vim-markdown-preview'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}
" Leader {{{
let mapleader = "\<Space>"

nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>z :wq<CR>
nnoremap <Leader>g :Goyo<CR>
nnoremap <Leader>n :set nospell<CR>

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" }}}
" Colors {{{
" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256
syntax on
colorscheme onedark
let python_highlight_all=1
syntax on
set nospell

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
""If you're using tmux version 2.2 or later, you can remove the outermost$TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
      "For Neovim 0.1.3 and 0.1.4 <https://github.com/neovim/neovim/pull/2198 >
      let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 <https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162>
  "Based on Vim patch 7.4.1770 (`guicolors` option) <https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd>
  " <https://github.com/neovim/neovim/wiki/Following-HEAD#20160511>
  if (has("termguicolors"))
      set termguicolors
  endif
endif
" }}} 
" Split {{{
set splitbelow
set splitright
" }}}
" Folding {{{
"Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the leader F
nnoremap <leader>f za
let g:SimpylFold_docstring_preview=1
" }}}
" Tabs & Spaces {{{
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

set encoding=utf-8
" }}}
" NERDTree {{{
map <C-n> :NERDTreeToggle<CR>
" }}}
" UI {{{
set nu
set rnu
"set cursorline
" }}}
" CTRLP {{{
let g:ctrlp_show_hidden = 1

" }}}
" Powerline {{{
"set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
"set laststatus=2
" }}}
" AirLine {{{
""let g:airline_theme='onedark'
"```vim
"let g:airline_theme='onedark'
"```
"AirlineTheme powerlineish
let g:airline_powerline_fonts = 2
set laststatus=2
set encoding=utf-8
set guifont=Source\ Code\ Pro\ for\ Powerline "make sure to escape the spaces in the name properly
" }}}
" Search {{{
" Search with / , replace with cs , n.n. to replace following
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>
" }}}
" Paste {{{
vnoremap <silent> y y`]
vnoremap <silent> p p`]
noremap gV `[v`]
" }}}
" Navigation {{{
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enter is G, backspace is gg
nnoremap <CR> G
nnoremap <BS> gg

" Fixes backspace
set backspace=2
" }}}
" Organization {{{
set foldmethod=marker
set foldlevel=0
set modelines=1
" }}}
" VimWiki {{{
" let g:vimwiki_list = [{'path': '$HOME/Dropbox/notes', "path_html": '~/Dropbox/notes/notes_html/index.html', "syntax": 'markdown', "ext": '.md'}]

let g:vimwiki_list = [{"path": '$HOME/ownCloud/vimWiki', "path_html": '$HOME/ownCloud/vimWiki_html', "syntax": 'markdown', "ext": '.md', "css_file": '$HOME/ownCloud/vimWiki_html/style.css'}]

autocmd BufNewFile * :set nospell
" }}}
" MarkdownPreview {{{
let vim_markdown_preview_github=1
" }}}
" Fonts {{{
if has('gui_running')
  set guifont=Consolas:h10
endif 
" }}}
" Swap File{{{
set shortmess+=A
" }}}
