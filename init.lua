local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
-- call 
require("huy.config.keymaps")
require("huy.config.options")
require("lazy").setup("huy.plugins")
--set theme
vim.cmd([[colorscheme gruvbox]])
--turn off backgournd
vim.cmd [[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight SignColumn guibg=NONE ctermbg=NONE
  highlight VertSplit guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
]]

vim.cmd [[
    let g:ale_linters = {
        \ "python": ["ruff"],
        \ }
    let g:ale_fixers = {
        \ "python": ["black", "ruff"],
        \ }
    let g:ale_fix_on_save = 1
]]
vim.cmd [[
    let g:ale_linters = {
        \ "python": ["ruff"],
        \ }
    let g:ale_fixers = {
        \ "python": ["black", "ruff"],
        \ }
    let g:ale_fix_on_save = 1
]]

