return {
	"rebelot/kanagawa.nvim",
	"neanias/everforest-nvim",

	version = false,
	lazy = false,
	priority = 1000, -- make sure to load this before all the other start plugins

	init = function()
		vim.cmd("colorscheme everforest")
		--vim.cmd("colorscheme kanagawa")
	end,
}
