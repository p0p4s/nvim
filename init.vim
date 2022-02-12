" ### Plugins
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

" ### Optik
colorscheme gruvbox

" ### Optionen
set number
set relativenumber
set showmode
set cursorline
set updatetime=300
set laststatus=2
set cmdheight=2
set linebreak
set tabstop=2
set softtabstop=2
set shiftwidth=2
set linebreak
" #### coc options
set nobackup
set nowritebackup

" ### keymap
" #### coc
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

" #### coc-explorer
:nmap <space>ee <Cmd>CocCommand explorer<CR>
:nmap <space>eb <Cmd>CocCommand explorer --preset buffer<CR>
:nmap <space>er <Cmd>CocCommand explorer --preset .nvim<CR>
:nmap <space>eh <Cmd>CocCommand explorer --preset home<CR>	

" #### coc-yank
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" ### coc-explorer
let g:coc_explorer_global_presets = {
	\'buffer': {'sources': [{'name': 'buffer', 'expand': v:true}]},
	\'.nvim': {'root-uri': '~/.config/nvim'},
	\'home': {'root-uri': '~/'},
\}

