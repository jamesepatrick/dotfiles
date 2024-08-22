com! MinifyJSON :%!python3 -c 'import json, sys;json.dump(json.load(sys.stdin), sys.stdout)'
com! FormatJSON :%!python3 -m json.tool
map <buffer><leader>= :FormatJSON<cr>
set foldmethod=syntax
