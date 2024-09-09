return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify", -- Optional for the notification view
	},
	config = function()
		require("noice").setup({
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			routes = {
				{
					filter = {
						event = "lsp",
						kind = "progress",
						cond = function(message)
							local client = vim.tbl_get(message.opts, "progress", "client")
							-- Skip progress messages for jdtls (Java) and fsautocomplete (F#)
							return client == "jdtls" or client == "fsautocomplete"
						end,
					},
					opts = { skip = true },
				},
			},
			presets = {
				bottom_search = false,
				command_palette = true,
				long_message_to_split = false,
				inc_rename = false,
				lsp_doc_border = false,
			},
		})
	end,
}
