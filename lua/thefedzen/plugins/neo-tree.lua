return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
		---@module 'neo-tree'
		---@type neotree.Config
		opts = {
			vim.keymap.set("n", "<leader>e", ":Neotree toggle reveal_force_cwd<CR>"),
			vim.keymap.set("n", "<leader>ge", ":Neotree git_status<CR>"),
			vim.keymap.set("n", "<leader>be", ":Neotree buffers<CR>"),
			-- options go here
			-- Disable netrw
			disable_netrw = true,
			hijack_netrw = true,
			filesystem = {
				filtered_items = {
					visible = true, -- Shows filtered items (hidden files) by default
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_hidden = false, -- only works on Windows for hidden file attribute
				},
			},
		},
	},
}

-- default window mappings
-- ["<cr>"] = "open",
-- ["l"] = "open",
-- ["h"] = "close_node",
-- ["<space>"] = "toggle_node",
-- ["P"] = { "toggle_preview", config = { use_float = true } },
-- ["S"] = "open_split",
-- ["s"] = "open_vsplit",
-- ["t"] = "open_tabnew",
-- ["w"] = "open_with_window_picker",
-- ["C"] = "close_node",
-- ["z"] = "close_all_nodes",
-- ["a"] = { "add", config = { show_path = "none" } },
-- ["d"] = "delete",
-- ["r"] = "rename",
-- ["y"] = "copy_to_clipboard",
-- ["x"] = "cut_to_clipboard",
-- ["p"] = "paste_from_clipboard",
-- ["c"] = "copy",
-- ["m"] = "move",
-- ["q"] = "close_window",
-- ["R"] = "refresh",
-- ["?"] = "show_help",
-- ["<"] = "prev_source",
-- [">"] = "next_source",
