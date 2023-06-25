cmd = { 
    "clangd",
    "--pretty",
    "--header-insertion=iwyu",
    "--background-index",
    "-j=40",
    "--pch-storage=memory",
    "--clang-tidy",
    "--offset-encoding=utf-32"
}

local cwd = vim.fn.getcwd(-1, -1)
if cwd == '/var/fpwork/reiss/gnb/cplane' then
    table.insert(cmd, "--compile-commands-dir=build")
elseif cwd == '/var/fpwork/reiss/gnb/cplane/CP-RT/CP-RT' then
    table.insert(cmd, "--compile-commands-dir=build")
end

return {
    cmd = cmd
}