-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return { -- lazy.nvim
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    opts = {
      cmdline = {
        enabled = true,
        view = 'cmdline_popup', -- popup for `:` and `/`
        format = {
          search_down = { kind = 'search', pattern = '^/', icon = ' ', lang = 'regex' },
          search_up = { kind = 'search', pattern = '^%?', icon = ' ', lang = 'regex' },
        },
      },
      views = {
        cmdline_popup = {
          position = {
            row = '10%', -- vertical position
            col = '50%', -- horizontal (center)
          },
          size = {
            width = 60, -- reduce width of popup box
            height = 'auto',
          },
          border = {
            style = 'rounded',
            padding = { 1, 2 }, -- reduce outer padding
          },
          win_options = {
            winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
          },
        },
      },
      presets = {
        bottom_search = false, -- disable old Vim-style bottom search
        command_palette = false,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
    },
  },

  {
    'kdheepak/lazygit.nvim',
    cmd = 'LazyGit',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'Open LazyGit' },
    },
    config = function()
      -- Optional: settings for floating window look
      vim.g.lazygit_floating_window_use_plenary = 1
      vim.g.lazygit_floating_window_scaling_factor = 0.9 -- 90% of screen
      vim.g.lazygit_floating_window_winblend = 0 -- no transparency
      vim.g.lazygit_floating_window_border_chars = { '╭', '╮', '╯', '╰', '│', '─', '│', '─' }
      vim.g.lazygit_use_neovim_remote = 1 -- use nvr for better integration
    end,
  },
}
