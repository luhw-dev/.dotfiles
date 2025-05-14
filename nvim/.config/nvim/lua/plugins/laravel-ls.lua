return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        laravel_ls = {
          default_config = {
            cmd = { "laravel-ls" }, -- or use vim.fn.expand("$HOME/go/bin/laravel-ls")
            filetypes = { "php", "blade" },
            root_dir = function(fname)
              return require("lspconfig.util").root_pattern("composer.json", ".git")(fname)
            end,
          },
        },
      },
    },
  },
}
