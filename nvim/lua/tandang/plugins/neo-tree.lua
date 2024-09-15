return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- Optional, for file icons
		"MunifTanjim/nui.nvim",
	},
	config = function()
		-- Disable netrw at the very start of your init.lua (strongly advised)
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("neo-tree").setup({
			close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
			popup_border_style = "rounded", -- Rounded border for the floating window
			enable_git_status = true,
			enable_diagnostics = true,
			default_component_configs = {
				indent = {
					indent_size = 2,
					padding = 1, -- Padding for nested folders
					with_markers = true,
					indent_marker = "│",
					last_indent_marker = "└",
					highlight = "NeoTreeIndentMarker",
				},
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
					default = "", -- Default file icon
				},
				modified = {
					symbol = "[+]",
				},
				git_status = {
					symbols = {
						added = "✚",
						modified = "",
						deleted = "✖",
						renamed = "",
						untracked = "",
						ignored = "",
						unstaged = "",
						staged = "",
						conflict = "",
					},
				},
			},
			window = {
				position = "float", -- Makes Neo-tree a floating window
				popup = {
					size = {
						height = "80%", -- Adjust height as percentage of the total window
						width = "50%",  -- Adjust width as percentage of the total window
					},
					position = "50%", -- Center the floating window
					border = "rounded", -- Rounded border for the floating window
				},
				mappings = {
					["P"] = { "toggle_preview", config = { use_float = true } }, -- Toggle preview mode (floating)
					["l"] = "focus_preview", -- Focus on preview
					["<C-b>"] = { "scroll_preview", config = { direction = 10 } }, -- Scroll down in preview
					["<C-f>"] = { "scroll_preview", config = { direction = -10 } }, -- Scroll up in preview
					["<2-LeftMouse>"] = "open",
					["<cr>"] = "open",
					-- ["<esc>"] = "close_window", -- Close Neo-tree with <esc>
					["o"] = "open",
					["<C-s>"] = "split_with_window_picker",
					["<C-v>"] = "vsplit_with_window_picker",
					["C"] = "close_node",
					["R"] = "refresh",
				},
			},
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_by_name = {
						".DS_Store",
					},
				},
				follow_current_file = true, -- Automatically focus on the current file
				hijack_netrw_behavior = "open_default",
				use_libuv_file_watcher = true,
			},
			buffers = {
				show_unloaded = true,
			},
			git_status = {
				window = {
					position = "float", -- Make the git status window a floating window too
				},
			},
		})

		-- Keybinding for Neo-tree
		local keymap = vim.keymap
		keymap.set("n", "<leader>e", "<cmd>Neotree float toggle<CR>", { desc = "Toggle Neo-tree (Floating)" })
	end,
}
