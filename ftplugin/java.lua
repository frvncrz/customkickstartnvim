-- ~/.config/nvim/ftplugin/java.lua

local jdtls = require 'jdtls'

local root_dir = require('jdtls.setup').find_root {
  '.git',
  'mvnw',
  'gradlew',
  'pom.xml',
  'build.gradle',
}

if not root_dir then
  print 'JDTLS: root not found'
  return
end

local mason_path = vim.fn.stdpath 'data' .. '/mason'

local bundles = {
  vim.fn.glob(mason_path .. '/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar'),
}

vim.list_extend(bundles, vim.fn.glob(mason_path .. '/packages/java-test/extension/server/*.jar', true))

jdtls.setup_dap {
  hotcodereplace = 'auto',
  config_overrides = {},
}
jdtls.setup_dap_main_class_configs()

jdtls.start_or_attach {
  cmd = { 'jdtls' },
  root_dir = root_dir,
  init_options = {
    bundles = bundles,
  },
}
