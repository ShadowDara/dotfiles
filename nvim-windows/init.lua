-- ============================================
-- Leader
-- ============================================

vim.g.mapleader = " "
vim.g.maplocalleader = " "


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


  -- --------------------------------------------
  -- Treesitter
  -- --------------------------------------------

  {
    "nvim-treesitter/nvim-treesitter",

    build = ":TSUpdate",

    config = function()
      require("nvim-treesitter.config").setup({
        ensure_installed = {
          "c",
          "cpp",
          "lua",
          "bash",
          "vim",
          "vimdoc",
          "query",
        },

        highlight = {
          enable = true,
        },

        indent = {
          enable = true,
        },
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
        },
      })
    end,
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

-- 
-- RUST LSP
--

vim.lsp.config("rust_analyzer", {
    cmd = { "rust-analyzer" },
})

vim.lsp.enable("rust_analyzer")

