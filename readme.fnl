(module readme {require {common sense.common}})

(def ensure-dependencies [:neovim-0.5.0+])

(def installation
  "Installing lilililine through a package manager:
  if you wish to use nvim's pack, then you're knowledgable enough to do this
  without instructions.
  P.S. rock n' roll"
  {:vim-plug "Plug 'gwimm/lililine.nvim'"
   :packer "use { 'gwimm/lililine.nvim' }"})

(def api-spec
  {:lililine.lines
   {:status
    [[{:provider "configurates the status bar"}
      {:provider common.status-line-component
       :highlight common.color}]]}})
