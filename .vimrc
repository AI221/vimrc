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
:set nocompatible 
:set autoindent
:compiler gcc
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

" Better command-line completion
:set wildmenu

:compiler gcc


function! Mosh_Tab_Or_Complete()
	if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
		return "\<C-N>"
	else
		return "\<Tab>"
	endfunction
inoremap <Tab> <C-R>=Mosh_Tab_Or_Complete()<CR>




"THIS MUST BE THE LAST COMMAND IN THE VIMRC. Otherwise, if the file is not 4 spaces/tab, I can't undo this command.
:au BufReadPost,FileReadPre * :silent %retab! " Automatically convert all tabs into spaces--as long as they're using 4 spaces per tab. Death to spaces!
