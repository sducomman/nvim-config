-- This is my personal Nvim configuration supporting Mac, Linux and Windows, with various plugins configured.
-- This configuration evolves as I learn more about Nvim and become more proficient in using Nvim.
-- Since it is very long (more than 1000 lines!), you should read it carefully and take only the settings that suit you.
-- I would not recommend cloning this repo and replace your own config. Good configurations are personal,
-- built over time with a lot of polish.
--
-- Author: Jiedong Hao
-- Email: jdhao@hotmail.com
-- Blog: https://jdhao.github.io/
-- GitHub: https://github.com/jdhao
-- StackOverflow: https://stackoverflow.com/users/6064933/jdhao
vim.loader.enable()

local utils = require("utils")

<<<<<<< HEAD
-- check if we have the latest stable version of nvim
local expected_ver = "0.11.0"
local ev = version.parse(expected_ver)
local actual_ver = version()
=======
local expected_version = "0.10.2"
utils.is_compatible_version(expected_version)
>>>>>>> d715ce8f31d4251f2695cddf30df5b2f4908d8bd

local config_dir = vim.fn.stdpath("config")
---@cast config_dir string

<<<<<<< HEAD
if  result ~= 0 then
  local _ver = string.format("%s.%s.%s", actual_ver.major, actual_ver.minor, actual_ver.patch)
  local msg = string.format("Expect nvim %s, but got %s instead. Use at your own risk!", expected_ver, _ver)
  vim.api.nvim_err_writeln(msg)
end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- empty setup using defaults
require("nvim-tree").setup()

local core_conf_files = {
  "globals.lua", -- some global settings
  "options.vim", -- setting options in nvim
  "autocommands.vim", -- various autocommands
  "mappings.lua", -- all the user-defined mappings
  "plugins.vim", -- all the plugins installed and their configurations
  "colorschemes.lua", -- colorscheme settings
}

local viml_conf_dir = vim.fn.stdpath("config") .. "/viml_conf"
-- source all the core config files
for _, file_name in ipairs(core_conf_files) do
  if vim.endswith(file_name, 'vim') then
    local path = string.format("%s/%s", viml_conf_dir, file_name)
    local source_cmd = "source " .. path
    vim.cmd(source_cmd)
  else
    local module_name, _ = string.gsub(file_name, "%.lua", "")
    package.loaded[module_name] = nil
    require(module_name)
  end
end
=======
-- some global settings
require("globals")
-- setting options in nvim
vim.cmd("source " .. vim.fs.joinpath(config_dir, "viml_conf/options.vim"))
-- various autocommands
require("custom-autocmd")
-- all the user-defined mappings
require("mappings")
-- all the plugins installed and their configurations
vim.cmd("source ".. vim.fs.joinpath(config_dir, "viml_conf/plugins.vim"))
-- colorscheme settings
require("colorschemes")
>>>>>>> d715ce8f31d4251f2695cddf30df5b2f4908d8bd
