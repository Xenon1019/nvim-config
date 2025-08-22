return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        opts = {
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {}
                }
            }
        }
    }
}
