return {
    {
       "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
            "stylua",
            "prettierd",
            "eslint_d",
            "lua-language-server",
            "typescript-language-server",
            },
        },
    },
    -- Lspsaga for UI enhancements
    {
        "nvimdev/lspsaga.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("lspsaga").setup({})
        end,
    },

    -- LSP Zero 3.x
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x", -- update to LSP 3.x
        lazy = true,
        config = function()
            local lsp = require("lsp-zero").preset({})

            lsp.on_attach(function(client, bufnr)
                local opts = { buffer = bufnr, remap = false }

                local keymap = vim.keymap.set
                keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[N]ame", buffer = bufnr })
                keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction", buffer = bufnr })
                keymap("n", "<leader>gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition", buffer = bufnr })
                keymap(
                    "n",
                    "<leader>gr",
                    require("telescope.builtin").lsp_references,
                    { desc = "[G]oto [R]eference", buffer = bufnr }
                )
                keymap(
                    "n",
                    "<leader>gI",
                    vim.lsp.buf.implementation,
                    { desc = "[G]oto [I]mplementation", buffer = bufnr }
                )
                keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation", buffer = bufnr })
                keymap("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help", buffer = bufnr })
            end)

            lsp.ensure_installed({
                "lua_ls",
                "gopls",
                "yamlls",
            })

            local lspconfig = require("lspconfig")
            local util = require("lspconfig.util")

            -- Lua LSP
            lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

            -- Go LSP
            lspconfig.gopls.setup({
                cmd = { "gopls" },
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
                root_dir = util.root_pattern("go.work", "go.mod", ".git"),
            })

            -- Finally setup LSP
            lsp.setup()
        end,
    },

    -- Typescript tools
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("typescript-tools").setup({})

            vim.keymap.set(
                "n",
                "<leader>toi",
                "<CMD>TSToolsOrganizeImports<CR>",
                { desc = "[T]ypescript [O]rganize [I]mports" }
            )
        end,
    },

    -- Neodev for Lua development
    {
        "folke/neodev.nvim",
        opts = {},
    },
}
