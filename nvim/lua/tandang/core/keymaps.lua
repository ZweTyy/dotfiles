local keymap = vim.keymap

vim.g.mapleader = " "

----------------------------

-- General keymaps
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" }) -- scroll down
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" }) -- scroll up

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Copy whole page
keymap.set("n", "<leader>yy", ":%y+<CR>", { desc = "Copy whole page" })

-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- Diagnostics
keymap.set("n", "<leader>E", "<cmd>lua vim.diagnostic.open_float(0, { scope = 'line' })<CR>", { desc = "Open diagnostics" })

-- Window navigation
keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Move to the left window" })
keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Move to the bottom window" })
keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Move to the top window" })
keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Move to the right window" })
keymap.set("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", { desc = "Move to the previous window" })

-- Window creation
keymap.set("n", "<leader>ws", "<cmd>split<CR>", { desc = "Split window" })
keymap.set("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Vertical split window" })
keymap.set("n", "<leader>wt", "<cmd>tabnew<CR>", { desc = "New tab" })
keymap.set("n", "<leader>wd", "<cmd>close<CR>", { desc = "Close window" })

-- LSP keymaps
keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Description when hovered over an implementation" })
keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goes to the definition" })
keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })

-- Null-ls
keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format code" })

-- Noice
keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss noice message" })

-- Gitsigns
keymap.set("n", "<leadergp", "<cmd>Gitsigns preview hunk<CR>", { desc = "Preview hunk" })

-- Harpoon
keymap.set("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>", { desc = "Add file to harpoon" })
keymap.set("n", "<leader>ht", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", { desc = "Toggle harpoon quick menu" })
keymap.set("n", "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", { desc = "Navigate to harpoon file 1" })
keymap.set("n", "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", { desc = "Navigate to harpoon file 2" })
keymap.set("n", "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", { desc = "Navigate to harpoon file 3" })
keymap.set("n", "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", { desc = "Navigate to harpoon file 4" })
keymap.set("n", "<leader>5", "<cmd>lua require('harpoon.ui').nav_file(5)<CR>", { desc = "Navigate to harpoon file 5" })
