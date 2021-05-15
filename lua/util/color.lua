local _0_0
do
  local name_0_ = "util.color"
  local module_0_
  do
    local x_0_ = package.loaded[name_0_]
    if ("table" == type(x_0_)) then
      module_0_ = x_0_
    else
      module_0_ = {}
    end
  end
  module_0_["aniseed/module"] = name_0_
  module_0_["aniseed/locals"] = ((module_0_)["aniseed/locals"] or {})
  module_0_["aniseed/local-fns"] = ((module_0_)["aniseed/local-fns"] or {})
  package.loaded[name_0_] = module_0_
  _0_0 = module_0_
end
local autoload = (require("aniseed.autoload")).autoload
local function _1_(...)
  local ok_3f_0_, val_0_ = nil, nil
  local function _1_()
    return {autoload("aniseed.core"), require("util")}
  end
  ok_3f_0_, val_0_ = pcall(_1_)
  if ok_3f_0_ then
    _0_0["aniseed/local-fns"] = {["require-macros"] = {macros = true}, autoload = {core = "aniseed.core"}, require = {util = "util"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _1_(...)
local core = _local_0_[1]
local util = _local_0_[2]
local _2amodule_2a = _0_0
local _2amodule_name_2a = "util.color"
do local _ = ({nil, _0_0, nil, {{nil}, nil, nil, nil}})[2] end
local attr_list
do
  local v_0_
  do
    local v_0_0 = {"bold", "italic", "underline", "undercurl", "strikethrough", "reverse", "inverse", "italic", "standout", "nocombine"}
    _0_0["attr-list"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["attr-list"] = v_0_
  attr_list = v_0_
end
local add_group
do
  local v_0_
  do
    local v_0_0
    local function add_group0(group, attrs)
      local _let_0_ = attrs
      local background = _let_0_["bg"]
      local foreground = _let_0_["fg"]
      local style = _let_0_["style"]
      local _2_
      do
        local it = foreground
        if it then
          _2_ = (" guifg='" .. it .. "'")
        else
          _2_ = ""
        end
      end
      local _3_
      do
        local it = background
        if it then
          _3_ = (" guibg='" .. it .. "'")
        else
          _3_ = ""
        end
      end
      local function _4_()
        local it = style
        if it then
          return (" gui='" .. util.intercalate(",", it) .. "'")
        else
          return ""
        end
      end
      return vim.cmd(("hi " .. group .. _2_ .. _3_ .. _4_()))
    end
    v_0_0 = add_group0
    _0_0["add-group"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["add-group"] = v_0_
  add_group = v_0_
end
local add_groups
do
  local v_0_
  do
    local v_0_0
    local function add_groups0(groups)
      for group, attrs in pairs(groups) do
        add_group(group, attrs)
      end
      return nil
    end
    v_0_0 = add_groups0
    _0_0["add-groups"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["add-groups"] = v_0_
  add_groups = v_0_
end
local get_group
do
  local v_0_
  do
    local v_0_0
    local function get_group0(group)
      local data = vim.api.nvim_get_hl_by_name(group, true)
      local style = {}
      for _, k in ipairs(attr_list) do
        if data[k] then
          table.insert(style, k)
        end
      end
      local _2_
      if core["empty?"](style) then
        _2_ = nil
      else
        _2_ = style
      end
      return {bg = string.format("#%x", data.background), fg = string.format("#%x", data.foreground), style = _2_}
    end
    v_0_0 = get_group0
    _0_0["get-group"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["get-group"] = v_0_
  get_group = v_0_
end
local get_groups
do
  local v_0_
  do
    local v_0_0
    local function get_groups0(groups)
      local tbl_0_ = {}
      for _, group in ipairs(groups) do
        local _2_0, _3_0 = group, get_group(group)
        if ((nil ~= _2_0) and (nil ~= _3_0)) then
          local k_0_ = _2_0
          local v_0_1 = _3_0
          tbl_0_[k_0_] = v_0_1
        end
      end
      return tbl_0_
    end
    v_0_0 = get_groups0
    _0_0["get-groups"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["get-groups"] = v_0_
  get_groups = v_0_
end
return nil