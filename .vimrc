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

"only change here is removing up/down array keys from this.
let g:ycm_key_list_select_completion = ['<TAB>']

let g:ycm_key_list_previous_completion = ['<S-TAB>']


"Ctrl-y in insert mode also holds the behaviour of appening the character
"above the cursor. This adds ctrl-e to the binding to stop completion, and
"causes <down> to automatically press ctrl-e , thus making down close the
"completion menu and move your cursor down. Whew.
:let g:ycm_key_list_stop_completion = ['<C-y>','<C-e>']
:inoremap <Down> <C-e><Down>
:inoremap <Up> <C-e><Up>



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
:command Notes :echo 'G=gg, :YcmCompleter , Ctrl Space ,:YcmGenerateConfig (use in project root dir)  '
:set autoindent
":compiler gcc
:set mouse=n " Enable mouse support in console
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
":set pastetoggle=<F11>

"Map f1 to switch to header file
:map <silent> <F1> :A<CR>

"Map f2 to open/close the tag menu
:nmap <silent> <F2> :TagbarToggle<CR>

"Map f5 to get type
:nmap <silent> <F5> :YcmCompleter GetType<CR>
"f6 to get doc
:nmap <silent> <F6> :YcmCompleter GetDoc<CR>

"Go to the definition of what's under the cursor
:nmap <silent> <F7> :YcmCompleter GoTo<CR>
"Goto declaration of what's under the cursor
:nmap <silent> <F8> :YcmCompleter GoToDeclaration<CR>


"Attempt to fix the line the cursor is on
:nmap <silent> <F9> :YcmCompleter FixIt<CR>


"Easier closing of all the buffers YCM opens 
:nmap <silent> <F12> :q<CR>


" Better command-line completion
:set wildmenu

"function! Mosh_Tab_Or_Complete()
"	if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"		return "\<C-N>"
"	else
"		return "\<Tab>"
"	endfunction
"inoremap <Tab> <C-R>=Mosh_Tab_Or_Complete()<CR>


"Map number keys to tab numbers

"if has('nvim')
if 1 
	:nmap <silent> <A-q> :tabn 1<CR>
	:nmap <silent> <A-w> :tabn 2<CR>
	:nmap <silent> <A-e> :tabn 3<CR>
	:nmap <silent> <A-a> :tabn 4<CR>
	:nmap <silent> <A-s> :tabn 5<CR>
	:nmap <silent> <A-d> :tabn 6<CR>
	:nmap <silent> <A-z> :tabn 7<CR>
	:nmap <silent> <A-x> :tabn 8<CR>
	:nmap <silent> <A-c> :tabn 9<CR>
elseif 
	"nvim doesn't treat these keys right.
	:nmap <silent> <C-F1> :tabn 1<CR>
	:nmap <silent> <C-F2> :tabn 2<CR>
	:nmap <silent> <C-F3> :tabn 3<CR>
	:nmap <silent> <C-F4> :tabn 4<CR>
	:nmap <silent> <C-F5> :tabn 5<CR>
	:nmap <silent> <C-F6> :tabn 6<CR>
	:nmap <silent> <C-F7> :tabn 7<CR>
	:nmap <silent> <C-F8> :tabn 8<CR>
	:nmap <silent> <C-F9> :tabn 9<CR>
	:nmap <silent> <C-F10> :tabn 10<CR>
endif


" Found at https://superuser.com/questions/331272/vim-show-the-index-of-tabs-in-the-tabline#477221 ; displays the number of each tab
" ---
" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif

"end of SO find



"Fun stuff


"I don't want tetris loaded all the time in vim because it's usually just dead
"weight.
function! Tetris()
	source ~/.vim/tetris.vim
	echo "Tetris loaded. \\te to play"
endfunction()
:command Tetris call Tetris()

"End fun stuff


"THIS MUST BE THE LAST COMMAND IN THE VIMRC. Otherwise, if the file is not 4 spaces/tab, I can't undo this command.
":au BufReadPost,FileReadPre * :silent %retab! " Automatically convert all tabs into spaces--as long as they're using 4 spaces per tab. Death to spaces!
