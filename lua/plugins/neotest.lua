-- Run the nearest test
vim.keymap.set('n', '<leader>tt', function()
  require('neotest').run.run()
  require('neotest').output_panel.open()
end, { desc = 'Run nearest test and open output panel' })

-- Run the current file
vim.keymap.set('n', '<leader>tf', function()
  require('neotest').run.run(vim.fn.expand '%')
  require('neotest').output_panel.open()
end, { desc = 'Run current file tests and open output panel' })

-- Debug the nearest test (requires nvim-dap and adapter support)
vim.keymap.set('n', '<leader>td', function()
  require('neotest').run.run { strategy = 'dap' }
  require('neotest').output_panel.open()
end, { desc = 'Debug nearest test and open output panel' })

vim.keymap.set('n', '<leader>tc', function()
  require('neotest').output_panel.close()
end, { desc = 'Close Test output panel' })

return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-jest',
    { 'fredrikaverpil/neotest-golang', version = '*' }, -- Installation
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-jest' {
          jestCommand = 'npm test --',
          jestConfigFile = 'custom.jest.config.ts',
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        },
        require 'neotest-golang' {
          go_test_args = {
            '-v',
            '-race',
            '-count=1',
          },
        }, -- Registration
      },
    }
  end,
}
