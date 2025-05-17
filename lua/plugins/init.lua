require'lspconfig'.pyright.setup{}
return {
    {
    "github/copilot.vim",
    lazy = false,
    config = function() -- Mapping tab is already used in NvChad
      vim.g.copilot_no_tab_map = true; -- Disable tab mapping
      vim.g.copilot_assume_mapped = true; -- Assume that the mapping is already done
    end
    },
    {
        'javiorfo/nvim-soil',

        -- Optional for puml syntax highlighting:
        dependencies = { 'javiorfo/nvim-nyctophilia' },

        lazy = true,
        ft = "plantuml",
        opts = {
            -- If you want to change default configurations

            -- This option closes the image viewer and reopen the image generated
            -- When true this offers some kind of online updating (like plantuml web server)
            actions = {
                redraw = false
            },

            -- If you want to use Plant UML jar version instead of the installed version
            puml_jar = "/path/to/plantuml.jar",

            -- If you want to customize the image showed when running this plugin
            image = {
                darkmode = false, -- Enable or disable darkmode
                format = "png", -- Choose between png or svg

                -- This is a default implementation of using nsxiv to open the resultant image
                -- Edit the string to use your preferred app to open the image (as if it were a command line)
                -- Some examples:
                -- return "feh " .. img
                -- return "xdg-open " .. img
                execute_to_open = function(img)
                    return "nsxiv -b " .. img
                end
            }
        }
    },
    {"ellisonleao/glow.nvim", config = true, cmd = "Glow"},
    { "nvim-lua/plenary.nvim"  },
    {
        "nvim-pack/nvim-spectre",
        cmd = "Spectre",
        keys = {{
            '<leader>S', '<cmd>lua require("spectre").toggle()<CR>',
            desc = "Toggle Spectre"
        },{
            '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
            desc = "Search current word"

        },{
            '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>',
            desc = "Search current word"
        }, {'<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
        desc = "Search on current file"}
    }
},
{
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
        {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>xX",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
        },
        {
            "<leader>cs",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Symbols (Trouble)",
        },
        {
            "<leader>cl",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
            "<leader>xL",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Location List (Trouble)",
        },
        {
            "<leader>xQ",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Quickfix List (Trouble)",
        },
    },
},
{
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
        require "configs.conform"
    end,
},
{
    "zbirenbaum/neodim",
    event = "LspAttach",
    config = function()
        require("neodim").setup({
            alpha = 0.5,
            blend_color = "#000000",
            hide = {
                underline = true,
                virtual_text = true,
                signs = true,
            },
            regex = {
                "[uU]nused",
                "[nN]ever [rR]ead",
                "[nN]ot [rR]ead",
            },
            priority = 128,
            disable = {},
        })
    end
} 

-- These are some examples, uncomment them if you want to see them work!
-- {
--   "neovim/nvim-lspconfig",
--   config = function()
--     require("nvchad.configs.lspconfig").defaults()
--     require "configs.lspconfig"
--   end,
-- },
--
-- {
-- 	"williamboman/mason.nvim",
-- 	opts = {
-- 		ensure_installed = {
-- 			"lua-language-server", "stylua",
-- 			"html-lsp", "css-lsp" , "prettier"
-- 		},
-- 	},
-- },
--
-- {
-- 	"nvim-treesitter/nvim-treesitter",
-- 	opts = {
-- 		ensure_installed = {
-- 			"vim", "lua", "vimdoc",
--      "html", "css"
-- 		},
-- 	},
-- },

}

