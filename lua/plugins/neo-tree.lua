return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
    require("neo-tree").setup{
      filesystem = {
        filtered_items = {
          visible = true,  -- Show hidden files
          hide_dotfiles = false, -- Show dotfiles (e.g., .gitignore)
          hide_gitignored = false, -- Show gitignored files
          hide_by_name = {}, -- Remove specific hidden file filters
        },
      },
    }
      vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
      vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
    end,
}
