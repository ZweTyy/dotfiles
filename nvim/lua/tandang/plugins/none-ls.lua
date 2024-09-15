return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- Lua
                null_ls.builtins.formatting.stylua,
                -- Javascript
                null_ls.builtins.formatting.prettier.with({
                    extra_args = { "--tab-width", "4" },
                }),
                -- Python
                null_ls.builtins.formatting.black,
            },
        })
    end,
}
