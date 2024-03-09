return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		local wk = require("which-key")
		local builtin = require("telescope.builtin")

		-- Document existing key chains
		wk.register({
			["<leader>"] = {
				f = {
					name = "file/find", -- optional group name
					f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
				},
				s = {
					name = "search",
					s = {
						function()
							builtin.grep_string({ search = vim.fn.input("Grep > ") })
						end,
						"Grep > ",
					},
					w = { "<cmd>Telescope grep_string<cr>", "Search Word" },
				},
				p = {
					s = {
						function()
							builtin.grep_string({ search = vim.fn.input("Grep > ") })
						end,
						"Grep > ",
					},
				},
				g = {
					name = "git",
					c = { "<cmd>Telescope git_branches<cr>", "Git Branches" },
				},
				c = {
					name = "code",
					f = {
						function()
							vim.lsp.buf.format()
						end,
						"Format",
					},
				},
			},
		})
	end,
}
