return {
    'nvim-treesitter/nvim-treesitter',
    event = "VeryLazy",
    build = ":TSUpdate",
    init = function()
        vim.api.nvim_create_autocmd('FileType', {
            callback = function()
                pcall(vim.treesitter.start)
                vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
                vim.wo[0][0].foldmethod = "expr"
                vim.bo.indentexpr = "v:lua.requrie'nvim-treesitter'.indentexpr()"
            end,
        })

        local ensure_installed = {
            "lua",
            "python",
            "bash",
            "csv",
            "git_config",
            "git_rebase",
            "gitcommit",
            "gitignore",
            "html",
            "json",
            "markdown",
            "markdown_inline",
            "regex",
            "sql",
            "toml",
            "vimdoc",
            "yaml",
        }
        local already_installed = require("nvim-treesitter.config").get_installed()
        local parsers_to_install = vim.iter(ensure_installed):filter(function(parser)
            return not vim.tbl_contains(already_installed, parser)
        end):totable()
        require("nvim-treesitter").install(parsers_to_install)
    end,
}
