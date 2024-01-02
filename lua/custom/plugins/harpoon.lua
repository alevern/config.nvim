return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup({})

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end
    -- Harpoon keymaps
    vim.keymap.set("n", "<M-a>", function() harpoon:list():append() end, { desc = "Harpoon: Append File" })
    vim.keymap.set("n", "<M-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = "Harpoon: Open Window" })

    vim.keymap.set("n", "<M-h>", function() harpoon:list():select(1) end, { desc = "Harpoon: Goto 1" })
    vim.keymap.set("n", "<M-j>", function() harpoon:list():select(2) end, { desc = "Harpoon: Goto 2" })
    vim.keymap.set("n", "<M-k>", function() harpoon:list():select(3) end, { desc = "Harpoon: Goto 3" })
    vim.keymap.set("n", "<M-l>", function() harpoon:list():select(4) end, { desc = "Harpoon: Goto 4" })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<M-p>", function() harpoon:list():prev() end, { desc = "Harpoon: Previous" })
    vim.keymap.set("n", "<M-n>", function() harpoon:list():next() end, { desc = "Harpoon: Next" })
    vim.keymap.set("n", "<M-S-e>", function() toggle_telescope(harpoon:list()) end,
      { desc = "Harpoon: Open Telescope window" })
  end
}
