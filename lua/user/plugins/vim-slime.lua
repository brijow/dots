vim.cmd [[
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}
let g:slime_no_mappings = 1
let g:slime_python_ipython = 0
"let g:slime_dispatch_ipython_pause
xmap <leader>cv <Plug>SlimeRegionSend
nmap <leader>cv <Plug>SlimeParagraphSend
nmap <leader>vv  <Plug>SlimeConfig
]]
