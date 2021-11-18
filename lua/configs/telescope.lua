local telescope = require('telescope')
telescope.setup {
    defaults = {
      layout_config = {
          prompt_position = 'top',
      },
      sorting_strategy = 'ascending',
      file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
      grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
      qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    }
}
telescope.load_extension('projects')
