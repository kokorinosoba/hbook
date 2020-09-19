# 関数
| Function     | Description                                                 |
| ------------ | ----------------------------------------------------------- |
| succ         | return its successor(next value)                            |
| pred         | return its predecessor(next value)                          |
| min          | return the minimum value                                    |
| max          | return the maximum value                                    |
| div          | return the division value                                   |
| head         | return the head value                                       |
| tail         | return the list except the head                             |
| last         | return the last value                                       |
| init         | return the list except the last                             |
| length       | return the list length                                      |
| null         | return if the list is null                                  |
| reverse      | return the reversed list                                    |
| take         | return the specified number of items from the first         |
| drop         | return the specified number of items removed from the first |
| maximum      | return the maximum number of items                          |
| minimum      | return the minimum number of items                          |
| sum          | return the sum of items                                     |
| product      | return the product of items                                 |
| elem         | return if the specified number is included in the list      |
| cycle        | return the infinite cycled list of items                    |
| repeat       | return the infinite list of the repeated number             |
| replicate    | return the list consisting of single numbers                |
| fst          | return the first element of the tuple                       |
| snd          | return the second element of the tuple                      |
| zip          | return the pair of value from the two lists                 |
| compare      | compare two values and return any one from LT, EQ, GT       |
| show         | return the string of the value                              |
| read         | convert the string to the value with specified type         |
| minBound     | return the minimum value of its type                        |
| maxBound     | return the maximum value of its type                        |
| fromIntegral | return the Integer value                                    |


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
- タプル
  - 違う方の要素が格納できる
  - サイズが固定
  - `(1,2)`と`(1,2,3)`は違う型として扱われる
    - 要素の数とそれぞれの要素の型が一致していると同じ型
- 型
  - 型の確認: `:t 'a'`
  - 関数を書くときには型を指定するといい
    - `removeNonUppercase :: [Char] -> [Char]`
    - ``removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]``
- 型変数
  - どんな型も取り得る型 = 型変数: ジェネリクスみたいなもの
  - 多相的関数: 型変数を用いる関数
- 型クラス
  - 何らかの振る舞いを定義するインターフェイス
    - インスタンスの型は型クラスの振る舞いを実装する
  - 関数の集まりを定める
    - メソッド: ある型クラスに属する関数
  - ただし，オブジェクト指向のクラスとは異なる
  - `+`, `-`, `*`, `/`などは実際には関数
    - 関数名が特殊文字からなる場合，デフォルトで中置関数になる
    - 前置関数として呼び出すには括弧でくくる`(+)`
  - 型クラス制約: `=>`
    - 引数の型に制約をかけることができる
  - 型が関数を実装している => その関数が特定の方に対して使われたときに，どういう振る舞いをするか定義すること
  - 型クラスの例
    - Eq型クラス: `==`, `/=`
    - Ord型クラス: `>`, `<`, `>=`, `<=`
      - 関数を除いてすべてOrdのインスタンス
      - compare関数: LT, GT, EQのいずれかを返す
    - Show型クラス
      - 関数を除いてすべてShowのインスタンス
      - show関数: 文字列として返す
    - Read型クラス
      - 関数を除いてすべてReadのインスタンス
      - Showと対をなす
      - 文字列を受け取り，Readのインスタンスの型の値を返す
      - `read "5" + 2`: 型推論が効く場合
      - `read "5" :: Int`: 型推論が効かない場合 => 型注釈を使う
    - Enum型クラス
      - 列挙型
      - レンジの中で使える
      - succとpredも定義される
      - Enumクラスのインスタンスとして，(), Bool, Char, Ordering, Int, Float, Doubleなどがある
      - `['a'..'e']`, `[LT .. GT]`
    - Bounded型クラス
      - 上限と下限を持ち，minBoundとmaxBound関数で調べることが可能
      - `(Bounded a) => a`: 多相定数
    - Num型クラス
      - 数の型クラス
      - Int, Integer, Float, Doubleとして振る舞うことができる
      - 5はInt, Integerのどちらとしても振る舞うことができる
    - Floating型クラス
      - Float, Doubleを含む
      - 例: sin, cos, sqrtなど
    - Integral
      - Int, Integerを含む
      - fromIntegral
