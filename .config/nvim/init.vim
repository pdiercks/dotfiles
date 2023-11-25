" auto-install vim-plug 
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 	
    autocmd VimEnter * PlugInstall 
endif

"""""""""""""""""""""""""""""""""""""""""
" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', { 'do' : { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'itchyny/lightline.vim'
Plug 'SirVer/ultisnips'
Plug 'vim-syntastic/syntastic'
Plug 'lervag/vimtex'
Plug 'morhetz/gruvbox'
" load snakemake plugin if filename is 'Snakefile'
if @% == 'Snakefile'
    Plug 'snakemake/snakemake', {'rtp': 'misc/vim'}
endif
Plug 'LukeGoodsell/nextflow-vim', {'for': ['.nf']}

call plug#end()

"""""""""""""""""""""""""""""""""""""""""
" Mappings
let mapleader = ' '
let maplocalleader = ' '

" switch CWD to open buffer
nmap <leader>cd :cd %:p:h<CR>:pwd<CR>

" making moving around easier
nmap <leader>w <C-w>

" Show buffers and wait for buffer to go to
nnoremap <leader>b :ls<CR>:b<space>

" find files under cwd
nnoremap <leader>f :Files<CR>

" termial mode mappings
if has('nvim')
	tnoremap <Esc> <C-\><C-n>
	tnoremap <C-v><Esc> <Esc>
endif

" EasyAlign mappings
" start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" start interactive EasyAlign for motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""
" Behaviour
set hidden
set clipboard+=unnamed
set linebreak
set noautoindent

" Indentation
set tabstop=4
set shiftwidth=4
set expandtab

"""""""""""""""""""""""""""""""""""""""""
" python specific
let g:python3_host_prog = '/home/pdiercks/miniconda3/envs/pynvim/bin/python'
 
"""""""""""""""""""""""""""""""""""""""""
" vimtex
let g:vimtex_version_check = 1
let g:vimtex_compiler_enabled = 1
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = 'latex'
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_compiler_latexmk = {
\ 'build_dir' : '',
\ 'callback' : 1,
\ 'continuous' : 1,
\ 'executable' : 'latexmk',
\ 'hooks' : [],
\ 'options' : [
\   '-verbose',
\   '-file-line-error',
\   '-synctex=1',
\   '-interaction=nonstopmode',
\ ],
\}

"""""""""""""""""""""""""""""""""""""""""
" Colors
set termguicolors
set background=dark
colorscheme gruvbox

"""""""""""""""""""""""""""""""""""""""""
" status line
set noshowmode
let g:lightline = {
    \ 'colorscheme': 'gruvbox'
    \ }

"""""""""""""""""""""""""""""""""""""""""
" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:ultisnips_python_style="numpy"
let g:ultisnips_python_quoting_style="double"

"""""""""""""""""""""""""""""""""""""""""
" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_rst_checkers = ['rstcheck']
let g:syntastic_tex_checkers = ['chktex']
