return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    opts = function()
        local configs = require('nvim-treesitter.configs')

        configs.setup({
            ensure_installed = {
                "lua",
                "vim",
                "html",
                "javascript",
                "typescript",
                "c_sharp",
                "c",
                "cpp",
                "rust",
                "python",
                "markdown"
            },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true }
        })

        return {}
    end
}
