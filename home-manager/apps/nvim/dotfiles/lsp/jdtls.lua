local runtimes_str = vim.env.NIX_JAVA_RUNTIMES

if not runtimes_str then
    vim.notify(
        "NIX_JAVA_RUNTIMES is not set. Install the Nix java module.",
        vim.log.levels.ERROR
    )
end

local runtimes = {}
if runtimes_str then
    for version in runtimes_str:gmatch("[^,]+") do
        local path = vim.env["JAVA_" .. version .. "_HOME"]
        if path then
            table.insert(runtimes, {
                name = "JavaSE-" .. version,
                path = path .. "/lib/corretto",
            })
        end
    end
end

vim.lsp.config("jdtls", {
    --  Set java home
    cmd_env = {
      JAVA_HOME = os.getenv('JAVA_21_HOME'),
    },

    cmd = {
        vim.fn.expand '$HOME/.local/share/nvim/mason/bin/jdtls',
        ('--jvm-arg=-javaagent:%s'):format(vim.fn.expand '$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar')
    },

    root_dir = vim.fs.root(0, { 'pom.xml', '.git' }),

    settings = {
        java = {
            configuration = {
                runtimes = runtimes,
            },
        },
    },
})
