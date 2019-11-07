" Avoid modeline vulnerability (https://medium.com/@soji256/which-versions-of-vim-are-affected-by-the-modeline-vulnerability-fd7660a9d069)
set nomodeline

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
colorscheme gruvbox
let g:gruvbox_italic = 1

" Toggle night mode
function NightModeToggle()
    let theme_name = system("gsettings get org.gnome.desktop.interface gtk-theme")
    if theme_name[1:-3] == 'Adwaita'
        set background=light
        highlight Normal ctermfg=white ctermbg=256
        highlight CursorLine ctermbg=255
        highlight CursorLineNr ctermbg=255
        " Fix gutter column background in light theme
        highlight SignColumn ctermbg=none
        highlight GruvboxRedSign ctermbg=none
        highlight GruvboxYellowSign ctermbg=none
        highlight GruvboxAquaSign ctermbg=none
        highlight GruvboxGreenSign ctermbg=none
    else
        set background=dark
    endif
endfunction
nmap <silent> <Leader>nm mz:execute NightModeToggle()<CR>'z
call NightModeToggle()

" Spell checking
setlocal spell
set spelllang=it,en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

"====[Damian Conway's VIM add-ons]====
source ~/.vim/dconway/plugin/automkdir.vim
source ~/.vim/dconway/plugin/betterdigraphs_utf8.vim
source ~/.vim/dconway/plugin/comment_toggle.vim
source ~/.vim/dconway/plugin/dragvisuals.vim
source ~/.vim/dconway/plugin/undowarnings.vim

"=====[Toggle comments for TeX files]
autocmd FILETYPE tex let b:CT_EOL_COMMENT = '%'

"====[Highlight the 80 column limit on overflowing character]
highlight ColorColumn ctermbg=grey ctermfg=black
call matchadd('ColorColumn', '\%81v', 100)

"====[Blink current search match match in red]
highlight WhiteOnRed ctermbg=red ctermfg=black

function! HLNext (blinktime)
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#'.@/
    let ring = matchadd('WhiteOnRed', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction

nnoremap <silent> n n:call HLNext(0.3)<cr>
nnoremap <silent> N N:call HLNext(0.3)<cr>

"====[Remap ; on : (useful on English keyboard layout)]
nnoremap  ;  :

"====[Swap visual mode with visual block]
nnoremap    v  <C-V>
nnoremap <C-V>    v
vnoremap    v  <C-V>
vnoremap <C-V>    v

"====[Remap CTRL+K to betterdigraphs plugin]
inoremap <expr> <C-K> BDG_GetDigraph()

"====[Mappings for the dragvisuals plugin]
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

" Vimtex specific settings
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_compiler_progname='nvr'

" Ultisnips specific settings
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
let g:airline#extensions#tabline#tab_min_count = 2
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
let g:airline_symbols.notexists = '  '
let g:airline_symbols.dirty='  '
let g:airline_symbols.whitespace = 'Ξ'

" ALE linting setup
let g:ale_lint_on_text_changed = 'never'
let g:ale_list_window_size = 5
let g:ale_sign_warning = ' '
let g:ale_sign_error = 'ﱥ '

" Setup for bottom bar plugin
set laststatus=2    " Always display the statusline in all windows
set showtabline=1   " Show the tabline  if there is more than one tab
set noshowmode      " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" Toggle TAB to 4 spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
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

" Toggle line numbers
function NumToggle()
    if &relativenumber
        set norelativenumber
        set nonumber
        echo "  Line numbers hidden"
    else
        set relativenumber
        set number
        echo "  Line numbers visible"
    endif
endfunction
nmap <Leader>nn mz:execute NumToggle()<CR>'z

" Use system clipboard
set clipboard=unnamedplus

" Show hidden characters
set list listchars=eol:↲,tab:⋄∙,trail:¬,extends:→,precedes:←,nbsp:␣

" Recursive fuzzy file search
set path+=**
set wildmenu

" NetRW file manager settings (built-in)
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3

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
nmap <Leader>an :ALENext<CR>
nmap <Leader>aN :ALEPrevious<CR>

" Remap <leader>l + 1, 2, … to spell languages
nnoremap <leader>l0 :set spelllang=it,en_gb<CR>:echo "  All languages enabled"<CR>
nnoremap <leader>l1 :set spelllang=it<CR>:echo "  Language is 'Italian'"<CR>
nnoremap <leader>l2 :set spelllang=en_gb<CR>:echo "  Language is 'English (GB)'"<CR>
