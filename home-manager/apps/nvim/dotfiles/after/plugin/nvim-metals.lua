local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })

metals_config = require("metals").bare_config()

metals_config.init_options.statusBarProvider = "on"

metals_config.settings = {
    superMethodLensesEnabled = true,
    showImplicitArguments = true,
    showInferredType = true,
    showImplicitConversionsAndClasses = true,
    excludedPackages = {},
}

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "scala", "sbt", "java" },
    callback = function()
        require("metals").initialize_or_attach(metals_config)
    end,
    group = nvim_metals_group,
})

