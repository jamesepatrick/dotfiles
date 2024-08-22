let b:ale_fixers = ['xmllint']
let b:ale_fix_on_save = 0

let g:xml_syntax_folding=1
setlocal foldmethod=syntax
autocmd Syntax xml,html,xhtml normal zR
