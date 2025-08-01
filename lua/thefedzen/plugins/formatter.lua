return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		local function get_js_formatters()
			local cwd = vim.fn.getcwd()

			if vim.fn.filereadable(cwd .. "/biome.json") == 1 or vim.fn.filereadable(cwd .. "/biome.jsonc") == 1 then
				return { "biome" }
			end

			local has_eslint = vim.fn.filereadable(cwd .. "/.eslintrc.js") == 1
				or vim.fn.filereadable(cwd .. "/.eslintrc.json") == 1
				or vim.fn.filereadable(cwd .. "/.eslintrc.yaml") == 1
				or vim.fn.filereadable(cwd .. "/.eslintrc.yml") == 1
				or vim.fn.filereadable(cwd .. "/eslint.config.js") == 1
				or vim.fn.filereadable(cwd .. "/eslint.config.mjs") == 1

			local has_prettier = vim.fn.filereadable(cwd .. "/.prettierrc") == 1
				or vim.fn.filereadable(cwd .. "/.prettierrc.json") == 1
				or vim.fn.filereadable(cwd .. "/.prettierrc.js") == 1
				or vim.fn.filereadable(cwd .. "/.prettierrc.yaml") == 1
				or vim.fn.filereadable(cwd .. "/.prettierrc.yml") == 1
				or vim.fn.filereadable(cwd .. "/prettier.config.js") == 1

			local formatters = {}
			if has_eslint then
				table.insert(formatters, "eslint_d")
			end
			if has_prettier then
				table.insert(formatters, "prettier")
			end

			return #formatters > 0 and formatters or { "prettier" }
		end

		local js_formatters = get_js_formatters()

		conform.setup({
			formatters_by_ft = {
				javascript = js_formatters,
				typescript = js_formatters,
				javascriptreact = js_formatters,
				typescriptreact = js_formatters,
				css = { "prettier" },
				html = { "prettier" },
				json = function()
					local cwd = vim.fn.getcwd()
					if
						vim.fn.filereadable(cwd .. "/biome.json") == 1
						or vim.fn.filereadable(cwd .. "/biome.jsonc") == 1
					then
						return { "biome" }
					end
					return { "prettier" }
				end,
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})
		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end)
	end,
}
