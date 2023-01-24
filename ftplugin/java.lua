local fn = vim.fn
local project_name = fn.fnamemodify(fn.getcwd(), ':p:h:t')

local home_dir = os.getenv('HOME')
local nvim_dir = home_dir..'/.config/nvim'
local rule_dir = nvim_dir..'/rule/'
local java_settings_url = rule_dir..'settings.prefs'
local java_format_style_rule = rule_dir..'eclipse-java-google-style.xml'
local java_debug_jar = fn.stdpath('data')..'/mason/packages/java-debug-adapter/extension/server/*.jar'
local workspace_root_dir = nvim_dir..'/workspace/'
local workspace_dir = workspace_root_dir..project_name
local jdtls_path = vim.fn.stdpath('data') .. '/mason/packages/jdtls'
local jdtls_plugins_path = jdtls_path .. '/plugins/'
local equinox_jar = jdtls_plugins_path .. 'org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'
local lombok_jar = jdtls_path .. '/lombok.jar'
if vim.fn.has("mac") == 1 then
  CONFIG = "mac"
elseif vim.fn.has("unix") == 1 then
  CONFIG = "linux"
else
  print("Unsupported system")
end

local on_attach = function()
  -- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
  -- you make during a debug session immediately.
  -- Remove the option if you do not want that.
  require("jdtls").setup_dap({ hotcodereplace = "auto" })
  require("jdtls.setup").add_commands()
  require("jdtls.dap").setup_dap_main_class_configs()
end

local bundles = {}
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
vim.list_extend(bundles, vim.split(vim.fn.glob(mason_path .. "packages/java-test/extension/server/*.jar"), "\n"))
vim.list_extend(
  bundles,
  vim.split(vim.fn.glob(mason_path ..
    "packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"), "\n")
)
-- print(vim.inspect(bundles))

local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
-- Watch out for the 💀, it indicates that you must adjust something.
local config = {
  cmd = {
    -- 💀
    "java", -- or '/path/to/java11_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:" .. lombok_jar,
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    -- 💀
    "-jar",
    equinox_jar,
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
    -- Must point to the                                                     Change this to
    -- eclipse.jdt.ls installation                                           the actual version

    -- 💀
    "-configuration",
    home_dir .. "/.local/share/nvim/mason/packages/jdtls/config_" .. CONFIG,
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
    -- Must point to the                      Change to one of `linux`, `win` or `mac`
    -- eclipse.jdt.ls installation            Depending on your system.

    -- 💀
    -- See `data directory configuration` section in the README
    "-data",
    workspace_dir,
  },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    ['java.settings.url'] = java_settings_url,
    java = {
      codeGeneration = {
        toString = {
          codeStyle = "STRING_BUILDER_CHAINED"
        },
        useBlocks = true,
      },
      contentProvider = { preferred = 'fernflower' },
      implementationsCodeLens = {
        enabled = true
      },
      referencesCodeLens = {
        enabled = true
      },
      signatureHelp = { enabled = true },
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
      },
      maven = {
        downloadSources = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        }
      },
      format = {
        settings = {
          url = java_format_style_rule,
          profile = 'GoogleStyle'
        }
      }
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {
      bundles = bundles,
      extendedClientCapabilities = extendedClientCapabilities,
    }
  },

  capabilities = vim.lsp.protocol.make_client_capabilities(),

  flags = {
    allow_incremental_sync = true,
    debounce_text_changes = 150,
    server_side_fuzzy_completion = true
  },
  ['on_attach'] = on_attach,
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
