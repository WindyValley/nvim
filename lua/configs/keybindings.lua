local set_keymap = vim.api.nvim_set_keymap

local option_ns = { noremap = true, silent = true }

set_keymap("n", ",e", ":e " .. vim.fn.stdpath("config") .. "\\init.lua<cr>", option_ns)
set_keymap("n", "<c-s>", ":w<cr>", option_ns)
set_keymap("n", "<c-q>", ":q<cr>", option_ns)
set_keymap("n", "<leader><space>", [[<cmd>lua require('telescope.builtin').buffers()<CR>]], option_ns)
set_keymap("n", "<leader>sf", [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], option_ns)
set_keymap("n", "<leader>sb", [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], option_ns)
set_keymap("n", "<leader>sh", [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], option_ns)
set_keymap("n", "<leader>st", [[<cmd>lua require('telescope.builtin').tags()<CR>]], option_ns)
set_keymap("n", "<leader>sd", [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], option_ns)
set_keymap("n", "<leader>sp", [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], option_ns)
set_keymap("n", "<leader>sP", [[<cmd>Telescope projects<CR>]], option_ns)
set_keymap(
	"n",
	"<leader>so",
	[[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]],
	option_ns
)
set_keymap("n", "<leader>?", [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], option_ns)
set_keymap("n", "<F2>", [[:NvimTreeToggle<CR>]], option_ns)
