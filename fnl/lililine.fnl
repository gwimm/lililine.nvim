(module lililine
  {require {core aniseed.core
            util lililine.util}
   require-macros [macros]})

(def lines {:status [[{:provider "unconfigured line"}]]})

(defn render [name]
  "Iterates through `sections` building statusline string"
  (util.intercalate
    "%="
    (icollect [section-index section (ipairs (aif (. lines name) it []))]
      (util.concat
        (icollect [component-index component (ipairs (aif section it []))]
          (let [{:provider provider
                 :highlight highlight
                 :condition condition} component]

            (defn render-highlight []
              (when (core.string? highlight)
                (.. "%#" highlight "#")))

            (defn render-component []
              (.. (aif (render-highlight) it "")
                  (match (type provider)
                    :string provider
                    :function (.. "%{luaeval('require(\"lililine\").draw')"
                                  "(\"" name "\", " section-index
                                  ", " component-index ")}"))
                  "%#Normal#"))

            (if (and provider (aif condition (it) true))
              (render-component))))))))

(defn draw [name section-index component-index]
  "Provider call trampoline"
  (let [{:provider provider
         :highlight highlight} (core.get-in lines [name section-index component-index])
        (ok widget) (safe-call provider)
        group (when (core.string? highlight) highlight)]

    (defn decorate []
      (match (type widget)
        :string widget
        :table (let [{:text text :color color} widget]
                 (if group (do (aif color (util.color.add-group group it)) text)
                   " Missing highlight group "))))

    (def widget-drawn
        (if ok (aif (decorate) it "your code broke")))
          ; (do (util.color.add-group group (util.color.get-group :ErrorMsg))
          ;     (.. " " widget " ")))

    ; notice the obligatory `(.. " " x)` vim is stupid
    (.. " " widget-drawn)))

(defn async-register [f] (vim.loop.new_async (vim.schedule_wrap f)))

(def async (async-register #(set vim.wo.statusline (render :status))))

(def events ["ColorScheme" "FileType" "BufWinEnter" "BufReadPost"
             "BufWritePost" "BufEnter" "WinEnter" "FileChangedShellPost"
             "VimResized" "TermOpen"])

(defn load_line [] (async:send))

(defn register_line []
  (let [cmd vim.api.nvim_command]
    (cmd "augroup galaxyline")
    (cmd "autocmd!")
    (each [_ event (ipairs events)]
      (cmd (.. "autocmd " event " * lua require(\"lililine\").load_line()")))
    ; (cmd "autocmd WinLeave * lua require(\"status\").unload_line()")
    ; TODO ?
    (cmd "augroup END")))
