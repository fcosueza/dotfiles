" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Set filetype off for Vundle pluggins manager
filetype off

" Set runtime path for Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin list
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'            " exploring dirs and files
Plugin 'flazz/vim-colorschemes'         " adding some color schemes
Plugin 'vim-airline/vim-airline-themes' " airline themes
Plugin 'tpope/vim-surround'             " fast editing quotes, parenthesis, tags...
Plugin 'jiangmiao/auto-pairs'           " automatic closing quotes, parenthesis...
Plugin 'vim-airline/vim-airline'        " add state bar at the bottom
Plugin 'mattn/emmet-vim'                " abbreviations expansion for fast coding
Plugin 'hail2u/vim-css3-syntax'         " css3 syntax highlighting
Plugin 'othree/html5.vim'               " html5 syntax plugin
Plugin 'pangloss/vim-javascript'        " javascript syntax plugin
Plugin 'rust-lang/rust.vim'             " rust language support
Plugin 'Valloric/YouCompleteMe'         " autocomplete plugin
Plugin 'tpope/vim-fugitive'             " git integration
Plugin 'w0rp/ale'                       " Asynchronous Lint Engine

" Vundle block ends
call vundle#end()

" Restore filetype on
filetype on

" Indent plugin start
filetype plugin indent on

" YouCompleteMe options
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_rust_src_path = $RUST_SRC_PATH
set completeopt -=preview

" ALE options
let g:ale_linters = {'css': ['stylelint'], 'html': ['htmlhint'], 'javascript': ['eslint'], 'rust': ['cargo']}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines',
\         'trim_whitespace']
\}
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1

" Uncomment the next line to make Vim more Vi-compatible
" options, so any other options should be set AFTER setting 'compatible'.
set nocompatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though
set mouse=a	    	" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" HTML tag indentation setting
let g:html_indent_inctags="html, body, head, tbody, span, b, a, div"

" Key mapping
map <C-n> :NERDTreeToggle<CR>
let g:user_emmet_leader_key=','

" General vim  options
set t_Co=256        " set terminal color to 256
set autoindent      " autoindentation
set number          " numbering lines
set tabstop=2       " 2 is enough
set shiftwidth=2    " 2 is enough
set expandtab       " don't use tab character
set colorcolumn=120 " max code line lenght of 120
set ttimeoutlen=50  " reducing delay

" Set colorscheme
highlight ColorColumn ctermbg = yellow
