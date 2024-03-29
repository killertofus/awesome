set number
set encoding=UTF-8
call plug#begin()
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ap/vim-css-color'
Plug 'thinca/vim-quickrun'
Plug 'KabbAmine/vCoolor.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lua/plenary.nvim'
Plug 'xiyaowong/transparent.nvim'
Plug 'vim-scripts/dbext.vim'
Plug 'davidgranstrom/nvim-markdown-preview'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5'}
call plug#end()
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-z> :NERDTreeFind<CR>
nnoremap <C-r> :QuickRun <CR>
nnoremap / <Cmd>Telescope live_grep<CR>
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
colorscheme slate
set list listchars=tab:>\ ,trail:-,eol:$
hi Normal guibg=NONE ctermbg=NONE

