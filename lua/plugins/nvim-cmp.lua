return {
    "hrsh7th/nvim-cmp",

    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-cmdline",
    },
    opts = function()
        local cmp = require('cmp')
        return {
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                    -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

                    -- For `mini.snippets` users:
                    -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
                    -- insert({ body = args.body }) -- Insert at cursor
                    -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
                    -- require("cmp.config").set_onetime({ sources = {} })
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({

                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                -- { name = 'vsnip' }, -- For vsnip users.
                { name = 'luasnip' }, -- For luasnip users.
                -- { name = 'ultisnips' }, -- For ultisnips users.
                -- { name = 'snippy' }, -- For snippy users.
            }, {
                    { name = 'buffer' },
                })
        }
    end
    --
    -- opts = function()
    --
    --     vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    --     local cmp = require("cmp")
    --     local defaults = require("cmp.config.default")()
    --     local auto_select = true
    --     return {
    --         auto_brackets = {}, -- configure any filetype to auto add brackets
    --         completion = {
    --             completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
    --         },
    --         preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
    --         mapping = cmp.mapping.preset.insert({
    --             ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    --             ["<C-f>"] = cmp.mapping.scroll_docs(4),
    --
    --             ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    --             ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    --
    --             ["<C-Space>"] = cmp.mapping.complete(),
    --             ["<C-CR>"] = function(fallback)
    --                 cmp.abort()
    --                 fallback()
    --             end,
    --
    --         }),
    --         sources = cmp.config.sources({
    --             { name = "lazydev" },
    --             { name = "nvim_lsp" },
    --             { name = "path" },
    --         }, {
    --                 { name = "buffer" },
    --             }),
    --         formatting = {
    --             format = function(entry, item)
    --                 local widths = {
    --                     abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
    --                     menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
    --                 }
    --
    --                 for key, width in pairs(widths) do
    --                     if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
    --                         item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
    --                     end
    --                 end
    --
    --
    --                 return item
    --
    --             end,
    --         },
    --         experimental = {
    --             -- only show ghost text when we show ai completions
    --             ghost_text = vim.g.ai_cmp and {
    --
    --                 hl_group = "CmpGhostText",
    --             } or false,
    --         },
    --         sorting = defaults.sorting,
    --     }
    -- end,
}
