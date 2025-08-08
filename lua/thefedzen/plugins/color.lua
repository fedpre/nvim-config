return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				auto_integrations = true,
				transparent_background = true,
			})
			vim.cmd("colorscheme catppuccin-mocha")
		end,
	},
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	config = function()
	-- 		require("rose-pine").setup({
	-- 			disable_background = true,
	-- 			styles = {
	-- 				italic = false,
	-- 			},
	-- 			highlight_groups = {
	-- 				StatusLine = { fg = "pine", bg = "pine", blend = 10 },
	-- 				StatusLineNC = { fg = "subtle", bg = "surface" },
	-- 			},
	-- 		})
	--
	-- 		vim.cmd("colorscheme rose-pine")
	-- 	end,
	-- },
}
