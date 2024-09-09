return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			-- import mason
			local mason = require("mason")

			-- import mason-lspconfig
			local mason_lspconfig = require("mason-lspconfig")

			local mason_tool_installer = require("mason-tool-installer")
			-- enable mason and configure icons
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			mason_lspconfig.setup({
				-- list of servers for mason to install
				ensure_installed = {
					"clangd",
					"cssls",
					"denols",
					"fsautocomplete",
					"html",
					"jsonls",
					"jdtls",
					-- "tsserver",
                    -- We use ts_ls instead of tsserver
                    "ts_ls",
					"biome",
					"ltex",
					"lua_ls",
					"marksman",
					"pyright",
					"sqlls",
					"tailwindcss",
				},
				-- auto-install configured servers (with lspconfig)
				automatic_installation = true, -- not the same as ensure_installed

				mason_tool_installer.setup({
					ensure_installed = {
						"prettier", -- prettier formatter
						"stylua", -- lua formatter
						"isort", -- python formatter
						"black", -- python formatter
						"pylint", -- python linter
						"eslint_d", -- js linter
					},
				}),
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			local util = require("lspconfig.util")

			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.denols.setup({
				capabilities = capabilities,
				root_dir = util.root_pattern("deno.json", "deno.jsonc"),
			})
			lspconfig.fsautocomplete.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})
			-- Use nvim-jdtls instead of lspconfig.jdtls
			lspconfig.jdtls.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				single_file_support = false,
				root_dir = function(filename)
					local root_pattern = util.root_pattern
					-- Check for Deno project markers
					local deno_project = root_pattern("deno.json", "deno.jsonc")(filename)
					-- Check for Node.js project markers
					local node_project =
						root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")(filename)

					-- If a Deno project is detected, prevent tsserver from starting
					if deno_project then
						return nil
					else
						return node_project
					end
				end,
			})
            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
            })
			lspconfig.biome.setup({
				capabilities = capabilities,
			})
			lspconfig.ltex.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.marksman.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.sqlls.setup({
				capabilities = capabilities,
			})
		end,
	},
}
