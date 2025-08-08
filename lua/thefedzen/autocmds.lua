local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local TheFedzenGroup = augroup("TheFedzen", {})
local yank_group = augroup("HighlightYank", {})

-- highlight line when yanking
autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

autocmd("LspAttach", {
	group = TheFedzenGroup,
	callback = function(e)
		local opts = { buffer = e.buf }
		vim.keymap.set("n", "<leader>gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "<leader>gh", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>gw", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>ca", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>gf", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "<leader>gr", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_next()
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, opts)
	end,
})
