local _0_0
do
  local name_0_ = "lililine"
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
    return {require("aniseed.core"), require("util")}
  end
  ok_3f_0_, val_0_ = pcall(_1_)
  if ok_3f_0_ then
    _0_0["aniseed/local-fns"] = {["require-macros"] = {macros = true}, require = {core = "aniseed.core", util = "util"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _1_(...)
local core = _local_0_[1]
local util = _local_0_[2]
local _2amodule_2a = _0_0
local _2amodule_name_2a = "lililine"
do local _ = ({nil, _0_0, nil, {{nil}, nil, nil, nil}})[2] end
local lines
do
  local v_0_
  do
    local v_0_0 = {status = {{{provider = "unconfigured line"}}}}
    _0_0["lines"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["lines"] = v_0_
  lines = v_0_
end
local render
do
  local v_0_
  do
    local v_0_0
    local function render0(name)
      local function _2_()
        local tbl_0_ = {}
        local function _3_()
          local it = lines[name]
          if it then
            return it
          else
            return {}
          end
        end
        for section_index, section in ipairs(_3_()) do
          local function _4_()
            local tbl_0_0 = {}
            local function _5_()
              local it = section
              if it then
                return it
              else
                return {}
              end
            end
            for component_index, component in ipairs(_5_()) do
              local _6_
              do
                local _let_0_ = component
                local condition = _let_0_["condition"]
                local highlight = _let_0_["highlight"]
                local provider = _let_0_["provider"]
                local render_highlight
                do
                  local v_0_1
                  do
                    local v_0_2
                    local function render_highlight0()
                      if core["string?"](highlight) then
                        return ("%#" .. highlight .. "#")
                      end
                    end
                    v_0_2 = render_highlight0
                    _0_0["render-highlight"] = v_0_2
                    v_0_1 = v_0_2
                  end
                  local t_0_ = (_0_0)["aniseed/locals"]
                  t_0_["render-highlight"] = v_0_1
                  render_highlight = v_0_1
                end
                local render_component
                do
                  local v_0_1
                  do
                    local v_0_2
                    local function render_component0()
                      local _7_
                      do
                        local it = render_highlight()
                        if it then
                          _7_ = it
                        else
                          _7_ = ""
                        end
                      end
                      local _9_
                      do
                        local _8_0 = type(provider)
                        if (_8_0 == "string") then
                          _9_ = provider
                        elseif (_8_0 == "function") then
                          _9_ = ("%{luaeval('require(\"lililine\").draw')" .. "(\"" .. name .. "\", " .. section_index .. ", " .. component_index .. ")}")
                        else
                        _9_ = nil
                        end
                      end
                      return (_7_ .. _9_ .. "%#Normal#")
                    end
                    v_0_2 = render_component0
                    _0_0["render-component"] = v_0_2
                    v_0_1 = v_0_2
                  end
                  local t_0_ = (_0_0)["aniseed/locals"]
                  t_0_["render-component"] = v_0_1
                  render_component = v_0_1
                end
                local function _7_()
                  local it = condition
                  if it then
                    return it()
                  else
                    return true
                  end
                end
                if (provider and _7_()) then
                  _6_ = render_component()
                else
                _6_ = nil
                end
              end
              tbl_0_0[(#tbl_0_0 + 1)] = _6_
            end
            return tbl_0_0
          end
          tbl_0_[(#tbl_0_ + 1)] = util.concat(_4_())
        end
        return tbl_0_
      end
      return util.intercalate("%=", _2_())
    end
    v_0_0 = render0
    _0_0["render"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["render"] = v_0_
  render = v_0_
end
local draw
do
  local v_0_
  do
    local v_0_0
    local function draw0(name, section_index, component_index)
      local _let_0_ = core["get-in"](lines, {name, section_index, component_index})
      local highlight = _let_0_["highlight"]
      local provider = _let_0_["provider"]
      local ok, widget = nil, nil
      do
        local core_0_ = require("aniseed.core")
        local fennel_0_ = require("aniseed.fennel")
        local function _2_(_241)
          return core_0_.println(fennel_0_.traceback(_241))
        end
        ok, widget = xpcall(provider, _2_)
      end
      local group
      if core["string?"](highlight) then
        group = highlight
      else
      group = nil
      end
      local function _3_()
        if ok then
          local _3_0 = type(widget)
          if (_3_0 == "string") then
            return widget
          elseif (_3_0 == "table") then
            local _let_1_ = widget
            local color = _let_1_["color"]
            local text = _let_1_["text"]
            do
              local it = color
              if it then
                local _4_
                if core["string?"](highlight) then
                  _4_ = highlight
                else
                  _4_ = group
                end
                util.color["add-group"](_4_, it)
              end
            end
            return text
          end
        else
          util.color["add-group"](group, util.color["get-group"]("ErrorMsg"))
          return (" " .. widget .. " ")
        end
      end
      return (" " .. _3_())
    end
    v_0_0 = draw0
    _0_0["draw"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["draw"] = v_0_
  draw = v_0_
end
local async_register
do
  local v_0_
  do
    local v_0_0
    local function async_register0(f)
      return vim.loop.new_async(vim.schedule_wrap(f))
    end
    v_0_0 = async_register0
    _0_0["async-register"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["async-register"] = v_0_
  async_register = v_0_
end
local async
do
  local v_0_
  do
    local v_0_0
    local function _2_()
      vim.wo.statusline = render("status")
      return nil
    end
    v_0_0 = async_register(_2_)
    _0_0["async"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["async"] = v_0_
  async = v_0_
end
local events
do
  local v_0_
  do
    local v_0_0 = {"ColorScheme", "FileType", "BufWinEnter", "BufReadPost", "BufWritePost", "BufEnter", "WinEnter", "FileChangedShellPost", "VimResized", "TermOpen"}
    _0_0["events"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["events"] = v_0_
  events = v_0_
end
local load_line
do
  local v_0_
  do
    local v_0_0
    local function load_line0()
      return async:send()
    end
    v_0_0 = load_line0
    _0_0["load_line"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["load_line"] = v_0_
  load_line = v_0_
end
local register_line
do
  local v_0_
  do
    local v_0_0
    local function register_line0()
      local cmd = vim.api.nvim_command
      cmd("augroup galaxyline")
      cmd("autocmd!")
      for _, event in ipairs(events) do
        cmd(("autocmd " .. event .. " * lua require(\"lililine\").load_line()"))
      end
      return cmd("augroup END")
    end
    v_0_0 = register_line0
    _0_0["register_line"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_0)["aniseed/locals"]
  t_0_["register_line"] = v_0_
  register_line = v_0_
end
return nil