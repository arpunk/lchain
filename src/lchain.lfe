#|
@doc
  lchain public API
@end
|#

(defmodule lchain
  (export (genesis 0)
          (next-block 2)
          (get-block-index 1)
          (get-block-hash 1)))

(include-lib "lchain/include/block.lfe")

;;; API

(defun genesis []
  (hash-block
   (make-block data #"genesis" previous-hash #"0")))

(defun next-block
  ([(match-block index current-index hash current-hash) data]
   (hash-block
    (make-block index (+ 1 current-index)
                data data
                previous-hash current-hash))))

;;; Misc

(defun get-block-hash [block] (block-hash block))

(defun get-block-index [block] (block-index block))

;;; Internal functions

(defun hash-block [block]
  (set-block-hash block (make-sha block)))

(defun make-sha [block]
  (let [(bin (erlang:term_to_binary block))]
    (crypto:hash 'sha256 bin)))