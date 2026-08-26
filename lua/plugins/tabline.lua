local pack = require("plugins.util")

pack.add({
	pack.gh("romgrk/barbar.nvim"),
	pack.gh("lewis6991/gitsigns.nvim"), -- OPTIONAL: for git status
	pack.gh("nvim-tree/nvim-web-devicons"), -- OPTIONAL: for file icons
})

vim.g.barbar_auto_setup = false

require("barbar").setup({
	animation = true,
})
