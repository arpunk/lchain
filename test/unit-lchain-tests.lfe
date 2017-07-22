(defmodule unit-lchain-tests
  (behaviour ltest-unit)
  (export all)
  (import
    (from ltest
      (check-failed-assert 2)
      (check-wrong-assert-exception 2))))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest lchain-genesis-block
  (let [(genesis (lchain:genesis))]
    (is-equal 0 (lchain:get-block-index genesis))))

(deftest lchain-next-block
  (let* [(genesis (lchain:genesis))
         (next-block (lchain:next-block genesis #"data"))]
    (is-equal 1 (lchain:get-block-index next-block))
    (is-not-equal genesis next-block)))