return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    follow_current_file = true,
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          "node_modules",
        },
        never_show = {
          ".git",
          ".DS_Store",
          ".history",
          "thumbs.db",
        },
      },
    },
  },
}
