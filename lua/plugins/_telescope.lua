-- https://github.com/nvim-telescope/telescope.nvim

-- Description:
-- telescope.nvim is a highly extendable fuzzy finder over lists.
-- Built on the latest awesome features from neovim core.
-- Telescope is centered around modularity, allowing for easy customization.

local function config()
  require("telescope").load_extension("ui-select")
  require('telescope').load_extension('aerial')
  require('telescope').load_extension('fzf')

  local actions = require("telescope.actions")

  require('telescope').setup({
    defaults = { mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
      n = {
        ["<C-j>"] = actions.cycle_history_next,
        ["<C-k>"] = actions.cycle_history_prev,
      }
    } },
    pickers = {
      find_files = {
        require("telescope.themes").get_dropdown {}
      }
    },
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {}
      },
      aerial = {
        -- Display symbols as <root>.<parent>.<symbol>
        show_nesting = {
          ['_'] = false, -- This key will be the default
        }
      },
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      }
    }
  })

  local wk = require("which-key")
  local key_opts = {
    mode    = "n",
    buffer  = nil, -- Global
    silent  = true, -- use `silent ` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
  }

  wk.register(
    {
      ["<leader>E"] = {
        "<cmd>lua require('telescope.builtin').find_files()<cr>",
        "TELE:: search filename"
      },
      ["<leader>R"] = {
        "<cmd>lua require('telescope.builtin').live_grep()<cr>",
        "TELE:: search in files"
      },
      ["<leader>B"] = {
        "<cmd>lua require('telescope.builtin').buffers()<cr>",
        "TELE:: buffer list"
      },
      ["<leader>?"] = {
        "<cmd>lua require('telescope.builtin').help_tags()<cr>",
        "TELE:: helps"
      },
    },
    key_opts
  )

end

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
    'stevearc/aerial.nvim',
  },
  after = {
    'nvim-lspconfig',
  },
  config = config,
}
