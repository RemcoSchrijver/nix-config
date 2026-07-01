local notified_runtimes = false
local notified_lombok = false

local runtimes_str = vim.env.NIX_JAVA_RUNTIMES
local lombok_jar = vim.env.NIX_LOMBOK

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

return {
    cmd_env = {
        JAVA_HOME = os.getenv('JAVA_25_HOME'),
    },

    cmd = {
        vim.fn.expand '$HOME/.local/share/nvim/mason/bin/jdtls',
        ('--jvm-arg=-javaagent:%s'):format(lombok_jar)
    },

    root_markers = { 'pom.xml', '.git' },

    settings = {
        java = {
            configuration = {
                runtimes = runtimes,
            },
        },
    },

    on_attach = function(client, bufnr)
        if not notified_runtimes and not runtimes_str then
            vim.notify(
                "NIX_JAVA_RUNTIMES is not set. Install the Nix java module.",
                vim.log.levels.ERROR
            )
            notified_runtimes = true;
        end

        if not notified_lombok and not lombok_jar then
            vim.notify(
                "Lombok is not set, Lombok based methods will not be found. Install the Nix java module.",
                vim.log.levels.WARN
            )
            notified_lombok = true;
        end
    end

}
