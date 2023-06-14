return {
    cmd = { 
        "clangd",
        "--background-index",
        "-j=40",
        "--pch-storage=memory",
        "--clang-tidy"
    },
}