{; wraps call in xpcall
 :safe-call
 (fn [f]
   `(let [core# (require :aniseed.core)
          fennel# (require :aniseed.fennel)]
     (xpcall ,f #(core#.println (fennel#.traceback $1)))))

 ; anaphoric if
 :aif
 (fn [test-form then-form else-form]
   `(let [,(sym :it) ,test-form]
      (if it ,then-form ,else-form)))}
