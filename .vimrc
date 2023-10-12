" basic setting ; vim : set all for help
:set nu
:set backspace=1
:syntax on
:syntax case ignore
:set background=dark
:set hlsearch
:set laststatus=2
":set cindent
:set t_Co=256
":set mouse=a
:set tabstop=4
:set history=1000
:set nocompatible
:set smartindent
:set shiftwidth=4
:set incsearch
:set ignorecase
:set backspace=indent,eol,start
:set cursorline

"========== for NERDtree
map <F3> :NERDTreeMirror <CR>
map <F3> :NERDTreeToggle <CR>

let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeShowFiles=1
let NERDTreeshowLineNumbers=1
let NERDTreeHightCursorline=1
let NERDTreeShowHidden=0
let NERDTreeMinimalUI=0
let NERDTreeWinSize=31  "width


"========== for superTab
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType h set omnifunc=ccomplete#Complete
autocmd FileType c++ set omnifunc=ccomplete#Complete

" Return to last edit position when opening files (You want this!)  ====MRU
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"========== for Tagslist
map <F2> :TlistToggle <CR>
"map <silent> <F2> :TlistToggle <CR>
:set tags=tags;/
let Tlist_Auto_Open=0
let Tlist_Auto_Update=1
let Tlist_Compact_Format=1
let Tlist_Ctags_Cmd='ctags'
let Tlist_Enable_Fold_Column=0
let Tlist_Process_File_Always=1
let Tlist_Show_One_File=1
let Tlist_Exist_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=0
let Tlist_Sort_Type="name"
let Tlist_WinWidth=35  "width===
let Tlist_Close_On_Select=1
let Tlist_Use_SingleClick=1
let Tlist_Use_Right_Window=1
let Tlist_GainFocus_On_ToggleOpen=1

"========== for cscope
if has("cscope")  
	set csprg=~/bin/cscope  
	set csto=0  
	set cst  
	set csverb  
	set cspc=3  
	"add any database in current dir  
	if filereadable("cscope.out")  
		silent cs add cscope.out  
	"else search cscope.out elsewhere  
	else  
		let cscope_file=findfile("cscope.out", ".;")  
		let cscope_pre=matchstr(cscope_file, ".*/")  
		if !empty(cscope_file) && filereadable(cscope_file)  
			silent exe "cs add" cscope_file cscope_pre 
		endif        
	endif  
endif 
set cscopequickfix=a-,s-,c+,d-,i-,t-,e-,f+
nmap <C-@>a :cs find a <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nnoremap <c-n> :cnext<cr>
nnoremap <c-p> :cprev<cr>
nnoremap <c-o> :copen<cr>
nnoremap <c-e> :cclose<cr>
"========== for rainbow
let g:rainbow_active = 1
" 标记大小中括号的颜色
"let g:rainbow_load_separately = [
"    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
"    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
"    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
"    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
"    \ ]

"let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
"let g:rainbow_ctermfgs = ['white', 'lightgreen', 'yellow', 'red', 'magenta']

"====================color highlight=============================

"syntax on
"colorscheme solarized
"colorscheme herald
"colorscheme jellybeans_modified
colorscheme gruvbox
"colorscheme molokai

"find and comment out
syn keyword    cStructure  struct union enum typedef
syn match cFunctions "\<[a-zA-Z_][a-zA-Z0-9_]*\>\s*("me=e-1
syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
syn match cStruct       "\(struct\|union\|enum\|typedef\)\{1}\s\+\<[a-zA-Z_][a-zA-Z0-9_]*\>\(\s*\**\s*\)*[);]\?\s*\n*"me=e-1 contains=cVar
syn match cVar          "\(\s*\**\s*\)*&\?\s*\<[a-zA-Z_][a-zA-Z0-9_]*\>\s*[,\);:=\>\<\-+\|\&\.\[\]]"me=e-1 contains=cStruct,cStatement,cMacro,cType
syn match cStrMbrP      "\->\<[a-zA-Z_][a-z_A-Z0-9]*\>" contains=cStruct
syn match cStrMbrM      "\.\<[a-zA-Z_][a-z_A-Z0-9]*\>" contains=cStruct
syn match cMacro        "\s*\<[A-Z][a-zA-Z0-9_]*\>\s*[a-zA-Z0-9_,\);:\"\'=><\-+\|\&\.\[\]]\|(\->)\?\s*\n*"me=e-1 contains=cStruct
hi def cFunctions   gui=none cterm=bold ctermfg=green
hi cStruct      gui=none cterm=bold ctermfg=blue
hi cVar         gui=none cterm=none ctermfg=96
hi cStrMbrP     gui=none cterm=none ctermfg=196
hi cStrMbrM     gui=none cterm=none ctermfg=201
hi cMacro       gui=none cterm=none ctermfg=159


" highlight work...
hi cType        gui=none cterm=bold ctermfg=45
hi cDefine      gui=none cterm=none ctermfg=red

"=========== end
