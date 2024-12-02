require 'keymaps'

-- Commands are in the 'lua/commands' folder.
require 'commands.highlight-yank'

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Lazy Load Plugins ]]
-- See `:help lazy.nvim.txt`
-- :Lazy  - To access the `lazy.nvim` commands
require('lazy').setup({
  require 'themes', -- Colorscheme
  require 'lsp', -- Language Server Protocol
  require 'plugins.autocompletion', -- LSP Autocompletion
  -- require 'plugins.autopairs',
  require 'plugins.conform', -- Autoformat
  require 'plugins.debug', -- DAP Debugging
  require 'plugins.gitsigns', -- Git shortcuts and signs
  require 'plugins.indent_line', -- Indentation lines
  require 'plugins.lazydev', -- Lsp Configuration
  -- require 'plugins.lint', -- Linting
  require 'plugins.mini', -- Collection of various small independent plugins/modules
  require 'plugins.neotest', -- Test runner for multiple languages
  -- require 'plugins.neo-tree', -- File Explorer
  require 'plugins.oil', -- File Explorer
  require 'plugins.telescope', -- Powerful fuzzy finder
  require 'plugins.tree-sitter', -- Syntax Tree Parser
  require 'plugins.trouble', -- LSP Diagnostics
  -- require 'plugins.vim-go', -- Golang support + keybinds
  require 'plugins.which-key', -- Keybindings helper

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'github/copilot.vim', -- GitHub Copilot integration
  'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines

  { 'Bilal2453/luvit-meta', lazy = true },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}, {

  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
