(module lililine.util.color
  {autoload {core aniseed.core}
   require {util lililine.util}
   require-macros [macros]})

(def attr-list [:bold :italic :underline :undercurl :strikethrough :reverse
                :inverse :italic :standout :nocombine])

(defn add-group [group attrs]
  (let [{:bg background :fg foreground :style style} attrs]
    (vim.cmd
      (.. "hi " group
          (aif foreground (.. " guifg='" it "'") "")
          (aif background (.. " guibg='" it "'") "")
          (aif style (.. " gui='" (util.intercalate "," it) "'") "")))))

(defn add-groups [groups]
  (each [group attrs (pairs groups)]
    (add-group group attrs)))

(defn get-group [group]
  (let [data (vim.api.nvim_get_hl_by_name group true)
        style []]
    (each [_ k (ipairs attr-list)]
      (when (. data k) (table.insert style k)))
    {:bg (string.format "#%x" data.background)
     :fg (string.format "#%x" data.foreground)
     :style (if (core.empty? style) nil style)}))


(defn get-groups [groups]
  (collect [_ group (ipairs groups)]
    (values group (get-group group))))

