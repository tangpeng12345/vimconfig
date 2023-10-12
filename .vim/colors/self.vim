"find and comment out
"syn keyword    cStructure  struct union enum typedefsyn match cFunctions    "\<[a-zA-Z_][a-zA-Z0-9_]*\>\s*("me=e-1
syn match cStruct       "\(struct\|union\|enum\|typedef\)\{1}\s\+\<[a-zA-Z_][a-zA-Z0-9_]*\>\(\s*\**\s*\)*[);]\?\s*\n*"me=e-1 contains=cVar
syn match cVar          "\(\s*\**\s*\)*&\?\s*\<[a-zA-Z_][a-zA-Z0-9_]*\>\s*[,\);:=\>\<\-+\|\&\.\[\]]"me=e-1 contains=cStruct,cStatement,cMacro,cType
syn match cStrMbrP      "\->\<[a-zA-Z_][a-z_A-Z0-9]*\>" contains=cStruct
syn match cStrMbrM      "\.\<[a-zA-Z_][a-z_A-Z0-9]*\>" contains=cStruct
syn match cMacro        "\s*\<[A-Z][a-zA-Z0-9_]*\>\s*[a-zA-Z0-9_,\);:\"\'=><\-+\|\&\.\[\]]\|(\->)\?\s*\n*"me=e-1 contains=cStruct
hi cFunctions   gui=none cterm=bold ctermfg=214
hi cStruct      gui=none cterm=bold ctermfg=45
hi cVar         gui=none cterm=none ctermfg=96
hi cStrMbrP     gui=none cterm=none ctermfg=196
hi cStrMbrM     gui=none cterm=none ctermfg=201
hi cMacro       gui=none cterm=none ctermfg=159
hi cType        gui=none cterm=bold ctermfg=45
hi cDefine      gui=none cterm=none ctermfg=159
