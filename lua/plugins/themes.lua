local pack = require("plugins.util")

pack.add({
	pack.gh("daedlock/matugen.nvim"),
	pack.gh("rebelot/kanagawa.nvim"),
	pack.gh("sho-87/kanagawa-paper.nvim"),
	pack.gh("neanias/everforest-nvim"),
	pack.gh("projekt0n/github-nvim-theme"),
	pack.gh("EdenEast/nightfox.nvim"),
	pack.gh("comfysage/evergarden"),
	{ src = pack.gh("rose-pine/neovim"), name = "rose-pine" },
	{ src = pack.gh("everviolet/nvim"), name = "everviolet" },
	pack.gh("raddari/last-color.nvim"),
})

require("matugen").setup({
	colors_path = "~/.config/matugen/colors.json",
})
