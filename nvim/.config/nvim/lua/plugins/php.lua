return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          settings = {
            intelephense = {
              files = {
                maxSize = 5000000,
              },
              environment = {
                includePaths = {
                  "vendor",
                },
              },
              format = {
                enable = false,
              },
            },
          },
          on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false -- extra safety
          end,
        },
      },
    },
  },
}
