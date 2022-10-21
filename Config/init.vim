set number
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-r> :QuickRun <CR>
set encoding=UTF-8
call plug#begin()
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ap/vim-css-color'
Plug 'thinca/vim-quickrun'
Plug 'KabbAmine/vCoolor.vim'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
\"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
autocmd InsertEnter  :let @/="" | :nohl
:set clipboard=unnamed
:set autoindent
:syntax on
:set spell
let g:airline_deus_bg='dark'
