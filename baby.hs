import Data.List
import Data.Char

double :: (Num a) => a -> a
double x = x + x

doubleTwo :: (Num a) => a -> a -> a
doubleTwo x y = double x + double y

doubleSmallNumber x = if x > 100 then x else double x

doubleSmallNumber' x = (if x > 100 then x else double x) + 1

conanO'Brien = "It's a-me, Conan O'Brien!"

boomBang xs = [if x < 10 then "Boom!" else "Bang!" | x <- xs, odd x]

length' xs = sum [1 | _ <- xs]

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [c | c <- st, c `elem` ['A' .. 'Z']]

rightTriangles = [(a, b, c) | c <- [1 .. 10], a <- [1 .. c], b <- [1 .. a], a ^ 2 + b ^ 2 == c ^ 2, a + b + c == 24]

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

-- factorial :: Int -> Int
-- factorial n = product [1..n]
factorial' :: Integer -> Integer
factorial' n = product [1 .. n]

circumference :: Float -> Float
circumference r = 2 * pi * r

circumference' :: Double -> Double
circumference' r = 2 * pi * r

lucky :: Int -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you're out of luck, pal!"

sayMe :: Int -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5"

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double)
-- addVectors a b = (fst a + fst b, snd a + snd b)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z

head' :: [a] -> a
-- head' [] = error "Can't call head on an empty list, dummy!"
-- head' (x:_) = x

tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x : []) = "The list has one element: " ++ show x
tell (x : y : []) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x : y : _) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y

badAdd :: (Num a) => [a] -> a
badAdd (x : y : z : []) = x + y + z

firstLetter :: String -> String
firstLetter "" = "Empty string, whoops!"
firstLetter all@(x : xs) = "The first letter of " ++ all ++ " is " ++ show x

-- bmiTell :: Double -> String
-- bmiTell bmi
--   | bmi <= 18.5 = "You're underweight, you emo, you!"
--   | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
--   | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
--   | otherwise = "You're a whale, congratulations!"
-- bmiTellByWeightAndHeight :: Double -> Double -> String
-- bmiTellByWeightAndHeight weight height = bmiTell (weight / height ^ 2)

max' :: (Ord a) => a -> a -> a
max' a b
  | a <= b = b
  | otherwise = a

compare' :: (Ord a) => a -> a -> Ordering
a `compare'` b
  | a < b = LT
  | a > b = GT
  | otherwise = EQ

bmiTell :: Double -> Double -> String
bmiTell weight height
  | bmi <= skinny = "You're underweight, you emo, you!"
  | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
  | bmi <= fat = "You're fat! Lose some weight, fatty!"
  | otherwise = "You're a whale, congratulations!"
  where
    bmi = weight / height ^ 2
    -- skinny = 18.5
    -- normal = 25.0
    -- fat = 30.0 -- インデントは揃える
    (skinny, normal, fat) = (18.5, 25.0, 30.0)

initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
  where
    (f : _) = firstname
    (l : _) = lastname

calcBmis :: [(Double, Double)] -> [Double]
-- calcBmis xs = [bmi w h | (w, h) <- xs]
--   where bmi weight height = weight / height ^ 2
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]

cylinder :: Double -> Double -> Double
cylinder r h =
  let sideArea = 2 * pi * r * h
      topArea = pi * r * 2
   in sideArea + 2 * topArea

head' xs = case xs of
  [] -> error "No head for empty lists!"
  (x : _) -> x

describeList :: [a] -> String
-- describeList ls =
--   "The list is "
--     ++ case ls of
--       [] -> "empty."
--       [x] -> "a singleton list."
--       xs -> "a longer list."
describeList ls =
  "The list is " ++ what ls
  where
    what [] = "empty."
    what [x] = "a singleton list."
    what xs = "a longer list."

fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list!"
maximum' [x] = x
maximum' (x : xs) = max x (maximum' xs)

replicate' :: Int -> a -> [a]
replicate' n x
  | n <= 0 = []
  | otherwise = x : replicate' (n - 1) x

take' :: Int -> [a] -> [a]
take' n _
  | n <= 0 = []
take' _ [] = []
take' n (x : xs) = x : take' (n - 1) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x : xs) = reverse' xs ++ [x]

repeat' :: a -> [a]
repeat' x = x : repeat' x

zip' :: [a] -> [b] -> [(a, b)]
zip' _ [] = []
zip' [] _ = []
zip' (x : xs) (y : ys) = (x, y) : zip' xs ys

elem' :: (Eq a) => a -> [a] -> Bool
-- elem' a [] = False
-- elem' a (x : xs)
--   | a == x = True
--   | otherwise = a `elem'` xs
-- elem' y ys = foldr (\x acc -> if x == y then True else acc) False ys
elem' y ys = foldr f False ys
  where
    f x acc = if x == y then True else acc

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
-- quicksort (x : xs) = quicksort smallerOrEqual ++ [x] ++ quicksort larger
--   where
--     smallerOrEqual = [a | a <- xs, a <= x]
--     larger = [a | a <- xs, a > x]
quicksort (x : xs) =
  let smallerOrEqual = filter (<= x) xs
      larger = filter (> x) xs
   in quicksort smallerOrEqual ++ [x] ++ quicksort larger

compareWithHundred :: Int -> Ordering
compareWithHundred = compare 100

divideByTen :: (Floating a) => a -> a
divideByTen = (/ 10)

divideTenBy :: (Floating a) => a -> a
divideTenBy = (10 /)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A' .. 'Z'])

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x : xs) (y : ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> (b -> a -> c)
-- flip' f = g
--   where
--     g x y = f y x
-- flip' f x y = f y x
flip' f = \x y -> f y x

largestDivisible :: Integer
largestDivisible = head (filter p [100000, 99999 ..])
  where
    p x = x `mod` 3829 == 0

oddSquareSum :: Integer
oddSquareSum = sum oddSquares
  where
    oddSquares = takeWhile (< 10000) (filter odd squares)
    squares = map (^ 2) [1 ..]

chain :: Integer -> [Integer]
chain 1 = [1]
chain x
  | even x = x : chain (x `div` 2)
  | odd x = x : chain (x * 3 + 1)

numLongChains :: Int
-- numLongChains = length (filter isLong (map chain [1 .. 100]))
--   where
--     isLong xs = length xs >= 15
numLongChains = length (filter (\xs -> length xs >= 15) (map chain [1 .. 100]))

sum' :: (Num a) => [a] -> a
-- sum' xs = foldl (\acc x -> acc + x) 0 xs
sum' = foldl (+) 0

prod :: (Num a) => [a] -> a
-- prod xs = foldl (\acc x -> acc * x) 1 xs
prod = foldl (*) 1

sentencing :: [[Char]] -> [Char]
sentencing (x : xs) = foldl (\acc str -> acc ++ " " ++ str) x xs

map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x acc -> f x : acc) [] xs

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

wordNums :: String -> [(String, Int)]
wordNums = map (\ws -> (head ws, length ws)) . group . sort . words

isIn :: (Eq a) => [a] -> [a] -> Bool
needle `isIn` haystack = any (needle `isPrefixOf`) (tails haystack)
-- isInfixOf

encode :: Int -> String -> String
-- encode offset msg = map (\c -> chr $ ord c + offset) msg
encode offset msg = map (chr . (+ offset) . ord) msg

decode :: Int -> String -> String
decode shift msg = encode (negate shift) msg

digitSum :: Int -> Int
digitSum = sum . map digitToInt . show

firstTo40 :: Maybe Int
firstTo40 = find  (\x -> digitSum x == 40) [1..]

firstTo :: Int -> Maybe Int
firstTo n = find (\x -> digitSum x == n) [1..]

-- findKey :: (Eq k) => k -> [(k, v)] -> v
-- findKey key xs = snd . head . filter (\(k, v) -> key == k) $ xs

findKey :: (Eq k) => k -> [(k, v)] -> Maybe v
-- findKey key [] = Nothing
-- findKey key ((k, v) : xs)
--   | key == k = Just v
--   | otherwise = findKey key xs
-- implementation by folding
findKey key xs = foldr (\(k, v) acc -> if key == k then Just v else acc) Nothing xs
