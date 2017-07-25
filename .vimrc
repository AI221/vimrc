"Vundle stuff
:set nocompatible 
:filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'


"CTags stuff
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'


Plugin 'vim-scripts/a.vim' "Quick-switch to header file: http://www.vim.org/scripts/script.php?script_id=31 tl;dr: :A


Plugin 'rdnetto/YCM-Generator'


Plugin 'Valloric/YouCompleteMe' "Autcomplete

" All of your Plugins must be added before the following line
call vundle#end()			 " required
filetype plugin indent on

"end vundle


"start YCM

let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_detailed_diagnostics = '<leader>d'
let g:ycm_key_list_stop_completion = ['<C-y>']


"Note that there is a vim-youcompleteme package on Debian. 
"Note that to install Vundle plugins, you need to :PluginInstall
"Note that you need to generate YCM config files; see the ycm generator plugin
"Note that you need to add set( CMAKE_EXPORT_COMPILE_COMMANDS ON ) to your
"cmake



"end YCM

:set ts=4 " I personally prefer 4 spaces per tab, but to each there own. That's why you use tabs.
:set shiftwidth=4
:set noexpandtab " No spaces.
:syntax on 
:set number " Line numbers
:command W :w " Fixes the annoying time where you don't release shift quick enough before writing.
:command Wq :wq "^
:command Test :echo 'Testing, 1... 2... 3..'
:command Notes :echo 'ins-completion , '
:map tn :tabnew 
:set autoindent
":compiler gcc
:set mouse=a " Enable mouse support in console
:set hlsearch " Highlight the last search
" When I close a tab, remove the buffer
:set nohidden
:set laststatus=2 "Line on 1 above bottom

" Create backup directories
:silent exec "!mkdir ~/.vim/backup"
:silent exec "!mkdir ~/.vim/tmp"

:set backup
:set backupdir=~/.vim/backup
:set directory=~/.vim/tmp

" :set cul "Highlight the current line 
:set lazyredraw " don't redraw when don't have to 
:set undolevels=1000 " 1000 undos
:set ttyfast 
:set noerrorbells
:set ruler
" No more pinky-pain
:nore ; :

:set confirm "ask to save rather than failing to quit

:set ignorecase
:set smartcase "Use case insensitive search, except when using capital letters

" Use <F11> to toggle between 'paste' and 'nopaste'
:set pastetoggle=<F11>

"Map f1 to switch to header file
:map <F1> :A<CR>

" Better command-line completion
:set wildmenu

"function! Mosh_Tab_Or_Complete()
"	if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"		return "\<C-N>"
"	else
"		return "\<Tab>"
"	endfunction
"inoremap <Tab> <C-R>=Mosh_Tab_Or_Complete()<CR>




"THIS MUST BE THE LAST COMMAND IN THE VIMRC. Otherwise, if the file is not 4 spaces/tab, I can't undo this command.
":au BufReadPost,FileReadPre * :silent %retab! " Automatically convert all tabs into spaces--as long as they're using 4 spaces per tab. Death to spaces!
