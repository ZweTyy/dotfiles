return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        lazy = true,
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            "nvim-tree/nvim-web-devicons",
            "andrew-george/telescope-themes",
            { "nvim-telescope/telescope-media-files.nvim" }, -- Add the media files extension
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")

            telescope.setup({
                defaults = {
                    path_display = { "truncate" },
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                            ["<C-j>"] = actions.move_selection_next, -- move to next result
                            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        },
                    },
                },
                extensions = {
                    media_files = {
                        -- You can add more filetypes here if needed
                        filetypes = {"png", "jpg", "jpeg", "gif", "pdf"},
                        find_cmd = "rg", -- Use ripgrep to find files
                    },
                },
            })

            telescope.load_extension("themes")
            telescope.load_extension("fzf")
            telescope.load_extension("media_files") -- Load the media files extension

            -- set keymaps
            local keymap = vim.keymap -- for conciseness

            keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
            keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
            keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
            keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

            -- Keymap to search and preview media files
            keymap.set("n", "<leader>fp", "<cmd>Telescope media_files<cr>", { desc = "Find and preview media files" })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            }
            require("telescope").load_extension("ui-select")
        end
    },
}
