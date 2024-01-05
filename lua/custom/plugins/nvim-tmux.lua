return {
  "alexghergh/nvim-tmux-navigation",
  event = "VeryLazy",
  config = function()
    local nvim_tmux_nav = require("nvim-tmux-navigation")
    nvim_tmux_nav.setup({
      disable_when_zoomed = true, -- defaults to false
      keybindings = {
        left = "<C-h>",
        down = "<C-j>",
        up = "<C-k>",
        right = "<C-l>",
        last_active = "<C-\\>",
        next = "<C-Space>",
      },
    })
    vim.api.nvim_set_keymap("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<C-Space>", "<Cmd>NvimTmuxNavigateNext<CR>", { silent = true })
  end,
}
