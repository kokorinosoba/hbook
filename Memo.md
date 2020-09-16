# 関数
| Function | Description                                                 |
| -------- | ----------------------------------------------------------- |
| succ     | return its successor(next value)                            |
| min      | return the minimum value                                    |
| max      | return the maximum value                                    |
| div      | return the division value                                   |
| head     | return the head value                                       |
| tail     | return the list except the head                             |
| last     | return the last value                                       |
| init     | return the list except the last                             |
| length   | return the list length                                      |
| null     | return if the list is null                                  |
| reverse  | return the reversed list                                    |
| take     | return the specified number of items from the first         |
| drop     | return the specified number of items removed from the first |
| maximum  | return the maximum number of items                          |
| minimum  | return the minimum number of items                          |
| sum      | return the sum of items                                     |
| product  | return the product of items                                 |
| elem     | return if the specified number is included in the list      |
| cycle    | return the infinite cycled list of items                    |
| repeat   | return the infinite list of the repeated number             |
| replicate | return the list consisting of single numbers |


# 記法について
- ファイルの読み込み: `:l filename.hs`
- 関数
  - 関数の定義: `func x = x + x`
  - 演算子よりも優先順位が高い
  - 中置関数: ``a `func` b``
  - 関数名には`'`が使える
    - 慣習的に正格(遅延ではない)版の関数に使われる
    - 少し変更したバージョンの関数名にも使われる
  - 大文字始まりの関数名は使えない
  - 定義・名前
    - 関数が引数を受け取らないときにこう呼ばれる
    -
- if式: `if xxx == yyy then xxx else yyy`
  - elseが必須
  - ifがなにかの値を必ず返す必要があるため
  - 文ではなく式
- リスト
  - `name = [1,2,3,4]`
    - ghci上では`let name = [1,2,3,4]`と書く必要がある
  - 連結演算子: `++`
    - 文字列は文字のリストなので，`++`で連結できる
  - cons演算子: `:`
    - `5:[1,2,3,4]` => [5,1,2,3,4]
    - `[1,2,3]`は`1:2:3:[]`の糖衣構文
  - 要素へのアクセス: `!!`
    - `[1,2,3,4] !! 0` => 1
  - 比較演算子を使うと辞書順で比較される
  - レンジ: `[1..20]`, `['a'..'z']`
  - ステップレンジ: `[2,4..20]`
  - 遅延評価なので，無限リストを作れる: `take 24 [13,26..]`
  - レンジでは小数を使わない(精度の問題)
  - リスト内包表記
    - `[x*2 | x <- [1..10]]`
    - `[出力パート | 束縛, 述語, 述語, ...]`
    - 述語でフィルターができる
    - `[x+y | x <- [1..3], y <- [10, 100, 1000], x+y > 100, x+y < 1003]`
