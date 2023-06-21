local M = {
    "ibhagwan/fzf-lua",
    branch = "main",
    config = true,
}  

M.custom_files = function()
    local cwd = vim.fn.getcwd(-1, -1)
    if cwd == '/var/fpwork/reiss/gnb/cplane' then
        require("fzf-lua").files({cmd = "/home/reiss/ripgrep/rg --files --hidden --follow -g '!{CP-RT,CP-NRT,build}'"})
    elseif cwd == '/var/fpwork/reiss/gnb/cplane/CP-RT/CP-RT' then
        require("fzf-lua").files({cmd = "/home/reiss/ripgrep/rg --files --hidden --follow -g '!{build}'"})
    else
        require("fzf-lua").files()
    end
end

return M