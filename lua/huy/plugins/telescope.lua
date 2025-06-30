return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
    },
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          wrap_result = true,
          mappings = {
            i = {
              ["<esc>"] = require("telescope.actions").close,
              ["<C-Down>"] = require("telescope.actions").cycle_history_next,
              ["<C-Up>"] = require("telescope.actions").cycle_history_prev,
            },
          },
          layout_strategy = "vertical",
          layout_config = {
            vertical = {
              width = 0.9,
              preview_cutoff = 10,
            },
          },
        },
        pickers = {
          lsp_references = { wrap_results = true },
          lsp_definitions = { wrap_results = true },
          diagnostics = { wrap_results = true },
          find_files = { wrap_results = true },
          buffers = { sort_mru = true, ignore_current_buffer = true },
        },
      })

      -- load extension an toàn
      pcall(telescope.load_extension, "fzf")
    end,

    keys = {
      { "<leader>fo", function() require("telescope.builtin").oldfiles({ prompt_title = "Recent files", sort_mru = true }) end, desc = "Old (recent) files" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find filenames" },
      { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Marks" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep files" },
      { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
      { "<leader>fG", function() require("telescope.builtin").live_grep({ prompt_title = "Grep open files", grep_open_files = true }) end, desc = "Grep open files" },
      { "<leader>fc", function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "Grep this file" },
      { "<leader>:", function() require("telescope.builtin").command_history({ prompt_title = "Command history" }) end, desc = "CMD history" },
      {
        "<leader>fs",
        function()
          local aerial_avail, _ = pcall(require, "aerial")
          if aerial_avail then
            require("telescope").extensions.aerial.aerial()
          else
            require("telescope.builtin").lsp_document_symbols()
          end
        end,
        desc = "Search symbols",
      },
    },
  },
}

