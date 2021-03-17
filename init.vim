if empty(glob('$HOME/AppData/Local/nvim/autoload/plug.vim'))
    silent !curl -fLo $HOME/AppData/Local/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('$HOME/AppData/Local/nvim/plugged')

    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'preservim/nerdtree'
    Plug 'rafi/awesome-vim-colorschemes'
    Plug 'rust-lang/rust.vim'
    Plug 'airblade/vim-rooter'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install -all' }
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

call plug#end()

"------------------------------------------------
"leader
let mapleader=" "
nnoremap <SPACE> <Nop>
vnoremap <SPACE> <Nop>
xnoremap <SPACE> <Nop>

"------------------------------------------------
"fzf
nnoremap <leader>f	:Files<Cr>

"------------------------------------------------
" syntax 
syntax enable
filetype plugin indent on
" autocmd InsertEnter,InsertLeave * set cul!

"------------------------------------------------
" window manage
nnoremap <leader>q			<C-w>c
nnoremap <leader><leader>	<c-^>

"------------------------------------------------
" tab
set smartindent
set tabstop=4
set expandtab
set shiftwidth=4

"------------------------------------------------
" line number
set number relativenumber

"------------------------------------------------
" disable auto comment next line
set formatoptions-=cro

"------------------------------------------------
" rust vim
let g:rustfmt_autosave = 1

"------------------------------------------------
" rust coc
" https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim

" Give more space for displaying messages.
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Symbol renaming.
nmap <F2>	<Plug>(coc-rename)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> <S-F8> 		<Plug>(coc-diagnostic-prev)
nmap <silent> <F8>	<Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>a	<Plug>(coc-codeaction)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nnoremap <leader>t 	:<C-u>CocList -I symbols<CR>
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

"------------------------------------------------
" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

"------------------------------------------------
" nerdtree config
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"------------------------------------------------
" colorschemes
colo happy_hacking

"------------------------------------------------
" window like
source $HOME/AppData/Local/nvim/mswin.vim
set mouse=a
