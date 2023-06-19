return {
    cmd = { 
        "clangd",
        "--pretty",
        "--header-insertion=iwyu",
        "--background-index",
        "-j=40",
        "--pch-storage=memory",
        "--clang-tidy"
    },
}