return {
    {
        "nvim-treesitter/nvim-treesitter",
        commit = "b6492f41c46d9c3bc3550ecfb10c3f261e73cba6",
        build = ":TSUpdate",
        version = false,
        event = {
            "BufReadPost",
            "BufNewFile",
        },
        dependencies = {
            { "nvim-treesitter/nvim-treesitter-textobjects" },
        },
        keys = {
            { "<C-Space>", desc = "Increment selection" },
            { "<bs>", desc = "Decrement selection", mode = "x" },
        },
        cmd = { "TSUpdateSync" },
        opts = {
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
            ensure_installed = {
                "bash",
                "fish",
                "c",
                "html",
                "fish",
                "javascript",
                "json",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
                "dockerfile",
                "http",
                "go",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-Space>",
                    node_incremental = "<C-Space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        },
    },
    {
        "nvim-treesitter/playground",
    },

    {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter", -- lazy-load on entering insert mode
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("nvim-ts-autotag").setup({
            -- enable in these filetypes
            filetypes = {
                "html",
                "xml",
                "javascript",
                "javascriptreact",
                "typescriptreact",
                "vue",
                "svelte",
                "php",
                "markdown",
            },
            -- automatically rename tags
            autotag = true,
        })
    end,
}

}
