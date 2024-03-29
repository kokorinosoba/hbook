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
| error        | raise an error                                              |
| map          | apply a function to all elements of the list                |
| filter       | filter the list with a condition expression                 |
| even         | return True if the element is even                          |
| odd          | return True if the element is odd                           |
| not          | return the negated boolean value                            |
| null         | return True if the list is null                             |
| takeWhile    | return the elements until the condition is met as a list    |
| negate       | invert the sign of a number                                 |
| nub          | remove duplicate elements of a list                         |
| words        | convert the string to a list of words split by space        |
| group        | group adjacent elements together                            |
| sort         | sort the list elements                                      |
| tails        | apply tail function to a list repeatedly                    |
| isPrefixOf   | return True if the 2nd list begins with the 1st list        |
| any          | return True if a list has True                              |
| isInfixOf    | return True if a list included by another list              |
| ord          | return the ordinal value of a letter                        |
| chr          | return a letter corresponding to the number                 |
| find         | find the first value in a list that matches the condition   |

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
    - 解の候補の集合を生成し、解にたどり着くまで変換とフィルタリングを行う手法は関数プログラミングでよく用いられる
  - `x /= y`は除算複合代入演算子かと思いきや、`x != y`という意味
- タプル
  - 違う方の要素が格納できる
  - サイズが固定
  - `(1,2)`と`(1,2,3)`は違う型として扱われる
    - 要素の数とそれぞれの要素の型が一致していると同じ型
  - 単一要素のタプルは存在しない
    - `(1)`は`1`として評価される
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
- 関数の構文
  - パターンマッチ
    - 上から順番に調べ，対応する関数が実行される
    - 再帰関数を書く際にも使える
  - リストのパターンマッチ
    - `let xs = [(1,3),(4,3),(2,4),(5,3),(5,6),(3,1)]`
    - `[x*100+3 | (x, 3) <- xs]`
  - asパターン
    - パターンマッチの対象になった値自体もサイン称したいときに使う
  - 結局パターンマッチとは?
    - 次の2つの要素から成り立っているような気がする
    - 数値のパターンマッチ
      - 数値にマッチしたときにその関数を実行
    - 型のパターンマッチ
      - Pythonでいうアンパック代入ができたら(?)その関数を実行
    - 引数の構造で場合分けをするとき
  - ガード
    - ifっぽく書ける
    - 式がTrueとして評価されたらその関数を実行
  - where節
    - 関数内で使われる値を数式みたいに定義できる
    - whereブロック内のインデントは揃える必要がある
    - whereブロックで定義した変数はwhereが含まれるパターンからしか参照できない
  - let式
    - `let bindings in expression`
    - letで定義した変数はlet式全体で見える
    - letは式
      - 値を持つということ
      - 式のため，コードのほとんどどんな場所でも使える
        - `4 * (let a = 9 in a + 1) + 2`
        - `[let square x = x * x in (square 5, square 3, square 2)]`
        - `let a = 100; b = 200; c = 300 in a + b + c`
    - ガードをまたいでは使えない
    - whereのほうが関数の後ろで部品を定義できるので，コードが読みやすくなる(?)
  - case式
    - コード中のどこでもパターンマッチが使える
    - 関数の引数に対するパターンマッチはcase式の糖衣構文になっている
    - `case expression of pattern -> result`
    - `                   pattern -> result`
- 再帰
  - 計算をどうやってするかではなく，求めるものが何であるかを宣言する
  - ほしい結果が何であるかを直接定義するのがHaskell
  - 再帰関数の考え方
    - 基底部を考える
    - 1つもしくはそれ以上の部分問題に分解し，自分自身を適用する
- カリー化
  - 2引数以上の関数を，1引数の関数の定義だけで同じような機能を持つように定義を書き換えること
  - Haskellでは全ての関数は引数を一つだけ取る
  - 引数が２つのとき，一つの引数に対して関数を適用し，新たな関数を返す
    - `max 4 5`は`(max 4) 5`と等価
    - `max :: Ord a => a -> a -> a`
      - `->`を型シグネチャに含むものは全て関数
      - 左側にあるものを引数に取り，右側にあるものを型とする値を返す
        - `a -> a -> a`これは`a -> (a -> a)`こういうこと
  - カリー化されていると，部分適用された関数が得られる
  - セクション
    - 中置関数を部分適用する方法
    - 中置関数の片側に値を置いて括弧で囲む
      - ``(`elem` ['A'..'Z'])``
  - 関数はShow型クラスのインスタンスではないため，コンソールには表示できない
- 高階関数
  - 関数を引数として受け取って処理する
  - 1引数の関数を渡す必要があるときは，部分適用によって1引数の関数を作って渡せば良い
  - map関数
    - リストの全てに適用して新しいリストを返す
  - filter関数
    - 述語とリストを受け取り，述語を満たす要素のリストを返す
    - 述語: 真偽値を返すもの
- ラムダ式
  - `(\arg -> definition)`
  - 普通は括弧で囲む
- 畳み込み
  - 左畳み込み
    - `foldl f init [list]`
  - `foo a = bar b a`は`foo = bar b`で書き換えることができる
  - 右畳み込み
    - `foldr f init [list]`
    - `++`関数は`:`よりもはるかに遅いので，リストから新しいリストを生成する場合には右畳み込みを使う
    - 右畳み込みは無限リストに対しても動作する
- 関数適用
  - `$`は最も低い優先順位を持つ
  - `sum (map sqrt [1..10])`を`sum $ map sqrt [1..10]`と書き換えることができる
- 合成関数
  - `.`で合成関数を表す
  - `map (\x -> negate (abs x)) [-5..5]`は`map (negate . abs) [-5..5]`と表せる
  - 一番内側の関数に`$`で関数適用を行い、その外側の関数は合成関数として表す
  - ポイントフリースタイル
    - 関数定義の一時変数$f(x)$の$x$を使わずに関数を定義するスタイルのこと
    - `fn x = ceiling (negate (tan (cos (max 50 x))))`は`fn = ceiling . negate . tan . cos . max 50`として表せる
- モジュール
  - インポート
    - `import ModuleName`
    - `:m + Data.List Data.Map Data.Set`: GHCiでのロード
    - `import Data.List (nub, sort)`: 関数を選択してのインポート
    - `import Data.List hiding (nub)`: 特定の関数を読み込まない
    - `import qualified Data.Map`: 修飾付きインポート(関数の参照はフルネームで行う)
    - `import qualified Data.Map as M`: エイリアスをつけてのインポート
    - 合成関数とモジュール関数の`.`の違いは空白が空いているかどうか
    - モジュール名は大文字で始まり、関数名は小文字で始まる
- 正格な左畳み込み
  - 遅延評価しない左畳み込み: `Data.List.fold'`
- Maybe
  - 0個か1個の要素だけを持てる型
  - 何も値がないときは`Nothing`となる
  - 値がある場合は`Just`が付いた形
- 連想リスト(辞書)
  - リストに対する標準的な再帰パターンでは畳み込みを使ったほうがよい
