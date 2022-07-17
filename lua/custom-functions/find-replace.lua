local find_replace = {}

function find_replace.replace_selection(case_sensitive, confirm)
    vim.cmd([[normal! vgvy]])
    local selection = vim.fn.input("Find: ")
    local pattern = vim.fn.escape(selection, "\\/.*'$^~[]")
    local replacement = vim.fn.input("Replace with: ")

    local cmd = "%s/" .. pattern .. "/" .. replacement .. "/g"
    if case_sensitive then
      cmd = cmd .. "i"
    end
    if confirm then
        cmd = cmd .. "c"
    end

    vim.cmd(cmd)

    vim.o.hlsearch = false
    vim.fn.setreg("/", pattern)
end

return find_replace
