return {
 {
  "kdheepak/lazygit.nvim",
  cmd = "LazyGit",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
  },
  config = function()
    -- Optional: settings for floating window look
    vim.g.lazygit_floating_window_use_plenary = 1
    vim.g.lazygit_floating_window_scaling_factor = 0.9 -- 90% of screen
    vim.g.lazygit_floating_window_winblend = 0        -- no transparency
    vim.g.lazygit_floating_window_border_chars = { '╭', '╮', '╯', '╰', '│', '─', '│', '─' }
    vim.g.lazygit_use_neovim_remote = 1               -- use nvr for better integration
  end,

 }
}