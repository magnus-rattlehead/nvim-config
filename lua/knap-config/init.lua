local gknapsettings = {
    mdtopdfviewerlaunch = "mupdf %outputfile%",
    mdtopdfviewerrefresh = "kill -HUP %pid%",
    markdowntopdfviewerlaunch = "mupdf %outputfile%",
    markdowntopdfviewerrefresh = "kill -HUP %pid%",
    textopdfviewerlaunch = "mupdf %outputfile%",
    textopdfviewerrefresh = "kill -HUP %pid%",
    textopdfforwardjump = false
}
vim.g.knap_settings = gknapsettings
