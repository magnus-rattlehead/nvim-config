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

local on_attach = function()
  -- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
  -- you make during a debug session immediately.
  -- Remove the option if you do not want that.
  require("jdtls").setup_dap({ hotcodereplace = "auto" })
  require("jdtls.setup").add_commands()
  require("jdtls.dap").setup_dap_main_class_configs()
end

local is_file_exist = function(path)
  local f = io.open(path, 'r')
  return f ~= nil and io.close(f)
end

local get_lombok_javaagent = function()
  local lombok_dir = '/opt/lombok-bin/lib/'
  local lombok_versions = io.popen('ls -1 "' .. lombok_dir .. '" | sort -r')
  if lombok_versions ~= nil then
    local lb_i, lb_versions = 0, {}
    for lb_version in lombok_versions:lines() do
      lb_i = lb_i + 1
      lb_versions[lb_i] = lb_version
    end
    lombok_versions:close()
    if next(lb_versions) ~= nil then
      local lombok_jar = fn.expand(string.format('%s%s/*.jar', lombok_dir, lb_versions[1]))
      if is_file_exist(lombok_jar) then
        return string.format('--jvm-arg=-javaagent:%s', lombok_jar)
      end
    end
  end
  return ''
end

local get_java_debug_jar = function()
  local jdj_full_path = fn.expand(java_debug_jar)
  if is_file_exist(jdj_full_path) then
    return jdj_full_path
  end
  return ''
end

local get_cmd = function()
  local cmd = {

    -- 💀
    'jdtls',
  }

  local lombok_javaagent = get_lombok_javaagent()
  if (lombok_javaagent ~= '') then
    table.insert(cmd, lombok_javaagent)
  end

  -- 💀
  -- See `data directory configuration` section in the README
  table.insert(cmd, '-data')
  table.insert(cmd, workspace_dir)

  return cmd
end

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
-- Watch out for the 💀, it indicates that you must adjust something.
local config = {
  cmd = get_cmd(),

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
        hashCodeEquals = {
          useInstanceof = true,
          useJava7Objects = false
        },
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
      get_java_debug_jar()
    }
  },

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
