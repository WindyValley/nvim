-- config for nvim_treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
}
vim.o['foldmethod'] = 'expr'
vim.o['foldexpr']='nvim_treesitter#foldexpr()'

-- config for telescope
require('telescope').setup {
    defaults = {
      prompt_prefix = '🍔 ',
      prompt_position = 'top',
      sorting_strategy = 'ascending',
      file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
      grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
      qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    }
}

