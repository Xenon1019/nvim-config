-- lsp
--------------------------------------------------------------------------------
-- See https://gpanders.com/blog/whats-new-in-neovim-0-11/ for a nice overview
-- of how the lsp setup works in neovim 0.11+.

-- This actually just enables the lsp servers.
-- The configuration is found in the lsp folder inside the nvim config folder,
-- so in ~.config/lsp/lua_ls.lua for lua_ls, for example.

local lsps = {
    "lua_ls",
    "clangd",
    "rust_analayzer"
}

vim.lsp.enable(lsps)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
      vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      vim.keymap.set('i', '<C-Space>', function()

        vim.lsp.completion.get()
      end)
    end
  end,
})


local cmp = require('cmp')
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }

})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
            { name = 'cmdline' }
        }),
    matching = { disallow_symbol_nonprefix_matching = false }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
for _, lsp in ipairs(lsps) do
    -- Set up lspconfig.
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    require('lspconfig')[lsp].setup {
        capabilities = capabilities
    }
end

-- Diagnostics
vim.diagnostic.config({
  -- Use the default configuration
  virtual_lines = true

  -- Alternatively, customize specific options
  -- virtual_lines = {
  --   -- Only show virtual line diagnostics for the current cursor line
  --   current_line = true,
  -- },
})
