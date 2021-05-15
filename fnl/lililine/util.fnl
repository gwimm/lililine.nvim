(module lililine.util
  {require {core aniseed.core
            color lililine.util.color}})

(def color color)

(defn dbg [x] (print (.. (tostring x) " => " (vim.inspect x))) x)

(defn concat [xs]
  "Concatenates a list of lists."
  (core.reduce (pick-args 2 ..) "" xs))

(defn intersperse [x xs]
  "Takes an element and a list and `intersperses` that element between the
   elements of the list. For example,

   >>> (intersperse ',' \"abcde\")
   \"a,b,c,d,e\""
   (when (not (core.empty? xs))
     (let [result [(core.first xs)]]
       (each [_ v (ipairs (core.rest xs))]
         (table.insert result x)
         (table.insert result v))
       result)))

(defn intercalate [xs xss]
  "Inserts the list xs in between the lists in xss and concatenates the result."
  (concat (intersperse xs xss)))
