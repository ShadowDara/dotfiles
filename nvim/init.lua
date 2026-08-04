vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

vim.g.mapleader = " "

-- Editor Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.fillchars = {
  vert = "│",
}

require("lazy").setup({

  -- Dependencies
  "nvim-lua/plenary.nvim",

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- Syntax Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- Tabs oben (geöffnete Dateien)
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("bufferline").setup()
    end,
  },

  -- Datei-Baum links
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup()

      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
    end,
  },

  -- Statusleiste unten
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lualine").setup({
        sections = {
          lualine_c = { "filename" },
        },
      })
    end,
  },

})
