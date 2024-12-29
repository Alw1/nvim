vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- vim.api.nvim_create_autocmd('TextYankPost', {
--         group    = 'bufcheck',
--         pattern  = '*',
--         callback = function() vim.highlight.on_yank{timeout=500} end })
