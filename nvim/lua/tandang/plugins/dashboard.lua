return {
	"nvimdev/dashboard-nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		{ "MaximilianLloyd/ascii.nvim", dependencies = { "MunifTanjim/nui.nvim" } },
	},
	event = "VimEnter",
	config = function()
        local logo = [[
 ███████████                          ███████████           
░█░░░░░░███                          ░█░░░███░░░█           
░     ███░   █████ ███ █████  ██████ ░   ░███  ░  █████ ████
     ███    ░░███ ░███░░███  ███░░███    ░███    ░░███ ░███ 
    ███      ░███ ░███ ░███ ░███████     ░███     ░███ ░███ 
  ████     █ ░░███████████  ░███░░░      ░███     ░███ ░███ 
 ███████████  ░░████░████   ░░██████     █████    ░░███████ 
░░░░░░░░░░░    ░░░░ ░░░░     ░░░░░░     ░░░░░      ░░░░░███ 
                                                   ███ ░███ 
                                                  ░░██████  
                                                   ░░░░░░  
        ]]

        logo = string.rep("\n", 4) .. logo .. "\n\n"
		require("dashboard").setup({
			theme = "hyper",
			config = {
			    header = vim.split(logo, "\n"),
				shortcut = {
                    {
                        icon = " ",
                        icon_hl = "@variable",
                        desc = "New File",
                        group = "Label",
                        action = "enew",
                        key = "n",
                    },
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
                    {
                        icon = " ",
                        icon_hl = "@variable",
                        desc = "Database",
                        group = "Label",
                        action = function()
                            vim.cmd("DBUI")
                            vim.cmd("wincmd l")
                            vim.cmd("q")
                        end,
                        key = "d",
                    },
					{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
				},
                footer = { "🥰 Chaewon stan" },
			},
		})
	end,
}
