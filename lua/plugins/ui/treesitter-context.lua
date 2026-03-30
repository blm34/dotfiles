return {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    dependencies = {
        "nvim-treesitter/nvim-treesitter"
    },
    config = function()
        require("treesitter-context").setup({
            multiwindow = true,
        })
    end
}
