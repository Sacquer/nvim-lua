-- find_files: List files in your current directory
-- git_files: Fuzzy search through the output of `git ls-files` command, respects `.gitignore`
-- grep_string: Searches for the string under your cursor or selection in your current directory
-- live_grep: Search for a string in your current working directory and get results live as you type, respects `.gitignore`. (Requires [https://github.com/BurntSushi/ripgrep](ripgrep)

return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more opts
            }),
          },
        },
      })

      require("telescope").load_extension("ui-select")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more opts
            }),

            -- pseudo code / specification for writing custom displays, like the one
            -- for "codeactions"
            -- specific_opts = {
            --   [kind] = {
            --     make_indexed = function(items) -> indexed_items, width,
            --     make_displayer = function(widths) -> displayer
            --     make_display = function(displayer) -> function(e)
            --     make_ordinal = function(e) -> string
            --   },
            --   -- for example to disable the custom builtin "codeactions" display
            --      do the following
            --   codeactions = false,
            -- }
          },
        },
      })

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<C-p>", builtin.git_files, {})
      vim.keymap.set("n", "<leader>ps", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)

      -- <cword>    is replaced with the word under the cursor (like |star|)
      vim.keymap.set("n", "<leader>sw", function()
        local word = vim.fn.expand("<cword>")
        builtin.grep_string({ search = word })
      end)

      -- <cWORD>    is replaced with the WORD under the cursor (see |WORD|)
      vim.keymap.set("n", "<leader>sW", function()
        local word = vim.fn.expand("<cWORD>")
        builtin.grep_string({ search = word })
      end)

      vim.keymap.set("n", "<leader>,", function()
        builtin.buffers({ desc = '[ ] Find existing buffers' })
      end)

      vim.keymap.set("n", "<leader>sx", function()
        builtin.resume({ desc = "Resume " })
      end)

      vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>")

      vim.keymap.set("n", "<leader>sd", function()
        builtin.diagnostics({ desc = '[S]earch [D]iagnostics' })
      end)

      vim.keymap.set("n", "<leader>gc", function()
        builtin.git_branches({})
      end)

      vim.keymap.set("n", "<leader>gw", function()
        builtin.git_worktree({})
      end)

      vim.keymap.set("n", "<leader>sk", function()
        builtin.keymaps()
      end)

      vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
    end,
  },
}
