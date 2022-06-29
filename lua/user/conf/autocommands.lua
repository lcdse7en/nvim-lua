vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200}) 
    autocmd BufWinEnter * set formatoptions-=cro
  augroup end
  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end
  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  " augroup _auto_resize
  "   autocmd!
  "   autocmd VimResized * tabdo wincmd = 
  " augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup _fold_bug_solution  " https://github.com/nvim-telescope/telescope.nvim/issues/559
    autocmd!
    autocmd BufRead * autocmd BufWinEnter * ++once normal! zx
  augroup end

  augroup _load_break_points
    autocmd!
    autocmd FileType c,cpp,go,python,lua :lua require('user.dap.dap-util').load_breakpoints()
  augroup end

  augroup NvimTree-
    autocmd!
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
  augroup end

  augroup  edit_markdown
    autocmd!
    autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
    autocmd Filetype markdown inoremap <buffer> <c-e> <Esc>/<++><CR>:nohlsearch<CR>"_c4l
    autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
    autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>
    autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
    autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
    autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
    autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
    autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
    autocmd Filetype markdown inoremap <buffer> ,m - [ ] 
    autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
    autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a
    autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
    autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
    autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
    autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
    autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>
  augroup end
]]
