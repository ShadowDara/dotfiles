-- Syntax Highlighting
-- vim.cmd("syntax on")
-- vim.cmd("filetype plugin indent on")

-- Clone the Plugin Manager
-- git clone https://github.com/LazyVim/starter ~/.config/nvim

-- rm -rf ~/.config/nvim
-- ln -s ~/dotfiles/nvim ~/.config/nvim

-- Pfad zur echten LazyVim init.lua
local lazyvim_path = vim.fn.expand("~/dotfiles/neovim/nvim/init.lua")

-- Datei laden
dofile(lazyvim_path)

