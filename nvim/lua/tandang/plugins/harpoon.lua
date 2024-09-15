return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2", -- Specify the harpoon2 branch
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("harpoon").setup({})
    end,
}
