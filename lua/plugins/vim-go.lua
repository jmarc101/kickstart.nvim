vim.keymap.set('n', '<leader>gf', ':GoTestFile<CR>', { silent = true, desc = 'Run Go test for FILE' })
vim.keymap.set('n', '<leader>gt', ':GoTestFunc<CR>', { silent = true, desc = 'Run Go test for FUNCTION under cursor' })
vim.keymap.set('n', '<leader>gds', ':GoDegubStart<CR>', { silent = true, desc = 'Start Delve' })
vim.keymap.set('n', '<leader>gr', ':GoRun<CR>', { silent = true, desc = 'Execute current FILE' })
vim.keymap.set('n', '<leader>gi', ':GoImport<CR>', { silent = true, desc = 'Import packages' })
vim.keymap.set('n', '<leader>gl', ':GoLint<CR>', { silent = true, desc = 'Lint Code' })

return { 'fatih/vim-go', build = ':GoUpdateBinaries' }
