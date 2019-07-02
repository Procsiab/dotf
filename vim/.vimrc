" Vundle plugin manager stuff
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Themes
Plugin 'morhetz/gruvbox'

" Syntax and tools
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'w0rp/ale'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'easymotion/vim-easymotion'

" Utilities
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'mhinz/vim-startify'

" LaTeX plugins
Plugin 'lervag/vimtex'
Plugin 'sirver/ultisnips'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" Theme specific settings
set t_Co=256
set encoding=utf-8
syntax on
set cursorline
set relativenumber
set number
set background=dark
colorscheme gruvbox
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_improved_warnings = 1

" Spell checking
setlocal spell
set spelllang=it,en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Vimtex specific settings
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_compiler_progname='nvr'

" Ultrasnips specific settings
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetDirectories=["~/.vim/UltiSnips", "UltiSnips"]

" GitGutter specific settings
let g:gitgutter_sign_added = ' '
let g:gitgutter_sign_modified = ' '
let g:gitgutter_sign_removed = ' '
let g:gitgutter_sign_removed_first_line = ' '
let g:gitgutter_sign_modified_removed = ' '

" Startify specific settings
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['    Recent']    },
      \ { 'type': 'dir',       'header': ['    '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   ﲵ Sessions']   },
      \ ]
let g:startify_files_number = 5
let g:startify_session_number = 5

" Devicons specific settings
let g:webdevicons_enable_startify = 1
let g:webdevicons_enable_airline_statusline = 0
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['tex'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['pdf'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.drone.yml'] = 'ﳣ '
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.git'] = ' '
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.gitignore'] = ' '
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.gitmodules'] = ' '

" NerdTree Git plug-in specific settings
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : " ",
    \ "Staged"    : " ",
    \ "Untracked" : " ",
    \ "Renamed"   : "ﱴ ",
    \ "Unmerged"  : "𥉉",
    \ "Deleted"   : " ",
    \ "Dirty"     : " ",
    \ "Clean"     : " ",
    \ 'Ignored'   : " ",
    \ "Unknown"   : " "
    \ }

" Airline settings
let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
" +-----------------------------------------------------------------------------+
" | A | B |                     C                            X | Y | Z |  [...] |
" +-----------------------------------------------------------------------------+
let g:airline_section_z = "%p%% ☰ %l:%v" 
let g:airline_extensions = ['branch', 'tabline', 'ale']

let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#vcs_priority = ["git"]
let g:airline#extensions#branch#format = 2

let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#tabs_label = 'tab'
let g:airline#extensions#tabline#buffers_label = 'buf'

let airline#extensions#ale#warning_symbol = ' '
let airline#extensions#ale#error_symbol = 'ﱥ '
let airline#extensions#ale#open_lnum_symbol = ' '
let airline#extensions#ale#close_lnum_symbol = ''

" Airline Symbols dictionary
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '⎜'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '⎟'
let g:airline_symbols.crypt = ' CR'
let g:airline_symbols.readonly = ' RO'
let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = ' '
let g:airline_symbols.spell = ' '
let g:airline_symbols.notexists = ' '
let g:airline_symbols.dirty=' '
let g:airline_symbols.whitespace = 'Ξ'

" ALE linting setup
let g:ale_lint_on_text_changed = 'never'
let g:ale_list_window_size = 5
let g:ale_sign_warning = ' '
let g:ale_sign_error = 'ﱥ '

" Setup for bottom bar plugin
set laststatus=2    " Always display the statusline in all windows
set showtabline=2   " Always display the tabline, even if there is only one tab
set noshowmode      " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" Toggle TAB to 4 spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
" allow toggling between local and default mode
function TabToggle()
  if &expandtab
    set softtabstop=4
    set noexpandtab
    echo "  TAB character mode"
  else
    set softtabstop=0
    set expandtab
    echo "  4-Spaces mode"
  endif
endfunction
nmap <Leader>tt mz:execute TabToggle()<CR>'z

" Use system clipboard
set clipboard=unnamed

" Show hidden characters
set list listchars=eol:↲,tab:⋄∙,trail:¬,extends:→,precedes:←,nbsp:␣

" Recursive fuzzy file search
set path+=**
set wildmenu

" EasyMotion plug-in mappings
" Move to {char}{char}
nmap <Leader>s <Plug>(easymotion-overwin-f2)
" Move to word
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Remap CTRL + ←/→ to switch between tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Remap CTRL + t to toggle NerdTree plugin
nnoremap <C-t> :NERDTreeToggle<CR>

" Remap CTRL + l, SHIFT + l to go to next/previous ALE warning/error
nnoremap <C-l> :ALENext<CR>
nnoremap <S-l> :ALEPrevious<CR>

" Remap <leader>l + 1, 2, … to spell languages
nnoremap <leader>l0 :set spelllang=it,en_gb<CR>:echo " All languages enabled"<CR>
nnoremap <leader>l1 :set spelllang=it<CR>:echo " Language is 'Italian'"<CR>
nnoremap <leader>l2 :set spelllang=en_gb<CR>:echo " Language is 'English (GB)'"<CR>

" Remap CTRL + F shortcuts for inkscape figures
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/../img/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/../img/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
