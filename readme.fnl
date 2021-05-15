(module readme {require {common sense.common}})

(def ensure-dependencies [:neovim-0.5.0+])

(def installation
  ""
  {:vim-plug "Plug 'gwimm/lililine.nvim'"
   :packer "use { 'gwimm/lililine.nvim' }"})

(def api-spec
  {:lililine.lines {:status "configurates the status bar"}})
