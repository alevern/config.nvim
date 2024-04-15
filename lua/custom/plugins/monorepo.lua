return {
  "imNel/monorepo.nvim",
  config = function()
    require("monorepo").setup()
    vim.keymap.set("n", "<leader>mm", function()
      require("telescope").extensions.monorepo.monorepo()
    end, { desc = "View monorepo" })
    vim.keymap.set("n", "<leader>mt", function()
      require("monorepo").toggle_project()
    end, { desc = "Toggle project" })
    vim.keymap.set("n", "<leader>ma", function()
      require("monorepo").add_project()
    end, { desc = "Add project" })
    vim.keymap.set("n", "<leader>mr", function()
      require("monorepo").remove_project()
    end, { desc = "Remove project" })
    vim.keymap.set("n", "<leader>mp", function()
      require("monorepo").previous_project()
    end, { desc = "Previous project" })
    vim.keymap.set("n", "<leader>mn", function()
      require("monorepo").next_project()
    end, { desc = "Next project" })
    for i = 1, 9 do
      vim.keymap.set("n", "<leader>m" .. i, function()
        require("monorepo").go_to_project(i)
      end, { desc = "Go to project " .. i })
    end
  end,
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
}
