cmd = { 
    "clangd",
    "--pretty",
    "--header-insertion=iwyu",
    "--background-index",
    "-j=40",
    "--pch-storage=memory",
    "--clang-tidy"
}

local cwd = vim.fn.getcwd(-1, -1)
if cwd == '/workspace/cplane' then
    table.insert(cmd, "--compile-commands-dir=build")
elseif cwd == '/workspace/cplane/CP-RT/CP-RT' then
    table.insert(cmd, "--compile-commands-dir=build")
end

return {
    cmd = cmd
}