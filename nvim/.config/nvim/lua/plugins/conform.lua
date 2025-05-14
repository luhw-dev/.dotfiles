return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      php = { "pint", "php_cs_fixer" },
      blade = { "blade-formatter" },
    },
    formatters = {
      pint = {
        command = function()
          -- tenta pegar o pint local do projeto Laravel
          local local_pint = vim.fn.getcwd() .. "/vendor/bin/pint"
          if vim.fn.executable(local_pint) == 1 then
            return local_pint
          end
          -- fallback pro global (no PATH)
          return "pint"
        end,
        args = { "--quiet", "$FILENAME" },
        stdin = false,
      },
    },
  },
}
