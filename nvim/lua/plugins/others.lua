return {
    "lambdalisue/fern-hijack.vim",
    "folke/neoconf.nvim",
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        opts = {
            install_root_dir = vim.fs.normalize "~/.mason_servers",
        },
    },
    {
        "b0o/schemastore.nvim",
        lazy = "true",
    },
    {
        "folke/neodev.nvim",
        ft = "lua",
    },
    {
        "machakann/vim-sandwich",
        event = "InsertEnter",
    },
    {
        "Pocco81/auto-save.nvim",
        opts = {
            execution_message = {
                message = function() -- message to print on save
                    return ""
                end,
            },
        },
    },
    {
        "max397574/better-escape.nvim",
        opts = {
            mapping = { "jj", "jk", "kj" },
        },
    },
    {
        "windwp/nvim-ts-autotag",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = true,
        event = 'InsertEnter',
    },
    {
        "m4xshen/autoclose.nvim",
        config = true,
    },
    --[[ {
        "j-hui/fidget.nvim",
        event = "LspAttach",
        opts = {
            text = {
                spinner = "meter",
            },
        },
    }, ]]
    {
        "lewis6991/gitsigns.nvim",
        config = true,
    },
    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        event = "LspAttach",
        config = true,
        init = function()
            vim.keymap.set("n", "<Leader>e", "<cmd>TroubleToggle<CR>", { silent = true, noremap = true })
        end,
    },
}
