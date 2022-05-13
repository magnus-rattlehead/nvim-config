require'lsp-format'.setup {
  html = {{cmd = {"prettier -w"}}},
  css = {{cmd = {"prettier -w"}}},
  json = {{cmd = {"prettier -w"}}},
  yaml = {{cmd = {"prettier -w"}}},
  javascript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
  typescript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
}

require "lspconfig".html.setup { on_attach = on_attach }
require "lspconfig".cssls.setup { on_attach = on_attach }
require "lspconfig".tsserver.setup { on_attach = on_attach }
require "lspconfig".pylsp.setup { on_attach = on_attach }
