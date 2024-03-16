return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { { "prettier" } },
		},
	},
	config = function()
		vim.keymap.set("n", "<leader>fm", function()
			require("conform").format()
		end)
	end,
}
