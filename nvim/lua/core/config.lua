-- clipboardの設定
if vim.loop.os_uname().sysname == "Darwin" then
  vim.g.clipboard = {
    name = "macOS-clipboard",
    copy = {
      ["+"] = "pbcopy",
      ["*"] = "pbcopy",
    },
    paste = {
      ["+"] = "pbpaste",
      ["*"] = "pbpaste",
    },
    cache_enabled = 0,
  }
elseif vim.fn.has "wsl" == 1 then
  vim.g.clipboard = {
    name = "WSLClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('`r', ''))",
      ["*"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('`r', ''))",
    },
    cache_enabled = 0,
  }
end

-- undoの永続化
if vim.fn.has "persistent_undo" then
  local target_path = vim.fn.expand "~/.undo/nvim"
  if not vim.fn.isdirectory(target_path) then
    vim.fn.mkdir(target_path, "p", 700)
  end
  vim.opt.undodir = target_path
  vim.opt.undofile = true
end
