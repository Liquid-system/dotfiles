require("lspconfig").efm.setup({
  {
    init_options = { documentFormatting = true },
    single_file_support = true,
    filetypes = { "markdown" },
    settings = {
      rootMarkers = { ".git/" },
      languages = {
        markdown = {
          {
            lintIgnoreExitCode = true,
            lintCommand = [[npx textlint -f json ${INPUT} | jq -r '.[] | .filePath as $filePath | .messages[] | "1;\($filePath):\(.line):\(.column):\n2;\(.message | split("\n")[0])\n3;[\(.ruleId)]"']],
            lintFormats = { "%E1;%E%f:%l:%c:", "%C2;%m", "%C3;%m%Z" },
          },
        },
      },
    },
  },
  {
    init_options = { documentFormatting = true },
    settings = {
      rootMarkers = { ".git/" },
      languages = {
        lua = {
          { formatCommand = "lua-format -i", formatStdin = true },
        },
      },
    },
  },
})
