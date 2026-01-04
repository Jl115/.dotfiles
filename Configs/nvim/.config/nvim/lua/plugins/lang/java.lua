return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mfussenegger/nvim-jdtls",
      "mfussenegger/nvim-dap",
    },
    opts = {
      setup = {
        jdtls = function(_, opts)
          local jdtls = require("jdtls")
          local util = require("lspconfig.util")

          -- 1. Locate the Debugger Bundles (Required for DAP)
          local mason_registry = require("mason-registry")
          local bundles = {}

          if mason_registry.is_installed("java-debug-adapter") then
            local java_debug_pkg = mason_registry.get_package("java-debug-adapter")
            local java_debug_path = java_debug_pkg:get_install_path()
            local jar_pattern = java_debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"
            vim.list_extend(bundles, vim.split(vim.fn.glob(jar_pattern), "\n"))
          end

          if mason_registry.is_installed("java-test") then
            local java_test_pkg = mason_registry.get_package("java-test")
            local java_test_path = java_test_pkg:get_install_path()
            local jar_pattern = java_test_path .. "/extension/server/*.jar"
            vim.list_extend(bundles, vim.split(vim.fn.glob(jar_pattern), "\n"))
          end

          -- 2. Determine Project Root
          local root_dir = util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle")(vim.fn.expand("%:p"))
          if root_dir == nil then
            return
          end

          local project_name = vim.fn.fnamemodify(root_dir, ":t")
          local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name

          -- 3. Define Command
          local jdtls_cmd = {
            "jdtls",
            "--jvm-arg=-javaagent:" .. vim.fn.stdpath("data") .. "/mason/packages/jdtls/lombok.jar",
          }

          -- 4. Merge Configuration
          local config = vim.tbl_deep_extend("force", opts, {
            cmd = jdtls_cmd,
            root_dir = root_dir,
            init_options = {
              workspace = workspace_dir,
              bundles = bundles,
            },
            settings = {
              java = {
                signatureHelp = { enabled = true },
                contentProvider = { preferred = "fernflower" },
                configuration = {
                  updateBuildConfiguration = "interactive",
                  runtimes = {
                    {
                      name = "JavaSE-25",
                      -- Path updated to point to 'Home' (removed /bin/java)
                      path = "/opt/homebrew/Cellar/openjdk/25.0.1/libexec/openjdk.jdk/Contents/Home",
                    },
                  },
                },
                eclipse = { downloadSources = true },
                maven = { downloadSources = true },
                implementationsCodeLens = { enabled = true },
                referencesCodeLens = { enabled = true },
              },
            },
          })

          -- 5. Attach & Setup DAP
          config.on_attach = function(client, buffer)
            require("jdtls").setup_dap({ hotcodereplace = "auto" })
            require("jdtls.dap").setup_dap_main_class_configs()
          end

          jdtls.start_or_attach(config)
          return true
        end,
      },
    },
  },
}
