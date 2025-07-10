return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				disable_background = true,
				styles = {
					italic = false,
				},
				highlight_groups = {
					StatusLine = { fg = "pine", bg = "pine", blend = 10 },
					StatusLineNC = { fg = "subtle", bg = "surface" },
				},
			})

			vim.cmd("colorscheme rose-pine")
		end,
	},
}
