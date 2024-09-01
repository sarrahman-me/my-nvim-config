-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "everblush",
  theme_toggle = { "everblush", "onedark" },

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.ui = {
  statusline = {
    theme = "minimal",
    separator_style = "round",
  },
  -- transparency = true,

  nvdash = {
    load_on_startup = true,
    header = {
      "                                                                                                                     ",
      ".x888888hx    :                                                     .uef^`                                          ",
      "d88888888888hxx                 .u    .      .u    .               :d88E          ..    .     :                   u.    u.   ",
      '8" ... `*8888%`        u      .d88B :@8c   .d88B :@8c        u     `888E        .888: x888  x888.        u      x@88k u@88c. ',
      '!  "   ` .xnxx.       us888u.  ="8888f8888r ="8888f8888r    us888u.   888E .z8k  ~`8888~\'888X`?888f`    us888u.  ^"8888""8888" ',
      'X X   .H8888888%:  .@88 "8888"   4888>\'88"    4888>\'88"  .@88 "8888"  888E~?888L   X888  888X \'888>  .@88 "8888"   8888  888R  ',
      "X 'hn8888888*\"   > 9888  9888    4888> '      4888> '    9888  9888   888E  888E   X888  888X '888>  9888  9888    8888  888R  ",
      "X: `*88888%`     ! 9888  9888    4888>        4888>      9888  9888   888E  888E   X888  888X '888>  9888  9888    8888  888R  ",
      "'8h.. \"     ..x8> 9888  9888   .d888L .+    .d888L .+   9888  9888   888E  888E   X888  888X '888>  9888  9888    8888  888R  ",
      ' `88888888888888f  9888  9888   ^"8888*"     ^"8888*"    9888  9888   888E  888E  "*88%""*88" \'888!` 9888  9888   "*88*" 8888" ',
      '  \'%8888888888*"   "888*""888"     "Y"          "Y"      "888*""888" m888N= 888>    `~    "    `"`   "888*""888"    ""   \'Y"   ',
      '     ^"****""`      ^Y"   ^Y\'                             ^Y"   ^Y\'   `Y"   888                       ^Y"   ^Y\'                ',
      '                                                                          " J88"                                                ',
      '                                                                          " @%                                                  ',
      '                                                                         :"                                                    ',
    },
  },
}

return M
