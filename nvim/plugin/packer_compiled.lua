-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/liquid_system/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/liquid_system/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/liquid_system/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/liquid_system/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/liquid_system/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FTerm.nvim"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/FTerm.nvim",
    url = "https://github.com/numToStr/FTerm.nvim"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/auto-pairs",
    url = "https://github.com/jiangmiao/auto-pairs"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["codicons.nvim"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/codicons.nvim",
    url = "https://github.com/mortepau/codicons.nvim"
  },
  ["devdocs.vim"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/devdocs.vim",
    url = "https://github.com/rhysd/devdocs.vim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["efm-langserver"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/efm-langserver",
    url = "https://github.com/mattn/efm-langserver"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["fern-hijack.vim"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/fern-hijack.vim",
    url = "https://github.com/lambdalisue/fern-hijack.vim"
  },
  ["fern-renderer-nerdfont.vim"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/fern-renderer-nerdfont.vim",
    url = "https://github.com/lambdalisue/fern-renderer-nerdfont.vim"
  },
  ["fern.vim"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/fern.vim",
    url = "https://github.com/lambdalisue/fern.vim"
  },
  ["fidget.nvim"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["glyph-palette.vim"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/glyph-palette.vim",
    url = "https://github.com/lambdalisue/glyph-palette.vim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/morhetz/gruvbox"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/lightline.vim",
    url = "https://github.com/itchyny/lightline.vim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  neon = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/neon",
    url = "https://github.com/rafamadriz/neon"
  },
  ["nerdfont.vim"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/nerdfont.vim",
    url = "https://github.com/lambdalisue/nerdfont.vim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["oceanic-next"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/oceanic-next",
    url = "https://github.com/mhartington/oceanic-next"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/onedark.vim",
    url = "https://github.com/joshdick/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-auto-save"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/vim-auto-save",
    url = "https://github.com/vim-scripts/vim-auto-save"
  },
  ["vim-code-dark"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/vim-code-dark",
    url = "https://github.com/tomasiser/vim-code-dark"
  },
  ["vim-dogrun"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/vim-dogrun",
    url = "https://github.com/wadackel/vim-dogrun"
  },
  ["vim-nightfly-guicolors"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/vim-nightfly-guicolors",
    url = "https://github.com/bluz71/vim-nightfly-guicolors"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  },
  ["vimdoc-ja"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/vimdoc-ja",
    url = "https://github.com/vim-jp/vimdoc-ja"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/home/liquid_system/.local/share/nvim/site/pack/packer/start/vista.vim",
    url = "https://github.com/liuchengxu/vista.vim"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
