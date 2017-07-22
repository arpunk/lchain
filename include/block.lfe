(defrecord block
  (index 0)
  (timestamp (erlang:universaltime))
  data
  previous-hash
  hash)

(defun block-loaded []
  'block-loaded)