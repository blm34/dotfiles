return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            term_colors = true,
            dim_inactive = { enabled = true },
        })
        vim.cmd.colorscheme "catppuccin-nvim"
    end
}
