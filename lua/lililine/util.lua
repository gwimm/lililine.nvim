local _2afile_2a = "fnl/lililine/util.fnl"
local _0_0
do
  local name_0_ = "lililine.util"
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
local autoload = (require("lililine.aniseed.autoload")).autoload
local function _1_(...)
  local ok_3f_0_, val_0_ = nil, nil
  local function _1_()
    return {require("lililine.util.color"), require("lililine.aniseed.core")}
  end
  ok_3f_0_, val_0_ = pcall(_1_)
  if ok_3f_0_ then
    _0_0["aniseed/local-fns"] = {require = {color = "lililine.util.color", core = "lililine.aniseed.core"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _1_(...)
local color = _local_0_[1]
local core = _local_0_[2]
local _2amodule_2a = _0_0
local _2amodule_name_2a = "lililine.util"
do local _ = ({nil, _0_0, nil, {{}, nil, nil, nil}})[2] end
local color0
do
  local v_0_
  do
    local v_0_0 = color
    _0_0["color"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["color"] = v_0_
  color0 = v_0_
end
local dbg
do
  local v_0_
  do
    local v_0_0
    local function dbg0(x)
      print((tostring(x) .. " => " .. vim.inspect(x)))
      return x
    end
    v_0_0 = dbg0
    _0_0["dbg"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["dbg"] = v_0_
  dbg = v_0_
end
local concat
do
  local v_0_
  do
    local v_0_0
    local function concat0(xs)
      local function _4_(_2_0, _3_0)
        return (_2_0 .. _3_0)
      end
      return core.reduce(_4_, "", xs)
    end
    v_0_0 = concat0
    _0_0["concat"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["concat"] = v_0_
  concat = v_0_
end
local intersperse
do
  local v_0_
  do
    local v_0_0
    local function intersperse0(x, xs)
      if not core["empty?"](xs) then
        local result = {core.first(xs)}
        for _, v in ipairs(core.rest(xs)) do
          table.insert(result, x)
          table.insert(result, v)
        end
        return result
      end
    end
    v_0_0 = intersperse0
    _0_0["intersperse"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["intersperse"] = v_0_
  intersperse = v_0_
end
local intercalate
do
  local v_0_
  do
    local v_0_0
    local function intercalate0(xs, xss)
      return concat(intersperse(xs, xss))
    end
    v_0_0 = intercalate0
    _0_0["intercalate"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["intercalate"] = v_0_
  intercalate = v_0_
end
return nil