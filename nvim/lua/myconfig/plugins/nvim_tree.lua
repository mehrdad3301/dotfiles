return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()

    require("nvim-tree").setup {
      -- Additional setup can go here if needed
    }

    local api = require("nvim-tree.api")

   -- Add the custom keybinding for toggling focus
    vim.keymap.set('n', '<C-b>', function()
      local tree_is_open = require('nvim-tree.view').is_visible() -- Check if the tree is currently visible
      
      if tree_is_open then
        -- If the tree is open, switch to the previous window (which would be the file)
        vim.cmd('wincmd p')
      else
        -- If the tree is not open, focus on the nvim-tree
        vim.cmd('NvimTreeToggle')  -- Focus the tree after opening it
        vim.cmd('NvimTreeFocus')  -- Focus the tree after opening it
      end
    end, { noremap = true, silent = true })

  end,
}

