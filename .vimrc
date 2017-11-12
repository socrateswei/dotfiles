" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set backspace=indent,eol,start
set fileencodings=ucs-bom,utf-8,default,latin1
set nocompatible
set helplang=en
set history=50
set nomodeline
set printoptions=paper:letter
set ruler  "show the cursor position
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set hlsearch
set incsearch
set showmatch

set shiftwidth=4
set tabstop=4
" set expandtab                   "Always expand tabs to spaces
set softtabstop=4
set pastetoggle=<F7>
set autoindent
set smartindent
set showcmd                     " Display incomplete commands
set scrolloff=7                 " Keep a 7-lines 'lookahead' when scrolling
set wildmenu                    " Show auto-complete matches
set wildignore=*.bdb,*.msu,*.bfi,*.bjk,*.bpk,*.bdm,*.bfm,*.bxi,*.bmi,*.msx,*.lnk,*~,*.bak,*.pyc
set statusline=%<%f%m%r\ %{fugitive#statusline()}%=\|\ Dec:\ %-3b\ Hex:\ 0x%2B\ \|\ %20(%4l,%4c%V\ \|\ %3P%)
set laststatus=2                " Always show the status bar

" Set a decent text width. This makes printouts cleaner, and makes it easier
" to read the files on an 80-column screen (f. ex. a server monitor)
set textwidth=78

" Numbers
set number
set numberwidth=5

" don't clean screen after exiting vim
set t_ti= t_te=

" Tweak for Python
autocmd FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

"Tweak for Make
autocmd FileType make set noexpandtab

"Tweak for HTML
autocmd FileType html set smartindent shiftwidth=2 tabstop=2 softtabstop=2 foldmethod=marker foldmarker=<div,</div>

" Treat JSON as JavaScript
autocmd BufNewFile,BufRead *.json set filetype=javascript

" Jump to the last position when reopening a file
if has("autocmd")
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" auto reload vimrc when editing it
autocmd! BufWritePost .vimrc source ~/.vimrc

" Set <leader>
let mapleader=","

" quickly clear the search string (to clear highlights)
nnoremap <leader><space> :noh<CR>

" new-omni-completion
filetype plugin indent on
set completeopt=longest,menu

" taglist plugin
nnoremap <silent> <F2> :TlistToggle<CR>
let Tlist_WinWidth=30
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

" NERDTree
nnoremap <silent> <F4> :NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif " Open automatically when vim starts up if no files were specified
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" autocmd VimEnter * NERDTree
" autocmd BufEnter * NERDTreeMirror | wincmd l
" autocmd BufEnter * NERDTreeMirror
" autocmd VimEnter * exe 'NERDTree' | wincmd l
" autocmd BufEnter * exe 'NERDTreeMirror' | wincmd l

" CTRL+S saves the buffer
nmap <C-s> :w<CR>

" Close tab
nmap <Leader>w :tabc<CR>


" Ignore case for search operations ...
set ignorecase

" ... but be case sensitive if the search pattern contains uppercase chars
set smartcase

" Tell vim to remember certain things when we exit
" '10 : marks will be remembered for up to 10 previously edited files
" "100 : will save up to 100 lines for each register
" :20 : up to 20 lines of command-line history will be remembered
" % : saves and restores the buffer list
" n... : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo


" cool~
"inoremap @date <C-R>=strftime("%d.%m.%Y")<CR>

map <F3> :set number!<BAR>set number?<CR>
map <F5> :set list!<BAR>set list?<CR>
map <F6> :set hls!<BAR>set hls?<CR>
map <F8> :marks<CR>
"map <F9> :registers<CR>
"map <F10> :map<CR>
"map <C-Right> :tabnext<CR>
"map <C-Left>  :tabprevious<CR>


" cursor highlight
set cursorline
"highlight CursorLine cterm=NONE ctermbg=Black
"autocmd InsertEnter * set nocursorline
"autocmd InsertLeave * set cursorline

" Display extra whitespace
set encoding=utf-8
set list listchars=tab:»·,trail:·

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Backward compatible for Command-T...
nmap <leader>t <c-p>
let g:ctrlp_regexp = 1
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_prompt_mappings = { 'PrtAdd(".*")': ['<space>'] }

" Vim Git Gutter
highlight clear SignColumn

" Vim Addon Manager
fun! EnsureVamIsOnDisk(vam_install_path)
  " windows users want to use http://mawercer.de/~marc/vam/index.php
  " to fetch VAM, VAM-known-repositories and the listed plugins
  " without having to install curl, unzip, git tool chain first
  " -> BUG [4] (git-less installation)
  if !filereadable(a:vam_install_path.'/vim-addon-manager/.git/config')
     \&& 1 == confirm("Clone VAM into ".a:vam_install_path."?","&Y\n&N")
    " I'm sorry having to add this reminder. Eventually it'll pay off.
    call confirm("Remind yourself that most plugins ship with ".
                \"documentation (README*, doc/*.txt). It is your ".
                \"first source of knowledge. If you can't find ".
                \"the info you're looking for in reasonable ".
                \"time ask maintainers to improve documentation")
    call mkdir(a:vam_install_path, 'p')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '.shellescape(a:vam_install_path, 1).'/vim-addon-manager'
    " VAM runs helptags automatically when you install or update
    " plugins
    exec 'helptags '.fnameescape(a:vam_install_path.'/vim-addon-manager/doc')
  endif
endf

fun! SetupVAM()
  " Set advanced options like this:
  " let g:vim_addon_manager = {}
  " let g:vim_addon_manager['key'] = value

  " Example: drop git sources unless git is in PATH. Same plugins can
  " be installed from www.vim.org. Lookup MergeSources to get more control
  " let g:vim_addon_manager['drop_git_sources'] = !executable('git')

  " VAM install location:
  let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
  call EnsureVamIsOnDisk(vam_install_path)
  exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

  " Tell VAM which plugins to fetch & load:
  " call vam#ActivateAddons([], {'auto_install' : 0})
  call vam#ActivateAddons(['AutoClose%2009', 'ctrlp', 'fugitive', 'Solarized', 'surround', 'Supertab', 'Syntastic', 'The_NERD_tree', 'tComment', 'vim-coffee-script', 'vim-gitgutter', 'vim-javascript', 'vim-ruby'], {'auto_install' : 0})
  " sample: call vam#ActivateAddons(['pluginA','pluginB', ...], {'auto_install' : 0})

  " Addons are put into vam_install_path/plugin-name directory
  " unless those directories exist. Then they are activated.
  " Activating means adding addon dirs to rtp and do some additional
  " magic

  " How to find addon names?
  " - look up source from pool
  " - (<c-x><c-p> complete plugin names):
  " You can use name rewritings to point to sources:
  "    ..ActivateAddons(["github:foo", .. => github://foo/vim-addon-foo
  "    ..ActivateAddons(["github:user/repo", .. => github://user/repo
  " Also see section "2.2. names of addons and addon sources" in VAM's documentation
endfun
call SetupVAM()
" experimental [E1]: load plugins lazily depending on filetype, See
" NOTES
" experimental [E2]: run after gui has been started (gvim) [3]
" option1:  au VimEnter * call SetupVAM()
" option2:  au GUIEnter * call SetupVAM()
" See BUGS sections below [*]
" Vim 7.0 users see BUGS section [3]

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax enable

  " solarized options
  if (&t_Co == 256)
    let g:solarized_termcolors = 256
  endif
  set background=dark
  colorscheme solarized
endif

" change diff color
if &diff
 "   colorscheme evening
    " color scheme could be 'elflord morning desert evening pablo'
endif

"highlight NearLength ctermbg=magenta ctermfg=white guibg=#592959
"highlight OverLength ctermbg=red ctermfg=white guibg=#592959
"match NearLength /\%78v.\+/
"match OverLength /\%81v.\+/
set cc=80
highlight ColorColumn ctermbg=grey
map <F9> :GitGutterPrevHunk<CR>
map <F10> :GitGutterNextHunk<CR>


nnoremap <F12> :Hexmode<CR>
inoremap <F12> <Esc>:Hexmode<CR>
vnoremap <F12> :<C-U>Hexmode<CR>

" ex command for toggling hex mode - define mapping if desired
command! -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
func! ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfun
