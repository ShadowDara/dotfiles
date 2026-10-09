-- ============================================
-- Leader
-- ============================================

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.clipboard = "unnamedplus"

-- ============================================
-- Lazy.nvim
-- ============================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)


-- ============================================
-- Editor Settings
-- ============================================

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.fillchars = {
  vert = "│",
}


-- ============================================
-- Plugins
-- ============================================

require("lazy").setup({

  -- --------------------------------------------
  -- Dependencies
  -- --------------------------------------------

  "nvim-lua/plenary.nvim",

  
  -- ============================================
  -- Battery Status
  -- ============================================

  {
    "justinhj/battery.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      update_rate_seconds = 60,

      -- Auf Desktop-PCs nichts anzeigen
      show_status_when_no_battery = false,

      -- Akku-Symbol + Prozent
      show_percent = true,

      -- Kabel-Symbol
      show_plugged_icon = true,
      show_unplugged_icon = false,

      vertical_icons = false,
    },
  },


  -- --------------------------------------------
  -- Telescope
  -- --------------------------------------------

  {
    "nvim-telescope/telescope.nvim",

    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    config = function()
      local telescope = require("telescope")

      telescope.setup()

      vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
      vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
      vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
      vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
    end,
  },
  
  
  --
  -- Colors Sheme
  --
  
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },


  -- --------------------------------------------
  -- Treesitter
  -- --------------------------------------------

  {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter").install({
      "c",
      "cpp",
      "lua",
      "bash",
      "vim",
      "vimdoc",
      "query",
      "rust",
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local ok = pcall(vim.treesitter.start, args.buf)
        if not ok then
          return
        end
      end,
    })
  end,
},	
  
  
  -- --------------------------------------------
  -- Icons
  -- --------------------------------------------

  {
    "nvim-tree/nvim-web-devicons",
  },


  -- --------------------------------------------
  -- Bufferline
  -- --------------------------------------------

  {
    "akinsho/bufferline.nvim",

    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    config = function()
      require("bufferline").setup({})
    end,
  },


  -- --------------------------------------------
  -- File Tree
  -- --------------------------------------------

  {
    "nvim-tree/nvim-tree.lua",

    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    config = function()
      require("nvim-tree").setup({
        view = {
          width = 30,
        },

        renderer = {
          group_empty = true,
        },

        filters = {
          dotfiles = false,
        },
      })

      vim.keymap.set(
        "n",
        "<leader>e",
        "<cmd>NvimTreeToggle<CR>",
        { desc = "Toggle File Explorer" }
      )
    end,
  },


  -- --------------------------------------------
  -- Lualine
  -- --------------------------------------------

  {
    "nvim-lualine/lualine.nvim",

    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
        },

        sections = {
          lualine_c = {
            "filename",
          },
		  
		  lualine_x = {
            function()
              return os.date("%d.%m.%Y  %H:%M:%S")
            end,
			
			function()
			  local battery = require("battery")
			  return battery.get_status_line()
			end,
          },

        },
      })
    end,
  },
  
  
  -- --------------------------------------------
  -- Rust / rust-analyzer
  -- --------------------------------------------

  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,

    init = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.g.rustaceanvim = {
        server = {
          capabilities = capabilities,

          default_settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
              },

              check = {
                command = "clippy",
              },
            },
          },
        },
      }
    end,

  },
  
  
  -- --------------------------------------------
  -- Commenting
  -- --------------------------------------------

  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()

      -- Visual Mode: Ctrl + #
      vim.keymap.set(
        "x",
        "<C-_>",
        "gc",
        { remap = true, desc = "Toggle Comment" }
      )
    end,
  },


-- --------------------------------------------
-- Completion
-- --------------------------------------------

{
  "hrsh7th/nvim-cmp",

  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
	  formatting = {
	    format = require("lspkind").cmp_format({
		  mode = "symbol_text",
		  maxwidth = 50,
	    }),
	  },
	
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),

        ["<CR>"] = cmp.mapping.confirm({
          select = true,
        }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
      }),
    })
  end,
},


--
-- ICONS
--

{
  "onsails/lspkind.nvim",
},


-- =============================================
-- } nach { automatisch setzen
-- =============================================

{
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({})
  end,
},

{
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable("clangd") -- Neovim 0.11+
    end,
  },

  {
    "michaelrommel/nvim-silicon",
    cmd = "Silicon",
    opts = {
      theme = "Dracula",
      to_clipboard = true,
      wslclipboard = true,
    },
  },

})


-- ============================================
-- Buffer Navigation
-- ============================================

vim.keymap.set(
  "n",
  "<Tab>",
  "<Cmd>BufferLineCycleNext<CR>",
  { desc = "Next Buffer" }
)

vim.keymap.set(
  "n",
  "<S-Tab>",
  "<Cmd>BufferLineCyclePrev<CR>",
  { desc = "Previous Buffer" }
)


-- Buffer 1-9
for i = 1, 9 do
  vim.keymap.set(
    "n",
    "<leader>" .. i,
    "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>",
    { desc = "Go to Buffer " .. i }
  )
end


-- ============================================
--
-- ============================================

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rs",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

