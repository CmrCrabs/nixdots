vim.keymap.set('n', "<leader>e", vim.diagnostic.open_float)
vim.keymap.set('n', "<leader>q", vim.diagnostic.setloclist)
vim.keymap.set('n', "]d", vim.diagnostic.goto_next)
vim.keymap.set('n', "[d", vim.diagnostic.goto_prev)

local on_attach = function(_, bufnr)
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local nmap = function(mode, keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end
        vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('n', "K", vim.lsp.buf.hover, "Hover Documentation")
    nmap('n', "C-k", vim.lsp.buf.signature_help, "Signature Documentation")

    nmap('n', "<leader>rr", vim.lsp.buf.rename, "[R]efactor - [R]ename")
    nmap('n', "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
    nmap('n', "gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
    nmap('n', "gr", require('telescope.builtin').lsp_references, "[G]oto  [R]eferences")
    nmap('n', "gI", vim.lsp.buf.implementation, "[G]oto  [I]mplementation")
    nmap('n', "<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")

    nmap('n', "<leader>ds", require('telescope.builtin').lsp_document_symbols, "[D]ocument [S]ymbols")
    nmap('n', "<leader>ws", require('telescope.builtin').lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        if vim.lsp.buf.format then
            vim.lsp.buf.format()
        elseif vim.lsp.buf.formatting then
            vim.lsp.buf.formatting()
        end
    end, { desc = 'Format current buffer with LSP' })

    vim.api.nvim_buf_create_user_command(bufnr, "RefreshCodeLens", function()
        vim.lsp.codelens.refresh()
        print "Refreshing CodeLens"
    end, {
        bang = true,
    })
end

local servers = { 'omnisharp', 'nil_ls' }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
--capabilities.textDocument.completion.completionItem.snippetSupport = false

local setup = function(server)
    server.setup {
        autostart = true,
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    }
end
setup(require('ionide'))

for _, lsp in ipairs(servers) do
    setup(require('lspconfig')[lsp])
end


-- setup stuff for lua, since all configs are in it anyway
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
            },
            diagnostics = {
                globals = { 'vim', 'require' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
                checkThirdParty = false,
            },
            telemetry = { enable = false },
        },
    },
}

--TODO: extract cmp into it's own config
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local lspkind = require('lspkind')

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {{ name = 'buffer' }}
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline', option = {ignore_cmds = {'Man', '!'}}}})
})
cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'buffer' }
    },
    --formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[Latex]",
            })
        }),
    },
})

